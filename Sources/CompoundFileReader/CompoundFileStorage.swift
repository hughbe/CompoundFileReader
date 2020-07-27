//
//  CFItem.swift
//  CompoundFileReader
//
//  Created by Hugh Bellamy on 21/07/2020.
//  Copyright © 2020 Hugh Bellamy. All rights reserved.
//

import DataStream
import Foundation

public struct CompoundFileStorage: CustomDebugStringConvertible {
    internal let file: CompoundFile
    internal let entry: CompoundFileEntry
    
    public var name: String {
        return entry.name
    }

    public var children: [String: CompoundFileStorage] {
        guard let child = file.getStorage(entryID: entry.childID) else {
            return [:]
        }

        var result = [String: CompoundFileStorage]()
        result[child.name] = child
        child.addSiblings(to: &result)
        return result
    }
    
    private func addSiblings(to: inout [String: CompoundFileStorage]) {
        let leftID = entry.leftSiblingID
        if let leftSibling = file.getStorage(entryID: leftID) {
            to[leftSibling.name] = leftSibling
            leftSibling.addSiblings(to: &to)
        }
        
        let rightID = entry.rightSiblingID
        if let rightSibling = file.getStorage(entryID: rightID) {
            to[rightSibling.name] = rightSibling
            rightSibling.addSiblings(to: &to)
        }
    }
    
    public var data: Data {
        var buffer = [UInt8](repeating: 0, count: Int(entry.streamSize))
        buffer.withUnsafeMutableBufferPointer { b in
            try! file.readFile(storage: self, buffer: b)
        }
        return Data(buffer)
    }
    
    public var dataStream: DataStream {
        return DataStream(data: data)
    }
    
    public var debugDescription: String {
        return entry.debugDescription
    }
}
