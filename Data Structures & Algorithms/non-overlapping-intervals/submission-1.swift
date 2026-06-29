class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        let intervals = intervals.sorted {$0[0] < $1[0]}
        
        var prevEnd = intervals[0][1]
        var retCount = 0
        for interval in intervals[1...] {
            let start = interval[0]
            let end = interval[1]
            if start < prevEnd {
                retCount+=1
                prevEnd = min(end, prevEnd)
            } else{
                prevEnd = end
            }
        }
        return retCount
    }
}
