//
//  CompoundFile.swift
//
//
//  Created by Hugh Bellamy on 06/10/2020.
//

import DataStream
import Foundation

public class CompoundFile {
    private var dataStream: DataStream
    private let header: CompoundFileHeader
    private let sectorSize: UInt32
    private let miniSectorSize: UInt32
    
    public init(data: Data) throws {
        self.dataStream = DataStream(data: data)
        self.header = try CompoundFileHeader(dataStream: &dataStream)
        self.sectorSize = UInt32(pow(2, Double(header.sectorShift)))
        self.miniSectorSize = UInt32(pow(2, Double(header.miniSectorShift)))
    }
    
    public lazy var rootStorage: CompoundFileStorage = {
        return try! getStorage(entryID: 0)
    }()

    public func getStorage(entryID: UInt32) throws -> CompoundFileStorage {
        if UInt32(dataStream.count) / CompoundFileDirectoryEntry.size <= entryID {
            throw CompoundFileError.invalidEntryID(entryID: entryID)
        }

        let (finalSector, finalOffset) = locateFinalSector(sector: header.firstDirectorySectorLocation, offset: entryID * CompoundFileDirectoryEntry.size)
        dataStream.position = sectorOffsetToStreamPosition(sector: finalSector, offset: finalOffset)

        let entry = try CompoundFileDirectoryEntry(dataStream: &dataStream, header: header)
        return CompoundFileStorage(file: self, entry: entry)
    }
    
    public func readFile(storage: CompoundFileStorage, buffer: UnsafeMutableBufferPointer<UInt8>) throws {
        if storage.entry.streamSize < header.miniStreamCutoffSize {
            try readMiniStream(sector: storage.entry.startSectorLocation, offset: 0, buffer: buffer)
        } else {
            try readStream(sector: storage.entry.startSectorLocation, offset: 0, buffer: buffer)
        }
    }
    
    private func readStream(sector: UInt32, offset: UInt32, buffer: UnsafeMutableBufferPointer<UInt8>) throws {
        var buffer = buffer
        var (sector, offset) = locateFinalSector(sector: sector, offset: offset)

        var length = buffer.count
        while length > 0 {
            dataStream.position = sectorOffsetToStreamPosition(sector: sector, offset: offset)
            let copyLength = min(length, Int(sectorSize - offset))
            try dataStream.readBytes(to: buffer, count: copyLength)

            buffer = UnsafeMutableBufferPointer(rebasing: buffer[copyLength...])
            length -= copyLength
            sector = getNextSector(sector: sector)
            offset = 0
        }
    }
    
    private func readMiniStream(sector: UInt32, offset: UInt32, buffer: UnsafeMutableBufferPointer<UInt8>) throws {
        var buffer = buffer
        var (sector, offset) = locateFinalMiniSector(sector: sector, offset: offset)
        
        var length = buffer.count
        while length > 0 {
            if sector == CompoundFileDirectoryEntry.NOSTREAM {
                break
            }

            dataStream.position = miniSectorOffsetToStreamPosition(sector: sector, offset: offset)
            let copyLength = min(length, Int(miniSectorSize - offset))
            try dataStream.readBytes(to: buffer, count: copyLength)

            buffer = UnsafeMutableBufferPointer(rebasing: buffer[copyLength...])
            length -= copyLength
            sector = getNextMiniSector(miniSector: sector)
            offset = 0
        }
    }
    
    private func locateFinalSector(sector: UInt32, offset: UInt32) -> (finalSector: UInt32, finalOffset: UInt32) {
        var sector = sector
        var offset = offset
        while offset >= sectorSize {
            offset -= sectorSize
            sector = getNextSector(sector: sector)
        }

        return (sector, offset)
    }
    
    private func getNextSector(sector: UInt32) -> UInt32 {
        let entriesPerSector = sectorSize / 4
        let fatSectorNumber = sector / entriesPerSector
        let fatSectorLocation = getFATSectorLocation(fatSectorNumber: fatSectorNumber)
        dataStream.position = sectorOffsetToStreamPosition(sector: fatSectorLocation, offset: sector % entriesPerSector * 4)
        return try! dataStream.read(endianess: .littleEndian)
    }
    
    private func getFATSectorLocation(fatSectorNumber: UInt32) -> UInt32 {
        var fatSectorNumber = fatSectorNumber
        if fatSectorNumber < 109 {
            return header.DIFAT[Int(fatSectorNumber)]
        }

        fatSectorNumber -= 109
        let entriesPerSector = sectorSize / 4 - 1
        var difatSectorLocation = header.firstDIFATSectorLocation
        while fatSectorNumber >= entriesPerSector {
            fatSectorNumber -= entriesPerSector
            dataStream.position = sectorOffsetToStreamPosition(sector: difatSectorLocation, offset: sectorSize - 4)
            difatSectorLocation = try! dataStream.read(endianess: .littleEndian)
        }

        dataStream.position = sectorOffsetToStreamPosition(sector: difatSectorLocation, offset: fatSectorNumber * 4)
        return try! dataStream.read(endianess: .littleEndian)
    }

    private func sectorOffsetToStreamPosition(sector: UInt32, offset: UInt32) -> Int {
        return Int(sectorSize + sectorSize * sector + offset)
    }

    private func locateFinalMiniSector(sector: UInt32, offset: UInt32) -> (sector: UInt32, offset: UInt32) {
        var sector = sector
        var offset = offset
        while offset >= miniSectorSize {
            offset -= miniSectorSize
            sector = getNextMiniSector(miniSector: sector)
        }

        return (sector: sector, offset: offset)
    }

    private func getNextMiniSector(miniSector: UInt32) -> UInt32 {
        let (sector, offset) = locateFinalSector(sector: header.firstMiniFATSectorLocation, offset: miniSector * 4)
        dataStream.position = sectorOffsetToStreamPosition(sector: sector, offset: offset)
        return try! dataStream.read(endianess: .littleEndian)
    }

    private func miniSectorOffsetToStreamPosition(sector: UInt32, offset: UInt32) -> Int {
        let (sector, offset) = locateFinalSector(sector: rootStorage.entry.startSectorLocation, offset: sector * miniSectorSize + offset)
        return sectorOffsetToStreamPosition(sector: sector, offset: offset)
    }


    public func dump() {
        print(header.debugDescription)
        
        print()
        print(rootStorage.debugDescription)
    }
}
