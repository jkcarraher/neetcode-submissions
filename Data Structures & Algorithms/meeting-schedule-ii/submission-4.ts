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
     * @returns {number}
     */
    minMeetingRooms(intervals: Interval[]): number {
        if ( intervals.length == 0 ) { return 0 }
        intervals.sort((a,b) => a.start - b.start )
        let rooms = [[intervals[0]]]

        for ( let interval of intervals.slice(1) ) {
            for (let i = 0; i < rooms.length; i++ ) {
                if (interval.start >= rooms[i].at(-1).end) {
                    rooms[i].push(interval)
                    break
                }
                if (i == rooms.length-1) {
                    rooms.push([interval])
                    break
                }
            }
        }
        return rooms.length
    }
}
