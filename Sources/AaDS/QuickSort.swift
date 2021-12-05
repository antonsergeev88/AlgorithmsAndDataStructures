import Darwin
extension RandomAccessCollection where Self: MutableCollection, Element: Comparable {
    mutating func quickSort() {
        quickSort(begin: startIndex, end: endIndex)
    }

    private mutating func quickSort(begin: Index, end: Index) {
        guard distance(from: begin, to: end) > 1 else {
            return
        }
        randomizePartition(begin: begin, end: end)
        let pivot = partition(begin: begin, end: end)
        quickSort(begin: begin, end: pivot)
        quickSort(begin: pivot, end: end)
    }

    private mutating func partition(begin: Index, end: Index) -> Index {
        let pivot = self[index(before: end)]
        var i = index(before: begin)
        var j = begin
        while j < index(before: end) {
            if self[j] <= pivot {
                i = index(after: i)
                swapAt(i, j)
            }
            j = index(after: j)
        }
        swapAt(index(after: i), index(before: end))
        return index(after: i)
    }

    private mutating func randomizePartition(begin: Index, end: Index) {
        let size = distance(from: begin, to: end)
        let pivot = index(begin, offsetBy: Int.random(in: 0..<size))
        swapAt(pivot, index(before: end))
    }
}
