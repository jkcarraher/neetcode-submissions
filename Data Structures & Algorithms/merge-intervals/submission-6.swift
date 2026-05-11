class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        // O(nlog(n)) - Where n is num of intervals
        let sortedIntervals = intervals.sorted{ $0[0] < $1[0]}

        print(sortedIntervals)

        var l = sortedIntervals[0][0]
        var r = sortedIntervals[0][1]

        var retArr: [[Int]] = []

        // Case 1 - b extends a : [1,3], 1,5] -> ACTION EXTEND
        // Case 2 - b within a : [1,3], [1,2]
        // Case 3 - b outside a: [1,3], [4,5] -> ACTION APPEND TO RETARR

        // O(n) - Where n is num of intervals
        for i in sortedIntervals {
            if i[0] >= l && i[0] <= r && i[1] > r {
                r = i[1]
            } else if r < i[0] {
                retArr.append([l,r])
                l = i[0]
                r = i[1]
            }
        }

        // last interval stored in l and r
        retArr.append([l,r])


        return retArr
    }
}
