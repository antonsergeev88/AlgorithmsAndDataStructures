struct MinHeap<Element: Comparable> {
    private var storage: [Element]

    init() {
        storage = []
    }

    init<S: Sequence>(_ sequence: S) where S.Element == Element {
        storage = Array(sequence)
        storage.sort()
    }

    mutating func popMin() -> Element {
        let result = storage[0]
        storage[0] = storage[storage.count - 1]
        storage.removeLast()
        moveDown(0)
        return result
    }

    mutating func insert(_ element: Element) {
        storage.append(element)
        moveUp(storage.count - 1)
    }

    private mutating func moveUp(_ bottom: Int) {
        var index = bottom
        while index != 0, storage[index] < parent(for: index) {
            storage.swapAt(index, parentIndex(for: index))
            index = parentIndex(for: index)
        }
    }

    private mutating func moveDown(_ root: Int) {
        var index = root
        while true {
            var min = index
            if storage.count > leftIndex(for: min), storage[index] > left(for: min) {
                min = leftIndex(for: min)
            }
            if storage.count > rightIndex(for: min), storage[min] > right(for: index) {
                min = rightIndex(for: index)
            }
            guard index != min else {
                break
            }
            storage.swapAt(index, min)
            index = min
        }
    }

    private func parentIndex(for index: Int) -> Int {
        (index - 1) / 2
    }

    private func leftIndex(for index: Int) -> Int {
        index * 2 + 1
    }

    private func rightIndex(for index: Int) -> Int {
        (index + 1) * 2
    }

    private func parent(for index: Int) -> Element {
        storage[parentIndex(for: index)]
    }

    private func left(for index: Int) -> Element {
        storage[leftIndex(for: index)]
    }

    private func right(for index: Int) -> Element {
        storage[rightIndex(for: index)]
    }
}
