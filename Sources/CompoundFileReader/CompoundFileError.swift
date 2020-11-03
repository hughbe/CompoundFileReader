//
//  CompoundFileError.swift
//  
//
//  Created by Hugh Bellamy on 06/10/2020.
//

public enum CompoundFileError : Error {
    case invalidSignature(signature: UInt64)
    case invalidVersion(version: UInt16)
    case invalidByteOrder(byteOrder: UInt16)
    case invalidSectorShift(sectorShift: UInt16)
    case invalidMiniSectorShift(miniSectorShift: UInt16)
    case invalidMiniStreamCutoffSize(miniStreamCutoffSize: UInt32)
    case invalidNumberOfDirectorySectors(numberOfDirectorySectors: UInt32)
    case invalidEntryNameLength(entryNameLength: UInt16)
    case invalidEntryObjectType(objectType: UInt8)
    case invalidEntryColorFlag(colorFlag: UInt8)
    case invalidEntryStartSectorLocation(startSectorLocation: UInt32)
    case invalidEntryStreamSize(streamSize: UInt64)
    
    case invalidEntryID(entryID: UInt32)
}
