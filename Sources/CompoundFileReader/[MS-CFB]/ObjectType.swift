//
//  ObjectType.swift
//
//
//  Created by Hugh Bellamy on 06/10/2020.
//

/// Object Type (1 byte): This field MUST be 0x00, 0x01, 0x02, or 0x05, depending on the actual type
/// of object. All other values are not valid.
internal enum CompoundFileObjectType: UInt8 {
    /// Unknown or unallocated 0x00
    case unknownOrAllocated = 0x00
    
    /// Storage Object 0x01
    case storageObject = 0x01
    
    /// Stream Object 0x02
    case streamObject = 0x02
    
    /// Root Storage Object 0x05
    case rootStorageObject = 0x05
}
