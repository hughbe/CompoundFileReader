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
        }
    }
    
    func testConstructorInvalid() throws {
        XCTAssertThrowsError(try CompoundFile(data: Data([])))
    }
    
    func getData(name: String, extension: String) throws -> Data {
        let url = URL(forResource: "custom", withExtension: "msg")
        return try Data(contentsOf: url)
    }

    static var allTests = [
        ("testConstructor", testConstructor),
        ("testConstructorInvalid", testConstructorInvalid),
    ]
}
