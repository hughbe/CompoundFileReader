import XCTest

import CompoundFileReaderTests

var tests = [XCTestCaseEntry]()
tests += CompoundFileTests.allTests()
tests += DumpFileTests.allTests()
XCTMain(tests)
