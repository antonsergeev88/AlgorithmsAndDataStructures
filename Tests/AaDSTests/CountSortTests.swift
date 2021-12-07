import XCTest
@testable import AaDS

extension Int: SortableByCount {
    public var countSortKey: Int { self }
}

final class CountSortTests: XCTestCase {

    func testEmpty() {
        let array: [Int] = []
        XCTAssertEqual(array.countSorted(m: 10), [])
    }

    func testSingle() {
        let array: [Int] = [1]
        XCTAssertEqual(array.countSorted(m: 2), [1])
    }

    func testTwo() {
        let array: [Int] = [2, 1]
        XCTAssertEqual(array.countSorted(m: 3), [1, 2])
    }

    func testTwoSoted() {
        let array: [Int] = [1, 2]
        XCTAssertEqual(array.countSorted(m: 10), [1, 2])
    }
    func testEqual() {
        let array: [Int] = [1, 1, 1, 1, 1]
        XCTAssertEqual(array.countSorted(m: 2), [1, 1, 1, 1, 1])
    }

    func testSorted() {
        let array: [Int] = [1, 2, 3]
        XCTAssertEqual(array.countSorted(m: 5), [1, 2, 3])
    }

    func testReversed() {
        let array: [Int] = [3, 2, 1]
        XCTAssertEqual(array.countSorted(m: 4), [1, 2, 3])
    }

    func testLong() {
        let array: [Int] = [3, 2, 1, 4, 7, 3, 3, 6, 9, 1, 4]
        XCTAssertEqual(array.countSorted(m: 10), [1, 1, 2, 3, 3, 3, 4, 4, 6, 7, 9])
    }

}
