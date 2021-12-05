import XCTest
@testable import AaDS

final class OrderStatTests: XCTestCase {
    func testSingle() {
        var array = [1]
        XCTAssertEqual(array.orderStat(for: 0), 1)
    }

    func testFirstInSorted() {
        var array = [1, 2, 3, 4, 5]
        XCTAssertEqual(array.orderStat(for: 0), 1)
    }

    func testFirstInReversed() {
        var array = [5, 4, 3, 2, 1]
        XCTAssertEqual(array.orderStat(for: 0), 1)
    }

    func testFirstInUnsorted() {
        var array = [3, 5, 2, 1, 4]
        XCTAssertEqual(array.orderStat(for: 0), 1)
    }

    func testUnsorted() {
        var array = [3, 5, 2, 1, 4]
        XCTAssertEqual(array.orderStat(for: 3), 4)
    }

    func testRepetitionsUnsorted() {
        var array = [3, 5, 2, 3, 1, 4]
        XCTAssertEqual(array.orderStat(for: 3), 3)
    }
}
