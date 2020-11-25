//
//  CompoundFile.swift
//
//
//  Created by Hugh Bellamy on 06/10/2020.
//

import DataStream
import Foundation

public class CompoundFile: CustomStringConvertible {
    private var dataStream: DataStream
    private var header: CompoundFileHeader
    private let sectorSize: UInt32
    private let miniSectorSize: UInt32

    private var cachedSectors: [CompoundFileSector?]
    internal var directoryEntries: [CompoundFileDirectoryEntry] = []
    public lazy var rootStorage: CompoundFileStorage = {
        return CompoundFileStorage(file: self, entry: self.directoryEntries[0])
    }()
    
    public convenience init(data: Data) throws {
        var dataStream = DataStream(data)
        try self.init(dataStream: &dataStream)
    }

    public init(dataStream: inout DataStream) throws {
        self.dataStream = dataStream
        self.header = try CompoundFileHeader(dataStream: &dataStream)
        self.sectorSize = UInt32(pow(2, Double(header.sectorShift)))
        self.miniSectorSize = UInt32(pow(2, Double(header.miniSectorShift)))
        
        let numberOfSectors = Int(ceil((Double(dataStream.count) - Double(self.sectorSize)) / Double(self.sectorSize)))
        self.cachedSectors = [CompoundFileSector?](repeating: nil, count: numberOfSectors)
        
        self.directoryEntries = try loadDirectories()
    }

    private func getSectorChain(sectorId: UInt32, type: CompoundFileSector.SectorType) {
    }
    
    private func loadDirectories() throws -> [CompoundFileDirectoryEntry] {
        let directoryChain = try getNormalSectorChain(sectorId: header.firstDirectorySectorLocation)
        guard directoryChain.count > 0 else {
            throw CompoundFileError.noDirectories
        }
        
        if (header.firstDirectorySectorLocation == CompoundFileSector.ENDOFCHAIN) {
            header.firstDirectorySectorLocation = directoryChain[0].id
        }
        
        var directoryStream = StreamView(sectorChain: directoryChain,
                                         sectorSize: self.sectorSize,
                                         count: directoryChain.count * Int(self.sectorSize),
                                         dataStream: dataStream)
        var buffer = [UInt8](repeating: 0x00, count: 128)
        var entries: [CompoundFileDirectoryEntry] = []
        entries.reserveCapacity(directoryStream.count / buffer.count)
        while directoryStream.position < directoryStream.count {
            let numberOfBytesRead = try buffer.withUnsafeMutableBufferPointer {
                try directoryStream.read(to: $0, count: $0.count)
            }
            assert(numberOfBytesRead == buffer.count)
            
            var dataStream = DataStream(buffer)
            entries.append(try CompoundFileDirectoryEntry(dataStream: &dataStream, header: header))
        }
        
        return entries
    }
    
