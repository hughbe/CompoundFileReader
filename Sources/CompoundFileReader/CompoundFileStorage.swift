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
    public let name: String
    
    internal init(file: CompoundFile, entry: CompoundFileDirectoryEntry) {
        self.file = file
        self.entry = entry

        if ((entry.entryNameLength % 2) == 0) && entry.entryNameLength > 0 && entry.entryNameLength <= 64 {
            self.name = String(bytes: entry.entryName[0...(Int(entry.entryNameLength) - 2)], encoding: .utf16LittleEndian)!
        } else {
            self.name = ""
        }
    }
    
    public var count: UInt64 { entry.streamSize }

    private lazy var allChildren: [CompoundFileStorage] = {
        guard entry.childID != CompoundFileDirectoryEntry.NOSTREAM else {
            return []
        }

        let childEntry = file.directoryEntries[Int(entry.childID)]
        let child = CompoundFileStorage(file: file, entry: childEntry)

        var result = [CompoundFileStorage]()
        result.append(child)
        child.addSiblings(to: &result)
        return result
    }()
    
    public lazy var children: [String: CompoundFileStorage] = {
        var result: [String: CompoundFileStorage] = [:]
        result.reserveCapacity(allChildren.count)
        for element in allChildren {
            result[element.name] = element
        }
        
        return result
    }()
    
    private func addSiblings(to: inout [CompoundFileStorage]) {
        let leftID = entry.leftSiblingID
        if leftID != CompoundFileDirectoryEntry.NOSTREAM {
            let siblingEntry = file.directoryEntries[Int(leftID)]
            let sibling = CompoundFileStorage(file: file, entry: siblingEntry)
            if siblingEntry.objectType != .unknownOrAllocated {
                to.append(sibling)
            }

            sibling.addSiblings(to: &to)
        }
        
        let rightID = entry.rightSiblingID
        if rightID != CompoundFileDirectoryEntry.NOSTREAM {
            let siblingEntry = file.directoryEntries[Int(rightID)]
            let sibling = CompoundFileStorage(file: file, entry: siblingEntry)
            if siblingEntry.objectType != .unknownOrAllocated {
                to.append(sibling)
            }

            sibling.addSiblings(to: &to)
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
    
    public var dataStream: DataStream { DataStream(data) }
    
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
