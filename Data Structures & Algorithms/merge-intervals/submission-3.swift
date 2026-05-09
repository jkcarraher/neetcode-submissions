class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard !intervals.isEmpty else { return [] }

        // O(n) - Pre-sort list so we can use an expanding strat
        let sIntervals: [[Int]] = intervals.sorted{$0[0] < $1[0]}

        // O(n) - Merge Each Interval into the next
        var retInts: [[Int]] = []
        var a = sIntervals[0]
        for b in sIntervals[1...] {
            if b[0] <= a[1] {
                if b[1] >= a[1] {
                    // b start NOT end is within a
                    a[1] = b[1]
                }
            } else {
                retInts.append(a)
                a = b
            }
        }
        retInts.append(a)

        return retInts
    }
}
