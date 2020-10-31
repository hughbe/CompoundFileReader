import XCTest
@testable import CompoundFileReader

final class DumpFileTests: XCTestCase {
    static func dump(storage: CompoundFileStorage, level: Int) {
        var storage = storage
        print("\(String(repeating: "\t", count: level))Name: \(storage.name)")
        if storage.name != "Root Entry" {
            print("\(String(repeating: "\t", count: level))Data: \(storage.data)")
        }
        
        for (offset, child) in storage.children.enumerated() {
            dump(storage: child.value, level: level + 1)
            if offset != storage.children.count - 1 {
                print()
            }
        }
    }
    
    static func dump(file: CompoundFile) {
        dump(storage: file.rootStorage, level: 0)
    }
    
    func testDump() throws {
        for (name, fileExtension) in [
            ("hughbe/custom", "msg"),
            ("hughbe/sample", "doc"),
            ("ironfede/openmcdf/report", "xls"),
        ] {
            let data = try getData(name: name, fileExtension: fileExtension)
            let file = try CompoundFile(data: data)
            DumpFileTests.dump(file: file)
        }
    }

    static var allTests = [
        ("testDump", testDump)
    ]
}
