class Solution:
    def eraseOverlapIntervals(self, intervals: List[List[int]]) -> int:
        # Sort in ascending order
        intervals = sorted(intervals, key=lambda pair: pair[0])

        retCount = 0
        prevEnd = intervals[0][1]
        for i in range(1, len(intervals)):
            curr = intervals[i]
            if curr[0] < prevEnd:
                retCount+=1
                prevEnd = min(curr[1], prevEnd)
            else:
                prevEnd = curr[1]
                
        return retCount