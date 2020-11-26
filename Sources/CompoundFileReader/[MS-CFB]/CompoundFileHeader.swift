//
//  CompoundFileHeader.swift
//
//
//  Created by Hugh Bellamy on 06/10/2020.
//

import DataStream
import WindowsDataTypes

/// [MS-CFB] 2.2 Compound File Header
/// The Compound File Header structure MUST be at the beginning of the file (offset 0).
internal struct CompoundFileHeader: CustomDebugStringConvertible {
    public let signature: UInt64
    public let clsid: GUID
    public let minorVersion: UInt16
    public let majorVersion: UInt16
    public let byteOrder: UInt16
    public let sectorShift: UInt16
    public let miniSectorShift: UInt16
    public let reserved1: (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
    public let numberOfDirectorySectors: UInt32
    public let numberOfFATSectors: UInt32
    public let firstDirectorySectorLocation: UInt32
    public let transactionSignatureNumber: UInt32
    public let miniStreamCutoffSize: UInt32
    public let firstMiniFATSectorLocation: UInt32
    public let numberOfMiniFATSectors: UInt32
    public let firstDIFATSectorLocation: UInt32
    public let numberOfDIFATSectors: UInt32
    public let DIFAT: [UInt32]

    internal init(dataStream: inout DataStream) throws {
        /// Header Signature (8 bytes): Identification signature for the compound file structure, and MUST be
        /// set to the value 0xD0, 0xCF, 0x11, 0xE0, 0xA1, 0xB1, 0x1A, 0xE1.
        self.signature = try dataStream.read(endianess: .littleEndian)
        if self.signature != 0xE11AB1A1E011CFD0 as UInt64 {
            throw CompoundFileError.invalidSignature(signature: self.signature)
        }

        /// Header CLSID (16 bytes): Reserved and unused class ID that MUST be set to all zeroes (CLSID_NULL).
        self.clsid = try GUID(dataStream: &dataStream)
        
        /// Minor Version (2 bytes): Version number for nonbreaking changes. This field SHOULD be set to
        /// 0x003E if the major version field is either 0x0003 or 0x0004.
        self.minorVersion = try dataStream.read(endianess: .littleEndian)
        
        /// Major Version (2 bytes): Version number for breaking changes. This field MUST be set to either
        /// 0x0003 (version 3) or 0x0004 (version 4)
        self.majorVersion = try dataStream.read(endianess: .littleEndian)

        /// Byte Order (2 bytes): This field MUST be set to 0xFFFE. This field is a byte order mark for all integer
        /// field specifying little-endian byte order.
        self.byteOrder = try dataStream.read(endianess: .littleEndian)
        if self.byteOrder != 0xFFFE {
            throw CompoundFileError.invalidByteOrder(byteOrder: self.byteOrder)
        }
        
        /// Sector Shift (2 bytes): This field MUST be set to 0x0009, or 0x000c, depending on the Major
        /// Version field. This field specifies the sector size of the compound file as a power of 2
        /// If Major Version is 3, the Sector Shift MUST be 0x0009, specifying a sector size of 512 bytes.
        /// If Major Version is 4, the Sector Shift MUST be 0x000C, specifying a sector size of 4096 bytes
        self.sectorShift = try dataStream.read(endianess: .littleEndian)
        
        /// Mini Sector Shift (2 bytes): This field MUST be set to 0x0006. This field specifies the sector size of
        /// the Mini Stream as a power of 2. The sector size of the Mini Stream MUST be 64 bytes
        self.miniSectorShift = try dataStream.read(endianess: .littleEndian)
        if self.miniSectorShift != 0x0006 {
            throw CompoundFileError.invalidMiniSectorShift(miniSectorShift: self.miniSectorShift)
        }
        
        /// Reserved (6 bytes): This field MUST be set to all zeroes.
        self.reserved1 = try dataStream.read(type: type(of: self.reserved1))

        /// Number of Directory Sectors (4 bytes): This integer field contains the count of the number of
        /// directory sectors in the compound file.
        self.numberOfDirectorySectors = try dataStream.read(endianess: .littleEndian)
        
        /// Number of FAT Sectors (4 bytes): This integer field contains the count of the number of FAT
        /// sectors in the compound file.
        self.numberOfFATSectors = try dataStream.read(endianess: .littleEndian)
        
        /// This integer field contains the starting sector number for the directory stream
        self.firstDirectorySectorLocation = try dataStream.read(endianess: .littleEndian)
        
        /// Transaction Signature Number (4 bytes): This integer field MAY contain a sequence number that
        /// is incremented every time the compound file is saved by an implementation that supports file
        /// transactions. This is the field that MUST be set to all zeroes if file transactions are not
        /// implemented.
        self.transactionSignatureNumber = try dataStream.read(endianess: .littleEndian)
        
        /// Mini Stream Cutoff Size (4 bytes): This integer field MUST be set to 0x00001000. This field
        /// specifies the maximum size of a user-defined data stream that is allocated from the mini FAT
        /// and mini stream, and that cutoff is 4,096 bytes. Any user-defined data stream that is greater than
        /// or equal to this cutoff size must be allocated as normal sectors from the FAT
        self.miniStreamCutoffSize = try dataStream.read(endianess: .littleEndian)
        if self.miniStreamCutoffSize != 0x00001000 {
            throw CompoundFileError.invalidMiniStreamCutoffSize(miniStreamCutoffSize: self.miniStreamCutoffSize)
        }
        
        /// First Mini FAT Sector Location (4 bytes): This integer field contains the starting sector number for
        /// the mini FAT.
        self.firstMiniFATSectorLocation = try dataStream.read(endianess: .littleEndian)
        
        /// Number of Mini FAT Sectors (4 bytes): This integer field contains the count of the number of mini
        /// FAT sectors in the compound file.
        self.numberOfMiniFATSectors = try dataStream.read(endianess: .littleEndian)
        
        /// First DIFAT Sector Location (4 bytes): This integer field contains the starting sector number for the DIFAT
        self.firstDIFATSectorLocation = try dataStream.read(endianess: .littleEndian)
        
        /// Number of DIFAT Sectors (4 bytes): This integer field contains the count of the number of DIFAT
        /// sectors in the compound file
        self.numberOfDIFATSectors = try dataStream.read(endianess: .littleEndian)
        
        /// DIFAT (436 bytes): This array of 32-bit integer fields contains the first 109 FAT sector locations of
        /// the compound file.
        ///  For version 4 compound file the header size (512 bytes) is less than the sector size (4,096
        /// bytes), so the remaining part of the header (3,584 bytes) MUST be filled with all zeroes
        var difat = [UInt32]()
        difat.reserveCapacity(109)
        for _ in 0..<109 {
            difat.append(try dataStream.read(endianess: .littleEndian))
        }
        
        self.DIFAT = difat
        
        if self.majorVersion != 0x0003 && self.majorVersion != 0x0004 {
            throw CompoundFileError.invalidVersion(version: self.majorVersion)
        }
        if (self.majorVersion == 0x0003 && self.sectorShift != 0x0009) ||
            (self.majorVersion == 0x0004 && self.sectorShift != 0x000C) {
            throw CompoundFileError.invalidSectorShift(sectorShift: self.sectorShift)
        }
        if self.majorVersion == 0x0003 && self.numberOfDirectorySectors != 0x0 {
            throw CompoundFileError.invalidNumberOfDirectorySectors(numberOfDirectorySectors: self.numberOfDirectorySectors)
        }
    }

    var debugDescription: String {
        var s = ""
        s += "- Header\n"
        s += "- Signature: \(signature.hexString)\n"
        s += "- Clsid: \(clsid)\n"
        s += "- Minor Version: \(minorVersion.hexString)\n"
        s += "- Major version: \(majorVersion.hexString)\n"
        s += "- Byte order: \(byteOrder.hexString)\n"
        s += "- Sector shift: \(sectorShift.hexString)\n"
        s += "- Mini sector shift: \(miniSectorShift.hexString)\n"
        s += "- Number of Directory Sectors: \(numberOfDirectorySectors.hexString)\n"
        s += "- Number of FAT Sectors: \(numberOfFATSectors.hexString)\n"
        s += "- First Directory Sector Location: \(firstDirectorySectorLocation.hexString)\n"
        s += "- Transaction Signature Number: \(transactionSignatureNumber.hexString)\n"
        s += "- Mini Stream Cutoff Size: \(miniStreamCutoffSize.hexString)\n"
        s += "- First MiniFAT Sector Location: \(firstMiniFATSectorLocation.hexString)\n"
        s += "- Number of MiniFAT Sectors: \(numberOfMiniFATSectors.hexString)\n"
        s += "- First DIFAT Sector Location: \(firstDIFATSectorLocation.hexString)\n"
        s += "- Number of DIFAT Sectors: \(numberOfDIFATSectors.hexString)\n"
        return s
    }
}
