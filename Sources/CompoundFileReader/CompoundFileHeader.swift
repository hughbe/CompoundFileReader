//
//  CompoundFileswift
//  CompoundFileReader
//
//  Created by Hugh Bellamy on 20/07/2020.
//  Copyright © 2020 Hugh Bellamy. All rights reserved.
//

import DataStream
import Foundation

internal struct CompoundFileHeader: CustomDebugStringConvertible {
    public let signature: UInt64
    public let clsid: UUID
    public let minorVersion: UInt16
    public let majorVersion: UInt16
    public let byteOrder: UInt16
    public let sectorShift: UInt16
    public let miniSectorShift: UInt16
    public let reserved1: [UInt8]
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

    internal init(data: inout DataStream) throws {
        signature = try data.read(endianess: .littleEndian)

        // Spec:
        // Header CLSID (16 bytes): Reserved and unused class ID that MUST be set to all zeroes
        // (CLSID_NULL).
        clsid = try data.read(type: UUID.self)
        
        // Spec:
        // Minor Version (2 bytes): Version number for nonbreaking changes. This field SHOULD be set to
        // 0x003E if the major version field is either 0x0003 or 0x0004.
        minorVersion = try data.read(endianess: .littleEndian)
        
        // Spec:
        // Major Version (2 bytes): Version number for breaking changes. This field MUST be set to either
        // 0x0003 (version 3) or 0x0004 (version 4)
        majorVersion = try data.read(endianess: .littleEndian)

        // Spec:
        // Byte Order (2 bytes): This field MUST be set to 0xFFFE. This field is a byte order mark for all integer
        // fieldspecifying little-endian byte order.
        byteOrder = try data.read(endianess: .littleEndian)
        
        // Spec:
        // Sector Shift (2 bytes): This field MUST be set to 0x0009, or 0x000c, depending on the Major
        // Version field. This field specifies the sector size of the compound file as a power of 2
        // If Major Version is 3, the Sector Shift MUST be 0x0009, specifying a sector size of 512 bytes.
        // If Major Version is 4, the Sector Shift MUST be 0x000C, specifying a sector size of 4096 bytes
        sectorShift = try data.read(endianess: .littleEndian)
        
        // Spec:
        // Mini Sector Shift (2 bytes): This field MUST be set to 0x0006. This field specifies the sector size of
        // the Mini Stream as a power of 2. The sector size of the Mini Stream MUST be 64 bytes
        miniSectorShift = try data.read(endianess: .littleEndian)
        
        // Spec:
        // Reserved (6 bytes): This field MUST be set to all zeroes.
        var reserved1 = [UInt8]()
        reserved1.reserveCapacity(6)
        for _ in 1...6 {
            reserved1.append(try data.read())
        }
        self.reserved1 = reserved1

        // Spec:
        // Number of Directory Sectors (4 bytes): This integer field contains the count of the number of
        // directory sectors in the compound file.
        numberOfDirectorySectors = try data.read(endianess: .littleEndian)
        
        // Spec:
        // Number of FAT Sectors (4 bytes): This integer field contains the count of the number of FAT
        // sectors in the compound file.
        numberOfFATSectors = try data.read(endianess: .littleEndian)
        
        // Spec:
        // This integer field contains the starting sector number for
        // the directory stream
        firstDirectorySectorLocation = try data.read(endianess: .littleEndian)
        
        // Spec:
        // Transaction Signature Number (4 bytes): This integer field MAY contain a sequence number that
        // is incremented every time the compound file is saved by an implementation that supports file
        // transactions. This is the field that MUST be set to all zeroes if file transactions are not
        // implemented.
        transactionSignatureNumber = try data.read(endianess: .littleEndian)
        
        // Spec:
        // Mini Stream Cutoff Size (4 bytes): This integer field MUST be set to 0x00001000. This field
        // specifies the maximum size of a user-defined data stream that is allocated from the mini FAT
        // and mini stream, and that cutoff is 4,096 bytes. Any user-defined data stream that is greater than
        // or equal to this cutoff size must be allocated as normal sectors from the FAT
        miniStreamCutoffSize = try data.read(endianess: .littleEndian)
        
        // Spec:
        // First Mini FAT Sector Location (4 bytes): This integer field contains the starting sector number for
        // the mini FAT.
        firstMiniFATSectorLocation = try data.read(endianess: .littleEndian)
        
        // Spec:
        // Number of Mini FAT Sectors (4 bytes): This integer field contains the count of the number of mini
        // FAT sectors in the compound file.
        numberOfMiniFATSectors = try data.read(endianess: .littleEndian)
        
        // Spec:
        // First DIFAT Sector Location (4 bytes): This integer field contains the starting sector number for
        // the DIFAT
        firstDIFATSectorLocation = try data.read(endianess: .littleEndian)
        
        // Spec:
        // Number of DIFAT Sectors (4 bytes): This integer field contains the count of the number of DIFAT
        // sectors in the compound file
        numberOfDIFATSectors = try data.read(endianess: .littleEndian)
        
        // Spec:
        // DIFAT (436 bytes): This array of 32-bit integer fields contains the first 109 FAT sector locations of
        // the compound file.
        //  For version 4 compound filethe header size (512 bytes) is less than the sector size (4,096
        // bytes), so the remaining part of the header (3,584 bytes) MUST be filled with all zeroes
        var difat = [UInt32]()
        difat.reserveCapacity(109)
        for _ in 1...109 {
            difat.append(try data.read(endianess: .littleEndian))
        }
        
        DIFAT = difat
        
        if signature != 0xE11AB1A1E011CFD0 as UInt64 {
            throw CompoundFileError.invalidSignature(signature: signature)
        }
        if byteOrder != 0xFFFE {
            throw CompoundFileError.invalidByteOrder(byteOrder: byteOrder)
        }
        if majorVersion != 0x0003 && majorVersion != 0x0004 {
            throw CompoundFileError.invalidVersion(version: majorVersion)
        }
        if (majorVersion == 0x0003 && sectorShift != 0x0009) ||
           (majorVersion == 0x0004 && sectorShift != 0x000C) {
            throw CompoundFileError.invalidSectorShift(sectorShift: sectorShift)
        }
        if miniSectorShift != 0x0006 {
            throw CompoundFileError.invalidMiniSectorShift(miniSectorShift: miniSectorShift)
        }
        if majorVersion == 0x0003 && numberOfDirectorySectors != 0x0 {
            throw CompoundFileError.invalidNumberOfDirectorySectors(numberOfDirectorySectors: numberOfDirectorySectors)
        }
    }

