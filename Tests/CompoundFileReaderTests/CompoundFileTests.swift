import XCTest
@testable import CompoundFileReader

final class CompoundFileReaderTests: XCTestCase {
    func testConstructor() {
        XCTAssertThrowsError(try CompoundFile(data: Data([])))
    }

    static var allTests = [
        ("testConstructor", testConstructor),
    ]
}
