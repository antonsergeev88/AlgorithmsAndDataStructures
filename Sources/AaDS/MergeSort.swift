extension RandomAccessCollection where Self: MutableCollection, Element: Comparable, Index == Int {
    mutating func mergeSort() {
        mergeSort(left: startIndex, right: endIndex)
    }

    private mutating func mergeSort(left: Int, right: Int) {
        if right - left <= 1 {
            // nothing to do
        } else if right - left == 2 {
            if self[left] > self[index(before: right)] {
                swapAt(left, index(before: right))
            }
        } else {
            let middle = (right - left ) / 2
            mergeSort(left: left, right: middle)
            mergeSort(left: middle, right: right)
            merge(left: left, middle: middle, right: right)
        }
    }

    private mutating func merge(left: Int, middle: Int, right: Int) {
        var i = left
        var j = middle
        var tempArray = [Element]()
        tempArray.reserveCapacity(right - left)
        while i < middle && j < right {
            if self[i] < self[j] {
                tempArray.append(self[i])
                i += 1
            } else {
                tempArray.append(self[j])
                j += 1
            }
        }
        if j < right {
            tempArray.append(contentsOf: self[j..<right])
        }
        if i < middle {
            tempArray.append(contentsOf: self[i..<middle])
        }
        (left..<right).enumerated().forEach { offset, element in
            self[element] = tempArray[offset]
        }
    }
}
