import Collections

class MedianFinder {
    private var small: Heap<Int>
    private var large: Heap<Int>

    init (){
        self.small = Heap<Int>()
        self.large = Heap<Int>()
    }

    func addNum(_ num: Int) {
        // CHOOSE which heap to put num into
        if let top = large.min, num > top {
            large.insert(num)
        } else {
            small.insert(num)
        }

        // Re-arrange heaps to keep equal size
        if small.count > large.count+1 {
            if let val = small.popMax() {
                large.insert(val)
            }
        }
        if large.count > small.count+1 {
            if let val = large.popMin() {
                small.insert(val)
            }
        }

    }

    func findMedian() -> Double {
        if small.count > large.count {
            return Double(small.max!)
        } else if large.count > small.count {
            return Double(large.min!)
        }
        return (Double(small.max!) + Double(large.min!)) / 2.0
    }
}
