class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.count >= k else { return [ nums.max()! ] }

        // Max Dict (idx, val)
        var maxArr: [Int] = []
        
        var l = 0
        var r = k-1

        while r < nums.count {
            maxArr.append(nums[l...r].max()!)
            l = l+1
            r = r+1
        }

        return maxArr
    }
}
