class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count - 1

        while l <= r {
            let m = (l+r) / 2
            if nums[m] == target {
                return m
            }

            if nums[m] >= nums[l] {
                // M on Left
                if nums[l] <= target && target < nums[m]{
                    r = m-1
                } else {
                    l = m+1
                }

            } else {
                // M on Right
                if nums[m] < target && target <= nums[r]{
                    l = m+1
                } else {
                    r = m-1
                }
            }
        }
        return -1
    }
}
