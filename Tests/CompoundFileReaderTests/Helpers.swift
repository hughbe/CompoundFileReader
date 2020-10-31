//
//  Helpers.swift
//  
//
//  Created by Hugh Bellamy on 31/10/2020.
//

import CompoundFileReader
import CryptoKit
import Foundation

extension Sequence where Element: FixedWidthInteger {
    var hexString: String {
        return "[\(map { $0.hexString }.joined(separator: ", "))]"
    }
}

func getData(name: String, fileExtension: String) throws -> Data {
    let url = URL(forResource: name, withExtension: fileExtension)
    return try Data(contentsOf: url)
}

func testDump(accessor: String, storage: CompoundFileStorage, level: Int = 0) -> String {
    var s = ""
    
    let indent = String(repeating: "\t", count: level)
    let nextIndent = String(repeating: "\t", count: level + 1)
    
    func escape(string: String) -> String {
        var s = ""
        for char in string.unicodeScalars {
            s += char.escaped(asASCII: true)
        }
        return s
    }
    
    s += "\(indent)XCTAssertEqual(\"\(escape(string: storage.name))\", \(accessor).name)\n"
    s += "\(indent)XCTAssertEqual(\(storage.count.hexString), \(accessor).count)\n"
    if !accessor.hasSuffix(".rootStorage") {
        s += "\(indent)XCTAssertEqual(\(SHA256.hash(data: storage.data).hexString), [UInt8](SHA256.hash(data: \(accessor).data)))\n"
    }
    s += "\(indent)do {\n"
    s += "\(nextIndent)var storage = \(accessor)\n"
    var storage = storage
    s += "\(nextIndent)XCTAssertEqual(\(storage.children.count), storage.children.count)\n"
    for (index, (key, child)) in storage.children.sorted(by: { $0.key > $1.key }).enumerated() {
        s += testDump(accessor: "storage.children[\"\(escape(string: key))\"]!", storage: child, level: level + 1)
        if index != storage.children.count - 1 {
            s += "\n"
        }
    }
    
    s += "\(indent)}\n"
    
    return s
}

func testDump(accessor: String, file: CompoundFile, level: Int = 0) -> String {
    return testDump(accessor: "\(accessor).rootStorage", storage: file.rootStorage, level: level)
}
