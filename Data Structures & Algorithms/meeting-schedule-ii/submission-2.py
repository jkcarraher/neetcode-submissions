"""
Definition of Interval:
class Interval(object):
    def __init__(self, start, end):
        self.start = start
        self.end = end
"""

class Solution:
    def minMeetingRooms(self, intervals: List[Interval]) -> int:
        if len(intervals) == 0 : return 0 

        rooms = []
        intervals.sort(key = lambda x: x.start )

        rooms.append([intervals[0]])
        for interval in intervals[1:] :
            for (i, room) in enumerate(rooms) :
                if interval.start >= room[-1].end:
                    room.append(interval)
                    break
                if i == len(rooms)-1:
                    rooms.append([interval])
                    break

        return len(rooms)
