class MedianFinder {
    var dataStream: [Double] = []

    func addNum(_ num: Int) {
        let num = Double(num)
        guard !dataStream.isEmpty else { 
            dataStream.append(Double(num)) 
            return
        }
        
        var l = 0
        var r = dataStream.count - 1

        while l <= r {
            let mid = l + (r - l) / 2
            
            if dataStream[mid] < num {
                l = mid+1
            } else {
                r = mid-1
            }
        }
        dataStream.insert(num, at: l)
    }

    func findMedian() -> Double {
        let mid = dataStream.count / 2
        
        if dataStream.count % 2 != 0 {
            // odd
            return Double(dataStream[mid])
        } else {
            // even
            let mean: Double = (dataStream[mid] + dataStream[mid-1]) / 2.0

            return mean
        }
    }
}
