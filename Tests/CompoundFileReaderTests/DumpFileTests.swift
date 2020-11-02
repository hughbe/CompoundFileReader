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
            ("microsoft/compoundfilereader/{B85C5677-E8BC-11E4-825B-10604B7CB9F0}", "dat"),
            ("microsoft/compoundfilereader/{FE554E21-EA21-11E4-825B-10604B7CB9F0}", "dat"),
            ("microsoft/compoundfilereader/{FE554E21-EA21-11E4-825B-10604B7CB9F0}", "dat"),
            ("microsoft/compoundfilereader/1", "dat"),
            ("microsoft/compoundfilereader/2", "dat"),
            ("microsoft/compoundfilereader/unicode", "dat"),
            ("ironfede/openmcdf/poWEr.prelim", "doc"),
            ("ironfede/openmcdf/report", "xls"),
            ("ironfede/openmcdf/testbad", "ole"),
            ("ironfede/openmcdf/testgood", "ole"),
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