    private func getDIFATSectorChain() throws -> [CompoundFileSector] {
        /// [MS-CFB] 2.5 Compound File DIFAT Sectors
        /// The DIFAT array is used to represent storage of the FAT sectors. The DIFAT is represented by an array of 32-bit sector numbers. The
        /// DIFAT array is stored both in the header and in DIFAT sectors.
        /// In the header, the DIFAT array occupies 109 entries, and in each DIFAT sector, the DIFAT array occupies the entire sector minus 4 bytes.
        /// (The last field is for chaining the DIFAT sector chain.)
        /// The DIFAT sectors are linked together by the last field in each DIFAT sector. As an optimization, the first 109 FAT sectors are represented
        /// within the header itself. No DIFAT sectors are needed in a compound file that is smaller than 6.875 megabytes (MB) for a 512-byte sector
        /// compound file (6.875 MB = (1 header sector + 109 FAT sectors x 128 non-empty entries) × 512 bytes per sector).
        /// The DIFAT represents the FAT sectors in a different manner than the FAT represents a sector chain. A particular index, n, into the
        /// DIFAT array will contain the sector number of the (n+1)th FAT sector.
        /// For instance, index #3 in the DIFAT contains the sector number for the fourth FAT sector, because the DIFAT array starts with index #0.
        /// The storage for DIFAT sectors is reserved with the FAT, but it is not chained there. Space for DIFAT sectors is marked by a special sector
        /// number, DIFSECT (0xFFFFFFFC).
        /// The location of the first DIFAT sector is stored in the header.
        /// A special value of ENDOFCHAIN (0xFFFFFFFE) is stored in the "Next DIFAT Sector Location" field of the last DIFAT sector, or in the
        /// header when no DIFAT sectors are needed.
        /// The detailed DIFAT sector structure is specified below.
        guard header.numberOfDIFATSectors != 0 else {
            return []
        }

        func getSector(id: UInt32) -> CompoundFileSector {
            if let sector = cachedSectors[Int(id)] {
                return sector
            }
            
            let sector = CompoundFileSector(type: .difat, id: id, size: self.sectorSize, parentStream: dataStream)
            cachedSectors[Int(id)] = sector
            return sector
        }
        
        var results: [CompoundFileSector] = []
        var processedSectors: Set<UInt32> = []
        var sector = getSector(id: header.firstDIFATSectorLocation)
        results.append(sector)
        for _ in 0..<header.numberOfDIFATSectors {
            var dataStream = sector.dataStream
            /// FAT Sector Location (variable): This field specifies the FAT sector number in a DIFAT.
            ///  If Header Major Version is 3, there MUST be 127 fields specified to fill a 512-byte sector minus the "Next DIFAT Sector
            /// Location" field.
            ///  If Header Major Version is 4, there MUST be 1,023 fields specified to fill a 4,096-byte sector minus the "Next DIFAT Sector
            /// Location" field.
            /// Next DIFAT Sector Location (4 bytes): This field specifies the next sector number in the DIFAT chain of sectors. The first DIFAT
            /// sector is specified in the Header. The last DIFAT sector MUST set this field to ENDOFCHAIN (0xFFFFFFFE).
            /// Name Value
            /// ENDOFCHAIN 0xFFFFFFFE
            // Note: also witnessed FREESECT
            dataStream.position = dataStream.position + Int(self.sectorSize) - 4

            let nextSectorId: UInt32 = try dataStream.read(endianess: .littleEndian)
            guard processedSectors.insert(nextSectorId).inserted else {
                throw CompoundFileError.corrupted
            }
            
            guard nextSectorId != CompoundFileSector.ENDOFCHAIN && nextSectorId != CompoundFileSector.FREESECT else {
                break
            }
            
            sector = getSector(id: nextSectorId)
            results.append(sector)
        }
        
        return results
    }
    
