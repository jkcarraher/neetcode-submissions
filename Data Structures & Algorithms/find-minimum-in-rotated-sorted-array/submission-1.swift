class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var r = nums.count - 1

        var ret = nums[0]
        var l = 0
        
        while l <= r {
            // Bounds are in the right half
            if nums[l] < nums[r]{
                ret = min(ret, nums[l])
                break
            }

            let m = (l+r) / 2
            ret = min(ret, nums[m])
            if nums[m] >=  nums[l] {
                // Search Right
                l = m+1
            } else {
                // Search Left
                r = m-1
            }
        }
        return ret
    }
}
