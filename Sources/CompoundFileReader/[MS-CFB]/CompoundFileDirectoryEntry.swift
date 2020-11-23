//
// CompoundFileDirectoryEntry.swift
//
//
// Created by Hugh Bellamy on 06/10/2020.
//

import DataStream
import WindowsDataTypes

/// [MS-CFB] 2.6 Compound File Directory Sectors
/// The directory entry array is a structure that is used to contain information about the stream and storage objects in a
/// compound file, and to maintain a tree-style containment structure. The directory entry array is allocated as a standard
/// chain of directory sectors within the FAT. Each directory entry is identified by a nonnegative number that is called the
/// stream ID. The first sector of the directory sector chain MUST contain the root storage directory entry as the first
/// directory entry at stream ID 0.
/// [MS-CFB] 2.6.1 Compound File Directory Entry
/// The directory entry array is an array of directory entries that are grouped into a directory sector.
/// Each storage object or stream object within a compound file is represented by a single directory entry. The space for the
/// directory sectors that are holding the array is allocated from the FAT. The valid values for a stream ID, which are used in
/// the Child ID, Right Sibling ID, and Left Sibling ID fields, are 0 through MAXREGSID (0xFFFFFFFA). The special value
/// NOSTREAM (0xFFFFFFFF) is used as a terminator.
/// Stream ID name Integer value Description
/// REGSID 0x00000000 through 0xFFFFFFF9 Regular stream ID to identify the directory entry.
/// MAXREGSID 0xFFFFFFFA Maximum regular stream ID.
/// NOSTREAM 0xFFFFFFFF Terminator or empty pointer.
/// The directory entry size is fixed at 128 bytes. The name in the directory entry is limited to 32 Unicode UTF-16 code
/// points, including the required Unicode terminating null character. Directory entries are grouped into blocks to form
/// directory sectors. There are four directory entries in a 512-byte directory sector (version 3 compound file), and there
/// are 32 directory entries in a 4,096-byte directory sector (version 4 compound file). The number of directory entries
/// can exceed the number of storage objects and stream objects due to unallocated directory entries.
/// The detailed Directory Entry structure is specified below.
internal struct CompoundFileDirectoryEntry: CustomDebugStringConvertible {
    public static let size: UInt32 = 128
    public static let NOSTREAM = 0xFFFFFFFF
    public static let FREESECT = 0xFFFFFFFF
    public static let ENDOFCHAIN = 0xFFFFFFFE
    public static let FATSECT = 0xFFFFFFFD
    public static let DIFATSECT = 0xFFFFFFFC
    
    public let name: String
    public let objectType: CompoundFileObjectType
    public let colorFlag: ColorFlag
    public let leftSiblingID: UInt32
    public let rightSiblingID: UInt32
    public let childID: UInt32
    public let clsid: GUID
    public let stateBits: UInt32
    public let creationTime: FILETIME
    public let modifiedTime: FILETIME
    public let startSectorLocation: UInt32
    public let streamSize: UInt64
    
