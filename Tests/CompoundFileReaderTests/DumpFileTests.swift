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
            /* aquasync/ruby-ole */
            ("oleWithDirs", "ole"),
            ("test_word_6", "doc"),
            ("test_word_95", "doc"),
            ("test_word_97", "doc"),
            ("test-ole-file", "doc"),
            
            /* hughbe */
            ("custom", "msg"),
            ("sample", "doc"),
            ("7z1900-x64", "msi"),
            ("VBA Project", "pps"),
            
            /* microsoft/compoundfilereader */
            ("{B85C5677-E8BC-11E4-825B-10604B7CB9F0}", "dat"),
            ("{FE554E21-EA21-11E4-825B-10604B7CB9F0}", "dat"),
            ("{FE554E21-EA21-11E4-825B-10604B7CB9F0}", "dat"),
            ("1", "dat"),
            ("2", "dat"),
            ("unicode", "dat"),
            
            /* ironfede/openmcdf */
            ("_Test", "ppt"),
            ("2_MB-W", "ppt"),
            ("2custom", "doc"),
            ("BUG_16_", "xls"),
            ("CorruptedDoc_bug3547815", "doc"),
            //("CorruptedDoc_bug3547815_B", "doc"),
            ("english.presets", "doc"),
            ("mediationform", "doc"),
            ("mime001", "doc"),
            ("MultipleStorage", "cfs"),
            ("MultipleStorage2", "cfs"),
            ("MultipleStorage3", "cfs"),
            ("MultipleStorage4", "cfs"),
            ("poWEr.prelim", "doc"),
            ("report_name_fix", "xls"),
            ("report", "xls"),
            ("reportREAD", "xls"),
            ("testbad", "ole"),
            ("testgood", "ole"),
            ("wstr_presets", "doc"),
            
            /* pehohlva/wv2qt */
            ("testole", "doc"),
        ] {
            let data = try getData(name: name, fileExtension: fileExtension)
            let file = try CompoundFile(data: data)
            print("Dumping \(name).\(fileExtension)")
            DumpFileTests.dump(file: file)
        }
    }

    static var allTests = [
        ("testDump", testDump)
    ]
}
