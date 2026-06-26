class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        retArr = []

        for i in range(len(intervals)):
            cStart, cEnd = intervals[i][0], intervals[i][1]
            if newInterval[1] < cStart:
                # Past point of insertion
                retArr.append(newInterval)
                return retArr + intervals[i:]
            elif newInterval[0] > cEnd:
                # 
                retArr.append(intervals[i])
            else:
                newInterval = [
                    min(cStart, newInterval[0]),
                    max(cEnd, newInterval[1])
                ]
        retArr.append(newInterval)
        
        return retArr