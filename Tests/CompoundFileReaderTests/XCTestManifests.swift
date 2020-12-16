import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CompoundFileTests.allTests),
        testCase(DumpFileTests.allTests),
    ]
}
#endif
