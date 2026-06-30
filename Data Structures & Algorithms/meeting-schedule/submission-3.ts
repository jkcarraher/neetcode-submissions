/**
 * Definition of Interval:
 * class Interval  {
 *   constructor(start, end) {
 *     this.start = start;
 *     this.end = end;
 *   }
 * }
 */

class Solution {
    /**
     * @param {Interval[]} intervals
     * @returns {boolean}
     */
    canAttendMeetings(intervals: Interval[]): boolean {
        if (intervals.length == 0) { return true }
        intervals = intervals.sort((a,b) => a.start - b.start )
        let prevEnd = intervals[0].end

        for (let interval of intervals.slice(1)) {
            if (prevEnd > interval.start) {
                return false
            }
            prevEnd = interval.end
        }
        return true
    }
}
