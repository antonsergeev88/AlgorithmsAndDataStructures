protocol SortableByCount {
    var countSortKey: Int { get }
}

extension Collection where Element: SortableByCount {
    func countSorted(m: Int) -> [Element] {
        var counters = [Int].init(repeating: 0, count: m)
        forEach { element in
            counters[element.countSortKey] += 1
        }
        var previous = 0
        for i in 0..<counters.count {
            let next = previous + counters[i]
            counters[i] = previous
            previous = next
        }
        let result = UnsafeMutableBufferPointer<Element>.allocate(capacity: count)
        defer {
            result.deallocate()
        }
        for i in 0..<count {
            let element = self[index(startIndex, offsetBy: i)]
            let key = element.countSortKey
            let offset = counters[key]
            counters[key] += 1
            result[offset] = element
        }
        return .init(result)
    }
}
