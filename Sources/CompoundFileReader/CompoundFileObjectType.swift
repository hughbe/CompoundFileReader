//
//  CompoundFileObjectType.swift
//  CompoundFileReader
//
//  Created by Hugh Bellamy on 27/07/2020.
//  Copyright © 2020 Hugh Bellamy. All rights reserved.
//

internal enum CompoundFileObjectType: UInt8 {
    case unknownOrAllocated = 0x00
    case storageObject = 0x01
    case streamObject = 0x02
    case rootStorageObject = 0x05
}
