//
//  Sector.swift
//  
//
//  Created by Hugh Bellamy on 24/11/2020.
//

import DataStream

internal struct CompoundFileSector {
    public static let ENDOFCHAIN: UInt32 = 0xFFFFFFFE
    public static let FREESECT: UInt32 = 0xFFFFFFFF

    public let type: SectorType
    public let id: UInt32
    public let size: UInt32
    public let parentStream: DataStream

    public init(type: SectorType, id: UInt32, size: UInt32, parentStream: DataStream) {
        self.type = type
        self.id = id
        self.size = size
        self.parentStream = parentStream
    }
    
    public enum SectorType {
        case mini
        case normal
        case difat
        case fat
    }
    
    public var dataStream: DataStream {
        if type == .mini {
            return parentStream
        }

        let position: UInt64 = UInt64(size) + UInt64(id) * UInt64(size)
        guard position < parentStream.count else {
            fatalError("NYI: handle this!")
        }

        var dataStream = parentStream
        dataStream.position = Int(position)
        return dataStream
    }
    
    public func read<T>(readFunc: (inout DataStream) throws -> T) throws -> T {
        let position: UInt64 = UInt64(size) + UInt64(id) * UInt64(size)
        guard position < parentStream.count else {
            throw CompoundFileError.corrupted
        }
        
        var dataStream = parentStream
        dataStream.position = Int(position)
        return try readFunc(&dataStream)
    }
}
