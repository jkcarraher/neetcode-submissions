class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.count > k else { return [ nums.max()! ] }

        // Max Arr (idx)
        var retArr: [Int] = []

        // Queue where the top
        var q: [Int] = []
        
        var l = 0
        var r = 0

        while r < nums.count {
            // deque until end of queue is greater than r val we're about to add
            while !q.isEmpty && nums[r] > nums[q.last!] {
                q.removeLast()
            }
            q.append(r)

            // remove the val that's now out of window
            if q[0] < l {
                q.removeFirst()
            }

            // Increase indexes
            if r+1 >= k {
                retArr.append(nums[q[0]])
                l = l+1
            }
            r = r+1

        }

        return retArr
    }
}
