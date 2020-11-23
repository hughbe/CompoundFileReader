//
//  CompoundFileStorage.swift
//
//
//  Created by Hugh Bellamy on 06/10/2020.
//

import DataStream
import Foundation

public struct CompoundFileStorage: CustomStringConvertible {
    internal let file: CompoundFile
    internal let entry: CompoundFileDirectoryEntry
    
    public var name: String { entry.name }
    
    public var count: UInt64 { entry.streamSize }

    public lazy var children: [String: CompoundFileStorage] = {
        guard entry.childID != CompoundFileDirectoryEntry.NOSTREAM, let child = try? file.getStorage(entryID: entry.childID) else {
            return [:]
        }

        var result = [String: CompoundFileStorage]()
        result[child.name] = child
        child.addSiblings(to: &result)
        return result
    }()
    
    private func addSiblings(to: inout [String: CompoundFileStorage]) {
        let leftID = entry.leftSiblingID
        if leftID != CompoundFileDirectoryEntry.NOSTREAM, let leftSibling = try? file.getStorage(entryID: leftID) {
            to[leftSibling.name] = leftSibling
            leftSibling.addSiblings(to: &to)
        }
        
        let rightID = entry.rightSiblingID
        if rightID != CompoundFileDirectoryEntry.NOSTREAM, let rightSibling = try? file.getStorage(entryID: rightID) {
            to[rightSibling.name] = rightSibling
            rightSibling.addSiblings(to: &to)
        }
    }
    
    public var data: Data {
        guard entry.objectType != .storageObject else {
            return Data()
        }

        var buffer = [UInt8](repeating: 0, count: Int(entry.streamSize))
        buffer.withUnsafeMutableBufferPointer { b in
            try! file.readFile(storage: self, buffer: b)
        }
        return Data(buffer)
    }
    
    public var dataStream: DataStream {
        return DataStream(data: data)
    }
    
    public var description: String {
        return getDescription(level: 0)
    }
    
    private func getDescription(level: Int) -> String {
        var this = self
        var s = "\(String(repeating: "\t", count: level))- \(name) (\(count) bytes)"
        for child in this.children {
            s += "\n"
            s += child.value.getDescription(level: level + 1)
        }
        return s
    }
}
