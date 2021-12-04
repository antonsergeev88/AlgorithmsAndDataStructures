import Darwin
extension RandomAccessCollection where Self: MutableCollection, Element: Comparable {
    mutating func quickSort() {
        quickSort(begin: startIndex, end: endIndex)
    }

    private mutating func quickSort(begin: Index, end: Index) {
        precondition(begin <= end)
        if distance(from: begin, to: end) < 2 {
            return
        }
        let pivot = findPivot(begin: begin, end: end)
        let pivotIndex = divide(begin: begin, end: end, pivot: pivot)
        quickSort(begin: begin, end: pivotIndex)
        quickSort(begin: pivotIndex, end: end)
    }

    private func findPivot(begin: Index, end: Index) -> Element {
        let diff = distance(from: begin, to: end)
        let offset = Int.random(in: 0...diff)
        return self[index(begin, offsetBy: offset)]
    }

    private mutating func divide(begin: Index, end: Index, pivot: Element) -> Index {
        var i = index(before: begin)
        var j = begin
        var p = end
        while distance(from: j, to: p) > 0 {
            let element = self[j]
            if element == pivot {
                p = index(before: p)
                swapAt(j, p)
            } else if element < pivot {
                i = index(after: i)
                swapAt(i, j)
                j = index(after: j)
            } else /* element > pivot */ {
                j = index(after: j)
            }
        }
    }
}
