extension RandomAccessCollection where Self: MutableCollection, Element: Comparable {
    mutating func orderStat(for k: Index) -> Element {
        orderedStat(begin: startIndex, end: endIndex, k: k)
    }

    private mutating func orderedStat(begin: Index, end: Index, k: Index) -> Element {
        let pivot = partition(begin: begin, end: end)
        if pivot == k {
            return self[pivot]
        } else if pivot < k {
            return orderedStat(begin: index(after: pivot), end: end, k: k)
        } else /* if pivot > k */ {
            return orderedStat(begin: begin, end: pivot, k: k)
        }
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
}
