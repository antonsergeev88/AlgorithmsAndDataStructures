extension RandomAccessCollection where Self: MutableCollection, Element: Comparable {
    mutating func mergeSort() {
        mergeSort(left: startIndex, right: endIndex)
    }

    private mutating func mergeSort(left: Index, right: Index) {
        precondition(left <= right)
        let distance = self.distance(from: left, to: right)
        guard distance > 1 else {
            return
        }
        let middle = index(left, offsetBy: distance / 2)
        mergeSort(left: left, right: middle)
        mergeSort(left: middle, right: right)
        merge(left: left, middle: middle, right: right)
    }

    private mutating func merge(left: Index, middle: Index, right: Index) {
        var i = left
        var j = middle
        var tempArray = [Element]()
        tempArray.reserveCapacity(distance(from: left, to: right))
        while i < middle && j < right {
            if self[i] < self[j] {
                tempArray.append(self[i])
                i = index(after: i)
            } else {
                tempArray.append(self[j])
                j = index(after: j)
            }
        }
        if j < right {
            tempArray.append(contentsOf: self[j..<right])
        }
        if i < middle {
            tempArray.append(contentsOf: self[i..<middle])
        }
        var iOrigin = left
        for iTemp in 0..<distance(from: left, to: right) {
            self[iOrigin] = tempArray[iTemp]
            iOrigin = index(after: iOrigin)
        }
    }
}
