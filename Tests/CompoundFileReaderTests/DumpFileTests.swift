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
            ("aquasync/ruby-ole/oleWithDirs", "ole"),
            ("aquasync/ruby-ole/test_word_6", "doc"),
            ("aquasync/ruby-ole/test_word_95", "doc"),
            ("aquasync/ruby-ole/test_word_97", "doc"),
            ("decalage2/olefile/test-ole-file", "doc"),
            ("hughbe/custom", "msg"),
            ("hughbe/sample", "doc"),
            ("hughbe/7z1900-x64", "msi"),
            ("microsoft/compoundfilereader/{B85C5677-E8BC-11E4-825B-10604B7CB9F0}", "dat"),
            ("microsoft/compoundfilereader/{FE554E21-EA21-11E4-825B-10604B7CB9F0}", "dat"),
            ("microsoft/compoundfilereader/{FE554E21-EA21-11E4-825B-10604B7CB9F0}", "dat"),
            ("microsoft/compoundfilereader/1", "dat"),
            ("microsoft/compoundfilereader/2", "dat"),
            ("microsoft/compoundfilereader/unicode", "dat"),
            ("ironfede/openmcdf/_Test", "ppt"),
            //("ironfede/openmcdf/_thumbs_bug_24", "db"),
            ("ironfede/openmcdf/2_MB-W", "ppt"),
            ("ironfede/openmcdf/2custom", "doc"),
            ("ironfede/openmcdf/BUG_16_", "xls"),
            //("ironfede/openmcdf/CorruptedDoc_bug3547815", "doc"),
            //("ironfede/openmcdf/CorruptedDoc_bug3547815_B", "doc"),
            //("ironfede/openmcdf/CorruptedDoc_bug36", "doc"),
            ("ironfede/openmcdf/english.presets", "doc"),
            ("ironfede/openmcdf/mediationform", "doc"),
            ("ironfede/openmcdf/mime001", "doc"),
            ("ironfede/openmcdf/MultipleStorage", "cfs"),
            ("ironfede/openmcdf/MultipleStorage2", "cfs"),
            ("ironfede/openmcdf/MultipleStorage3", "cfs"),
            ("ironfede/openmcdf/MultipleStorage4", "cfs"),
            ("ironfede/openmcdf/poWEr.prelim", "doc"),
            ("ironfede/openmcdf/report_name_fix", "xls"),
            ("ironfede/openmcdf/report", "xls"),
            ("ironfede/openmcdf/reportREAD", "xls"),
            ("ironfede/openmcdf/testbad", "ole"),
            ("ironfede/openmcdf/testgood", "ole"),
            ("ironfede/openmcdf/wstr_presets", "doc"),
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
