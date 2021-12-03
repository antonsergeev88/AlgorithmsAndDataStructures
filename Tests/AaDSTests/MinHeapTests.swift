import XCTest
@testable import AaDS

final class MinHeapSortTests: XCTestCase {
    func testPopMinFromSorted() {
        var heap = MinHeap([1, 2, 3, 4, 5])
        XCTAssertEqual(heap.popMin(), 1)
    }

    func testPopMinFromUnsorted() {
        var heap = MinHeap([3, 1, 5, 2, 4])
        XCTAssertEqual(heap.popMin(), 1)
    }

    func testInsert() {
        var heap = MinHeap<Int>()
        heap.insert(2)
        heap.insert(5)
        heap.insert(3)
        heap.insert(1)
        heap.insert(4)
        XCTAssertEqual(heap.popMin(), 1)
    }
}
