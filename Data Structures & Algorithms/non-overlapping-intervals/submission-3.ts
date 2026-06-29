class Solution {
    /**
     * @param {number[][]} intervals
     * @return {number}
     */
    eraseOverlapIntervals(intervals: number[][]): number {
        intervals = intervals.sort((a,b)=> a[0] - b[0])
        let prevEnd = intervals[0][1]
        let retCount = 0
        for (let interval of intervals.slice(1)) {
            let start = interval[0]
            let end = interval[1]
            if (start < prevEnd) {
                retCount+=1
                prevEnd = Math.min(prevEnd, end)
            } else {
                prevEnd = end
            }
        }

        return retCount
    }
}