    var debugDescription: String {
        var s = ""
        s += "Header\n"
        s += "Signature: \(signature.hexString)\n"
        s += "Clsid: \(clsid)\n"
        s += "Minor Version: \(minorVersion.hexString)\n"
        s += "Major version: \(majorVersion.hexString)\n"
        s += "Byte order: \(byteOrder.hexString)\n"
        s += "Sector shift: \(sectorShift.hexString)\n"
        s += "Mini sector shift: \(miniSectorShift.hexString)\n"
        s += "Number of Directory Sectors: \(numberOfDirectorySectors.hexString)\n"
        s += "Number of FAT Sectors: \(numberOfFATSectors.hexString)\n"
        s += "First Directory Sector Location: \(firstDirectorySectorLocation.hexString)\n"
        s += "Transaction Signature Number: \(transactionSignatureNumber.hexString)\n"
        s += "Mini Stream Cutoff Size: \(miniStreamCutoffSize.hexString)\n"
        s += "First MiniFAT Sector Location: \(firstMiniFATSectorLocation.hexString)\n"
        s += "Number of MiniFAT Sectors: \(numberOfMiniFATSectors.hexString)\n"
        s += "First DIFAT Sector Location: \(firstDIFATSectorLocation.hexString)\n"
        s += "Number of DIFAT Sectors: \(numberOfDIFATSectors.hexString)\n"
        return s
    }
}
