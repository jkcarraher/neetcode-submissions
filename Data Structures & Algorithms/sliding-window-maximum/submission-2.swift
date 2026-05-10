class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.count > k else { return [ nums.max()! ] }

        // Max Arr (idx)
        var retArr: [Int] = []

        var deque: [Int] = []
        
        var l = 0
        var r = 0

        while r < nums.count {
            // pop until end of queue is greater than curr
            while !deque.isEmpty && nums[r] > nums[deque.last!] {
                deque.popLast()
            }
            deque.append(r)

            // remove left val from window
            if deque[0] < l {
                deque.removeFirst()
            }

            if r+1 >= k {
                retArr.append(nums[deque[0]])
                l = l+1
            }
            r = r+1

        }

        return retArr
    }
}