    internal init(dataStream: inout DataStream, header: CompoundFileHeader) throws {
        /// Directory Entry Name (64 bytes): This field MUST contain a Unicode string for the storage or
        /// stream name encoded in UTF-16. The name MUST be terminated with a UTF-16 terminating null
        /// character. Thus, storage and stream names are limited to 32 UTF-16 code points, including the
        /// terminating null character. When locating an object in the compound file except for the root
        /// storage, the directory entry name is compared by using a special case-insensitive uppercase
        /// mapping, described in Red-Black Tree. The following characters are illegal and MUST NOT be part
        /// of the name: '/', '\', ':', '!'.
        var chars = [UInt16]()
        for _ in 0..<32 {
            let char: UInt16 = try dataStream.read(endianess: .littleEndian)
            chars.append(char)
        }

        let entryNameLength: UInt16 = try dataStream.read(endianess: .littleEndian)
        if entryNameLength % 2 != 0 || entryNameLength > 64 {
            throw CompoundFileError.invalidEntryNameLength(entryNameLength: entryNameLength)
        }
        
        if entryNameLength == 0 {
            self.name = ""
        } else {
            self.name = String(utf16CodeUnits: &chars, count: Int(entryNameLength / 2) - 1)
        }

        /// Object Type (1 byte): This field MUST be 0x00, 0x01, 0x02, or 0x05, depending on the actual type
        /// of object. All other values are not valid
        let objectTypeRaw: UInt8 = try dataStream.read()
        guard let objectType = CompoundFileObjectType(rawValue: objectTypeRaw) else {
            throw CompoundFileError.invalidEntryObjectType(objectType: objectTypeRaw)
        }
        
        self.objectType = objectType

        /// Color Flag (1 byte): This field MUST be 0x00 (red) or 0x01 (black). All other values are not valid.
        let colorFlagRaw = try dataStream.read() as UInt8
        guard let colorFlag = ColorFlag(rawValue: colorFlagRaw) else {
            throw CompoundFileError.invalidEntryColorFlag(colorFlag: colorFlagRaw)
        }
        
        self.colorFlag = colorFlag

        /// Left Sibling ID (4 bytes): This field contains the stream ID of the left sibling. If there is no left
        /// sibling, the field MUST be set to NOSTREAM (0xFFFFFFFF).
        /// Value Meaning
        /// REGSID 0x00000000 — 0xFFFFFFF9 Regular stream ID to identify the directory entry.
        /// MAXREGSID 0xFFFFFFFA Maximum regular stream ID.
        /// NOSTREAM 0xFFFFFFFF If there is no left sibling.
        self.leftSiblingID = try dataStream.read(endianess: .littleEndian)

        /// Right Sibling ID (4 bytes): This field contains the stream ID of the right sibling. If there is no right
        /// sibling, the field MUST be set to NOSTREAM (0xFFFFFFFF).Value Meaning
        /// REGSID 0x00000000 — 0xFFFFFFF9 Regular stream ID to identify the directory entry.
        /// MAXREGSID 0xFFFFFFFA Maximum regular stream ID.
        /// NOSTREAM 0xFFFFFFFF If there is no right sibling.
        self.rightSiblingID = try dataStream.read(endianess: .littleEndian)

        /// Child ID (4 bytes): This field contains the stream ID of a child object. If there is no child object,
        /// including all entries for stream object the field MUST be set to NOSTREAM (0xFFFFFFFF)
        /// REGSID 0x00000000 — 0xFFFFFFF9 Regular stream ID to identify the directory entry.
        /// MAXREGSID 0xFFFFFFFA Maximum regular stream ID.
        /// NOSTREAM 0xFFFFFFFF If there is no child object.
        self.childID = try dataStream.read(endianess: .littleEndian)

        /// CLSID (16 bytes): This field contains an object class GUID, if this entry is for a storage object or
        /// root storage object. For a stream object, this field MUST be set to all zeroes. A value containing all
        /// zeroes in a storage or root storage directory entry is valid, and indicates that no object class is
        /// associated with the storage. If an implementation of the file format enables applications to create
        /// storage objects without explicitly setting an object class GUID, it MUST write all zeroes by default.
        /// If this value is not all zeroe the object class GUID can be used as a parameter to start
        /// applications.
        /// Value                              | Meaning
        /// ------------------------------------------------------------------------------------
        /// 0x00000000000000000000000000000000 | No object class is associated with the storage.
        self.clsid = try dataStream.read(type: GUID.self)

        /// State Bits (4 bytes): This field contains the user-defined flags if this entry is for a storage object or
        /// root storage object. For a stream object, this field SHOULD be set to all zeroes because many
        /// implementations provide no way for applications to retrieve state bits from a stream object. If an
        /// implementation of the file format enables applications to create storage objects without explicitly
        /// setting state bitit MUST write all zeroes by default
        /// Value      | Meaning
        /// -------------------------------------------------------------------------------
        /// 0x00000000 | Default value when no state bits are explicitly set on the object.
        self.stateBits = try dataStream.read(endianess: .littleEndian)

        /// Creation Time (8 bytes): This field contains the creation time for a storage object, or all zeroes to
        /// indicate that the creation time of the storage object was not recorded. The Windows FILETIME
        /// structure is used to represent this field in UTC. For a stream object, this field MUST be all zeroes.
        /// For a root storage object, this field MUST be all zeroeand the creation time is retrieved or set on
        /// the compound file itself.
        /// Value              | Meaning
        /// ------------------------------------------------------------------
        /// 0x0000000000000000 | No creation time was recorded for the object.
        self.creationTime = try FILETIME(dataStream: &dataStream)

        /// Modified Time (8 bytes): This field contains the modification time for a storage object, or all
        /// zeroes to indicate that the modified time of the storage object was not recorded. The Windows
        /// FILETIME structure is used to represent this field in UTC. For a stream object, this field MUST be
        /// all zeroes. For a root storage object, this field MAY<2> be set to all zeroeand the modified time
        /// is retrieved or set on the compound file itself
        /// Value              | Meaning
        /// -------------------|----------------------------------------------
        /// 0x0000000000000000 | No modified time was recorded for the object.
        self.modifiedTime = try FILETIME(dataStream: &dataStream)

        /// Starting Sector Location (4 bytes): This field contains the first sector location if this is a stream
        /// object. For a root storage object, this field MUST contain the first sector of the mini stream, if the
        /// mini stream exists. For a storage object, this field MUST be set to all zeroes.
        self.startSectorLocation = try dataStream.read(endianess: .littleEndian)

        /// Stream Size (8 bytes): This 64-bit integer field contains the size of the user-defined data if this is a stream object. For a root storage
        /// object, this field contains the size of the mini stream. For a storage object, this field MUST be set to all zeroes.
        ///  For a version 3 compound file 512-byte sector size, the value of this field MUST be less than or equal to 0x80000000. (Equivalently,
        /// this requirement can be stated: the size of a stream or of the mini stream in a version 3 compound file MUST be less than or equal to
        /// 2 gigabytes (GB).) Note that as a consequence of this requirement, the most significant 32 bits of this field MUST be zero in a version 3
        /// compound file. However, implementers should be aware that some older implementations did not initialize the most significant 32 bits of
        /// this field, and these bits might therefore be nonzero in files that are otherwise valid version 3 compound files. Although this document does
        /// not normatively specify parser behavior, it is recommended that parsers ignore the most significant 32 bits of this field in version 3 compound
        /// files, treating it as if its value were zero, unless there is a specific reason to do otherwise (for example, a parser whose purpose is to verify
        /// the correctness of a compound file).
        let streamSize: UInt64 = try dataStream.read(endianess: .littleEndian)
        if header.majorVersion == 0x03 {
            self.streamSize = streamSize & 0xFFFFFFFF
        } else {
            self.streamSize = streamSize
        }

        if self.objectType == .storageObject && self.startSectorLocation != 0 && self.startSectorLocation != CompoundFileDirectoryEntry.ENDOFCHAIN && self.startSectorLocation != CompoundFileDirectoryEntry.FREESECT {
            throw CompoundFileError.invalidEntryStartSectorLocation(startSectorLocation: self.startSectorLocation)
        }
    }

    var debugDescription: String {
        var s = ""
        s += "-- CompoundFileEntry --\n"
        s += "- Name: \(name)\n"
        s += "- Object Type: \(objectType)\n"
        s += "- Color Flag: \(colorFlag)\n"
        s += "- Left Sibling ID: \(leftSiblingID.hexString)\n"
        s += "- Right Sibling ID: \(rightSiblingID.hexString)\n"
        s += "- Child ID: \(childID.hexString)\n"
        s += "- CLSID: \(clsid)\n"
        s += "- State Bits: \(stateBits.hexString)\n"
        s += "- Creation Time: \(creationTime)\n"
        s += "- Modified Time: \(modifiedTime)\n"
        s += "- Starting Sector Location: \(startSectorLocation.hexString)\n"
        s += "- Stream Size: \(streamSize.hexString)\n"
        return s
    }
}