    private func getFATSectorChain() throws -> [CompoundFileSector] {
        /// [MS-CFB] 2.3 Compound File FAT Sectors
        /// The FAT is the main allocator for space within a compound file. Every sector in the file is represented within the FAT in some fashion,
        /// including those sectors that are unallocated (free). The FAT is a sector chain that is made up of one or more FAT sectors.
        /// The FAT is an array of sector numbers that represent the allocation of space within the file, grouped into FAT sectors. Each stream is
        /// represented in the FAT by a sector chain, in much the same fashion as a FAT file system.
        /// The set of FAT sectors can be considered together as a single array. Each entry in that array contains the sector number of the next
        /// sector in the chain, and this sector number can be used as an index into the FAT array to continue along the chain.
        /// Special values are reserved for chain terminators (ENDOFCHAIN = 0xFFFFFFFE), free sectors (FREESECT = 0xFFFFFFFF), and sectors
        /// that contain storage for FAT sectors (FATSECT = 0xFFFFFFFD) or DIFAT Sectors (DIFSECT = 0xFFFFFFC), which are not chained in the
        /// same way as the others.
        /// The locations of FAT sectors are read from the DIFAT. The FAT is represented in itself, but not by a chain. A special reserved sector
        /// number (FATSECT = 0xFFFFFFFD) is used to mark sectors that are allocated to the FAT.
        /// A sector number can be converted into a byte offset into the file by using the following formula: (sector number + 1) x Sector Size. This
        /// implies that sector #0 of the file begins at byte offset Sector Size, not at 0.
        /// The detailed FAT sector structure is specified below.
        func getSector(id: UInt32) -> CompoundFileSector {
            if let sector = cachedSectors[Int(id)] {
                return sector
            }
            
            let sector = CompoundFileSector(type: .fat, id: id, size: self.sectorSize, parentStream: dataStream)
            cachedSectors[Int(id)] = sector
            return sector
        }
        
        // Read FAT entries from the DIFAT[109] array in the header.
        var results: [CompoundFileSector] = []
        for i in 0..<min(Int(header.numberOfFATSectors), header.DIFAT.count) {
            let nextSectorID = header.DIFAT[i]
            results.append(getSector(id: nextSectorID))
        }
        
        // Read FAT entries from the DIFAT sector list.
        let difatSectors = try getDIFATSectorChain()
        if difatSectors.count > 0 {
            var processedSectors: Set<UInt32> = []
            let count = header.numberOfFATSectors > 109 ? Int(header.numberOfFATSectors - 109) * 4 : 0
            var difatStream = StreamView(sectorChain: difatSectors,
                                         sectorSize: sectorSize,
                                         count: count,
                                         dataStream: dataStream)
            var buffer: [UInt8] = [0x00, 0x00, 0x00, 0x00]
            var i = 0
            while results.count < header.numberOfFATSectors {
                let numberOfBytesRead = try buffer.withUnsafeMutableBufferPointer {
                    try difatStream.read(to: $0, count: $0.count)
                }
                assert(numberOfBytesRead == buffer.count)
                
                var dataStream = DataStream(buffer)
                let nextSectorId: UInt32 = try dataStream.read(endianess: .littleEndian)
                guard processedSectors.insert(nextSectorId).inserted else {
                    throw CompoundFileError.corrupted
                }
                
                results.append(getSector(id: nextSectorId))
                
                if difatStream.position == (sectorSize - 4) + UInt32(i) * sectorSize {
                    // Skip DIFAT chain fields considering the possibility that the last FAT entry has been
                    // already read
                    let numberOfBytesRead = try buffer.withUnsafeMutableBufferPointer {
                        try difatStream.read(to: $0, count: 4)
                    }
                    assert(numberOfBytesRead == 4)
                    
                    var dataStream = DataStream(buffer)
                    let nextSectorId: UInt32 = try dataStream.read(endianess: .littleEndian)
                    if nextSectorId == CompoundFileSector.ENDOFCHAIN {
                        break
                    }
                    
                    i += 1
                }
            }
        }
        
        return results
    }
    
    private func getNormalSectorChain(sectorId: UInt32) throws -> [CompoundFileSector] {
        let fatSectors = try getFATSectorChain()
        var fatStream = StreamView(sectorChain: fatSectors,
                                   sectorSize: self.sectorSize,
                                   count: fatSectors.count * Int(self.sectorSize),
                                   dataStream: dataStream)
        
        func getSector(id: UInt32) -> CompoundFileSector {
            if let sector = cachedSectors[Int(id)] {
                return sector
            }
            
            let sector = CompoundFileSector(type: .normal, id: id, size: self.sectorSize, parentStream: dataStream)
            cachedSectors[Int(id)] = sector
            return sector
        }
        
        var nextSectorId = sectorId
        var results: [CompoundFileSector] = []
        var processedSectors: Set<UInt32> = []
        var buffer: [UInt8] = [0x00, 0x00, 0x00, 0x00]
        while nextSectorId != CompoundFileSector.ENDOFCHAIN {
            guard nextSectorId < cachedSectors.count else {
                throw CompoundFileError.corrupted
            }
            
            results.append(getSector(id: nextSectorId))

            fatStream.position = Int(nextSectorId) * 4
            let numberOfBytesRead = try buffer.withUnsafeMutableBufferPointer {
                try fatStream.read(to: $0, count: $0.count)
            }
            assert(numberOfBytesRead == buffer.count)
            
            var dataStream = DataStream(buffer)
            nextSectorId = try dataStream.read(endianess: .littleEndian)
            guard processedSectors.insert(nextSectorId).inserted else {
                throw CompoundFileError.corrupted
            }
        }
        
        return results
    }
    
