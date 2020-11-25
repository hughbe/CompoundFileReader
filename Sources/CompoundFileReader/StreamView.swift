//
//  StreamView.swift
//  
//
//  Created by Hugh Bellamy on 24/11/2020.
//

import DataStream

internal struct StreamView {
    private let sectorChain: [CompoundFileSector]
    private let sectorSize: UInt32
    private let dataStream: DataStream
    
    private var _position: Int = 0
    public var position: Int {
        get { _position }
        set {
            precondition(newValue >= 0)
            _position = newValue
        }
    }
    public var count: Int

    public init(sectorChain: [CompoundFileSector], sectorSize: UInt32, count: Int, dataStream: DataStream) {
        self.sectorChain = sectorChain
        self.sectorSize = sectorSize
        self.count = count
        self.dataStream = dataStream
    }
    
    @discardableResult
    public mutating func read(to buffer: UnsafeMutableBufferPointer<UInt8>, count: Int) throws -> Int {
        precondition(count <= buffer.count)
        guard sectorChain.count > 0 else {
            return 0
        }
        
        var sectorIndex = position / Int(sectorSize)
        var numberOfBytesRead = 0
        
        // First sector.
        // Read the number of bytes remaining in the sector or the data size, whichever is smaller.
        let numberOfBytesReadInCurrentSector = position % Int(sectorSize)
        let numberOfByteToRead = min(Int(sectorChain[0].size) - numberOfBytesReadInCurrentSector, count)
        if sectorIndex < sectorChain.count {
            var dataStream = sectorChain[sectorIndex].dataStream
            dataStream.position += numberOfBytesReadInCurrentSector
            try dataStream.readBytes(to: buffer, count: numberOfByteToRead)
            numberOfBytesRead += numberOfByteToRead
        }
        
        sectorIndex += 1
        
        // Central sectors.
        // Read the full length of each sector.
        while numberOfBytesRead < (count - Int(sectorSize)) && sectorIndex < sectorChain.count {
            var dataStream = sectorChain[sectorIndex].dataStream
            let copied = UnsafeMutableBufferPointer(rebasing: buffer[numberOfBytesRead...])
            try dataStream.readBytes(to: copied, count: Int(sectorSize))

            sectorIndex += 1
            numberOfBytesRead += Int(sectorSize)
        }
        
        // Last sector.
        // Read the number of bytes remaining in the sector or the remaining data size, whichever is smaller.
        let remainingBytes = count - numberOfBytesRead
        if remainingBytes != 0 && sectorIndex < sectorChain.count {
            var dataStream = sectorChain[sectorIndex].dataStream
            let copied = UnsafeMutableBufferPointer(rebasing: buffer[numberOfBytesRead...])
            try dataStream.readBytes(to: copied, count: remainingBytes)

            numberOfBytesRead += remainingBytes
        }
        
        position += numberOfBytesRead
        return numberOfBytesRead
    }
}
