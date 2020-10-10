import XCTest
@testable import CompoundFileReader

final class CompoundFileReaderTests: XCTestCase {
    func testConstructor() throws {
        do {
            let file = try CompoundFile(data: try getData(name: "custom", extension: "msg"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            
            let children = file.rootStorage.children
            XCTAssertEqual(74, children.count)
            XCTAssertNotNil(children["__substg1.0_0044001F"])
            XCTAssertNotNil(children["__substg1.0_00520102"])
            XCTAssertNotNil(children["__nameid_version1.0"])
            XCTAssertNotNil(children["__recip_version1.0_#00000000"])
            
            let substg = children["__substg1.0_0044001F"]!
            var dataStream = substg.dataStream
            let bytes = try dataStream.readBytes(count: dataStream.count)
            XCTAssertEqual([104, 0, 117, 0, 103, 0, 104, 0, 98, 0, 101, 0, 108, 0, 108, 0, 97, 0, 114, 0, 115, 0, 64, 0, 103, 0, 109, 0, 97, 0, 105, 0, 108, 0, 46, 0, 99, 0, 111, 0, 109, 0], bytes)
        }
    }
    
    func testConstructorInvalid() throws {
        XCTAssertThrowsError(try CompoundFile(data: Data([])))
    }
    
    func testPerformance() throws {
        do {
            let file = try CompoundFile(data: try getData(name: "custom", extension: "msg"))
            XCTAssertEqual("Root Entry", file.rootStorage.name)
            
            let children = file.rootStorage.children
            XCTAssertEqual(74, children.count)
            XCTAssertNotNil(children["__substg1.0_0044001F"])
            XCTAssertNotNil(children["__substg1.0_00520102"])
            XCTAssertNotNil(children["__nameid_version1.0"])
            XCTAssertNotNil(children["__recip_version1.0_#00000000"])
            
            let substg = children["__substg1.0_0044001F"]!
            measure(metrics: [XCTClockMetric(), XCTCPUMetric(), XCTMemoryMetric()]) {
                for _ in 0...50_000 {
                    let _ = substg.data
                }
            }
        }
    }
    
    func getData(name: String, extension: String) throws -> Data {
        let url = URL(forResource: "custom", withExtension: "msg")
        return try Data(contentsOf: url)
    }

    static var allTests = [
        ("testConstructor", testConstructor),
        ("testConstructorInvalid", testConstructorInvalid),
        ("testPerformance", testPerformance),
    ]
}
