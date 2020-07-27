//
//  CompoundFileEntry.swift
//  CompoundFileReader
//
//  Created by Hugh Bellamy on 20/07/2020.
//  Copyright © 2020 Hugh Bellamy. All rights reserved.
//

import DataStream
import Foundation

internal struct CompoundFileEntry: CustomDebugStringConvertible {
    public static let size: UInt32 = 128
    public static let FREESECT = 0xFFFFFFFF
    public static let ENDOFCHAIN = 0xFFFFFFFE
    public static let FATSECT = 0xFFFFFFFD
    public static let DIFATSECT = 0xFFFFFFFC
    
    public let name: String
    public let objectType: CompoundFileObjectType
    public let colorFlag: CompoundFileColorFlag
    public let leftSiblingID: UInt32
    public let rightSiblingID: UInt32
    public let childID: UInt32
    public let clsid: UUID
    public let stateBits: UInt32
    public let creationTime: FILETIME
    public let modifiedTime: FILETIME
    public let startSectorLocation: UInt32
    public let streamSize: UInt64
    
    internal init(data: inout DataStream, header: CompoundFileHeader) throws {
        var chars = [unichar]()
        for _ in 1...32 {
            chars.append(try data.readUInt16())
        }
        
        let entryNameLength = try data.readUInt16()
        if entryNameLength % 2 != 0 || entryNameLength > 64 {
            throw CompoundFileError.invalidEntryNameLength(entryNameLength: entryNameLength)
        }
        
        name = String(utf16CodeUnits: &chars, count: Int(entryNameLength / 2) - 1)

        // Spec:
        // Object Type (1 byte): This field MUST be 0x00, 0x01, 0x02, or 0x05, depending on the actual type
        // of object. All other values are not valid
        let objectType = try data.readUInt8()
        guard let objectTypeValue = CompoundFileObjectType(rawValue: objectType) else {
            throw CompoundFileError.invalidEntryObjectType(objectType: objectType)
        }
        
        self.objectType = objectTypeValue

        // Spec:
        // Color Flag (1 byte): This field MUST be 0x00 (red) or 0x01 (black). All other values are not valid.
        let colorFlag = try data.readUInt8()
        guard let colorFlagValue = CompoundFileColorFlag(rawValue: colorFlag) else {
            throw CompoundFileError.invalidEntryColorFlag(colorFlag: colorFlag)
        }
        
        self.colorFlag = colorFlagValue

        // Spec:
        // Left Sibling ID (4 bytes): This field contains the stream ID of the left sibling. If there is no left
        // sibling, the field MUST be set to NOSTREAM (0xFFFFFFFF).
        leftSiblingID = try data.readUInt32()

        // Spec:
        // Right Sibling ID (4 bytes): This field contains the stream ID of the right sibling. If there is no right
        // sibling, the field MUST be set to NOSTREAM (0xFFFFFFFF).
        rightSiblingID = try data.readUInt32()

        // Spec:
        // Child ID (4 bytes): This field contains the stream ID of a child object. If there is no child object,
        // including all entries for stream objectthe field MUST be set to NOSTREAM (0xFFFFFFFF)
        childID = try data.readUInt32()

        // Spec:
        // CLSID (16 bytes): This field contains an object class GUID, if this entry is for a storage object or
        // root storage object. For a stream object, this field MUST be set to all zeroes. A value containing all
        // zeroes in a storage or root storage directory entry is valid, and indicates that no object class is
        // associated with the storage. If an implementation of the file format enables applications to create
        // storage objects without explicitly setting an object class GUID, it MUST write all zeroes by default.
        // If this value is not all zeroe the object class GUID can be used as a parameter to start
        // applications.
        clsid = try data.read(type: UUID.self)

        // Spec:
        // State Bits (4 bytes): This field contains the user-defined flags if this entry is for a storage object or
        // root storage object. For a stream object, this field SHOULD be set to all zeroes because many
        // implementations provide no way for applications to retrieve state bits from a stream object. If an
        // implementation of the file format enables applications to create storage objects without explicitly
        // setting state bitit MUST write all zeroes by default
        stateBits = try data.readUInt32()

        // Spec:
        // Creation Time (8 bytes): This field contains the creation time for a storage object, or all zeroes to
        // indicate that the creation time of the storage object was not recorded. The Windows FILETIME
        // structure is used to represent this field in UTC. For a stream object, this field MUST be all zeroes.
        // For a root storage object, this field MUST be all zeroeand the creation time is retrieved or set on
        // the compound file itself.
        creationTime = try data.readFILETIME()

        // Spec:
        // Modified Time (8 bytes): This field contains the modification time for a storage object, or all
        // zeroes to indicate that the modified time of the storage object was not recorded. The Windows
        // FILETIME structure is used to represent this field in UTC. For a stream object, this field MUST be
        // all zeroes. For a root storage object, this field MAY<2> be set to all zeroeand the modified time
        // is retrieved or set on the compound file itself
        modifiedTime = try data.readFILETIME()

        // Spec:
        // Starting Sector Location (4 bytes): This field contains the first sector location if this is a stream
        // object. For a root storage object, this field MUST contain the first sector of the mini stream, if the
        // mini stream exists. For a storage object, this field MUST be set to all zeroes.
        startSectorLocation = try data.readUInt32()

        // Spec:
        // Stream Size (8 bytes): This 64-bit integer field contains the size of the user-defined data if this is
        // a stream object. For a root storage object, this field contains the size of the mini stream. For a
        // storage object, this field MUST be set to all zeroes.
        //  For a version 3 compound file 512-byte sector size, the value of this field MUST be less than
        // or equal to 0x80000000. (Equivalently, this requirement can be stated: the size of a stream or
        // of the mini stream in a version 3 compound file MUST be less than or equal to 2 gigabytes
        // (GB).) Note that as a consequence of this requirement, the most significant 32 bits of this field
        // MUST be zero in a version 3 compound file. However, implementers should be aware that
        // some older implementations did not initialize the most significant 32 bits of this field, and
        // these bits might therefore be nonzero in files that are otherwise valid version 3 compound
        // files. Although this document does not normatively specify parser behavior, it is recommended
        // that parsers ignore the most significant 32 bits of this field in version 3 compound files,
        // treating it as if its value were zero, unless there is a specific reason to do otherwise (for
        // example, a parser whose purpose is to verify the correctness of a compound file).
        streamSize = try data.readUInt64()

        if self.objectType == .storageObject && startSectorLocation != 0 && startSectorLocation != CompoundFileEntry.ENDOFCHAIN {
            throw CompoundFileError.invalidEntryStartSectorLocation(startSectorLocation: startSectorLocation)
        }
        if ((self.objectType == .storageObject && streamSize != 0) ||
            (header.majorVersion == 0x0003 && streamSize > 0x80000000))
        {
            throw CompoundFileError.invalidEntryStreamSize(streamSize: streamSize)
        }
    }

    var debugDescription: String {
        var s = ""
        s += "-- CompoundFileEntry --\n"
        s += "Name: \(name)\n"
        s += "Object Type: \(objectType)\n"
        s += "Color Flag: \(colorFlag)\n"
        s += "Left Sibling ID: \(leftSiblingID.hexString)\n"
        s += "Right Sibling ID: \(rightSiblingID.hexString)\n"
        s += "Child ID: \(childID.hexString)\n"
        s += "CLSID: \(clsid)\n"
        s += "State Bits: \(stateBits.hexString)\n"
        s += "Creation Time: \(creationTime)\n"
        s += "Modified Time: \(modifiedTime)\n"
        s += "Starting Sector Location: \(startSectorLocation.hexString)\n"
        s += "Stream Size: \(streamSize.hexString)\n"
        return s
    }
}
