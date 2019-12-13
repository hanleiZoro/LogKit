import XCTest
@testable import Log_demo

final class Log_demoTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Log_demo().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
