import XCTest
@testable import AaDS

final class MergeSortTests: XCTestCase {

    func testEmpty() {
        var sorted: [Int] = []
        sorted.mergeSort()
        XCTAssertEqual(sorted, [])
    }

    func testSingle() {
        var sorted: [Int] = [1]
        sorted.mergeSort()
        XCTAssertEqual(sorted, [1])
    }

    func testSorted() {
        var sorted: [Int] = [1, 2, 3]
        sorted.mergeSort()
        XCTAssertEqual(sorted, [1, 2, 3])
    }

    func testReversed() {
        var sorted: [Int] = [3, 2, 1]
        sorted.mergeSort()
        XCTAssertEqual(sorted, [1, 2, 3])
    }

    func testAny() {
        var sorted: [Int] = [3, 2, 1, 4, 7, 3, 3, 6, 9, 1, 4]
        sorted.mergeSort()
        XCTAssertEqual(sorted, [1, 2, 3])
    }

}
