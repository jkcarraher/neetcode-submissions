/**
 * Definition of Interval:
 * class Interval {
 *     var start: Int
 *     var end: Int
 *     init(_ start: Int, _ end: Int) {
 *         self.start = start
 *         self.end = end
 *     }
 * }
 */

class Solution {
    func minMeetingRooms(_ intervals: [Interval]) -> Int {
        if intervals.count == 0 { return 0 }

        let intervals = intervals.sorted { $0.start < $1.start }
        var rooms: [[Interval]] = [[intervals[0]]]

        for interval in intervals[1...] {
            for (i, room) in rooms.enumerated() {
                if interval.start >= room.last!.end {
                    rooms[i].append(interval)
                    break
                }
                if i == rooms.count-1 {
                    rooms.append([interval])
                    break
                }
            }
        }
        return rooms.count
    }
}