    private func getMiniSectorSectorChain(sectorId: UInt32) throws -> [CompoundFileSector] {
        guard sectorId != CompoundFileSector.ENDOFCHAIN else {
            return []
        }
        
        let miniFATChain = try getNormalSectorChain(sectorId: header.firstMiniFATSectorLocation)
        let miniStreamChain = try getNormalSectorChain(sectorId: rootStorage.entry.startSectorLocation)
        
        var miniFatView = StreamView(sectorChain: miniFATChain,
                                     sectorSize: sectorSize,
                                     count: Int(header.numberOfMiniFATSectors * self.miniSectorSize),
                                     dataStream: dataStream)
        var miniStreamView = StreamView(sectorChain: miniStreamChain,
                                        sectorSize: sectorSize,
                                        count: Int(rootStorage.count),
                                        dataStream: dataStream)
        
        var results : [CompoundFileSector] = []
        var processedSectors: Set<UInt32> = []
        var nextSectorId = sectorId
        var nextSectorIdBuffer: [UInt8] = [0x00, 0x00, 0x00, 0x00]
        while nextSectorId != CompoundFileSector.ENDOFCHAIN && nextSectorId != CompoundFileSector.FREESECT {
            var dataBuffer: [UInt8] = [UInt8](repeating: 0, count: Int(miniSectorSize))
            miniStreamView.position = Int(nextSectorId * miniSectorSize)
            let numberOfBytesRead1 = try dataBuffer.withUnsafeMutableBufferPointer {
                try miniStreamView.read(to: $0, count: $0.count)
            }
            assert(numberOfBytesRead1 == dataBuffer.count)
            
            let dataStream = DataStream(dataBuffer)
            let sector = CompoundFileSector(type: .mini, id: nextSectorId, size: miniSectorSize, parentStream: dataStream)
            results.append(sector)
            
            miniFatView.position = Int(nextSectorId) * 4
            let numberOfBytesRead2 = try nextSectorIdBuffer.withUnsafeMutableBufferPointer {
                try miniFatView.read(to: $0, count: $0.count)
            }
            assert(numberOfBytesRead2 == nextSectorIdBuffer.count)
            
            var nextSectorDataStream = DataStream(nextSectorIdBuffer)
            nextSectorId = try nextSectorDataStream.read(endianess: .littleEndian)
            guard processedSectors.insert(nextSectorId).inserted else {
                break
            }
        }
        
        return results
    }
    
    internal func readFile(storage: CompoundFileStorage, buffer: UnsafeMutableBufferPointer<UInt8>) throws {
        if storage.count < header.miniStreamCutoffSize {
            var stream = StreamView(sectorChain: try getMiniSectorSectorChain(sectorId: storage.entry.startSectorLocation),
                                            sectorSize: miniSectorSize,
                                            count: Int(storage.count),
                                            dataStream: dataStream)
            try stream.read(to: buffer, count: buffer.count)
        } else {
            var stream = StreamView(sectorChain: try getNormalSectorChain(sectorId: storage.entry.startSectorLocation),
                                            sectorSize: sectorSize,
                                            count: Int(storage.count),
                                            dataStream: dataStream)
            try stream.read(to: buffer, count: buffer.count)
        }
    }

    public var description: String {
        return rootStorage.description
    }
}
