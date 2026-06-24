class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var rSum = 0
        var gMax = nums[0]
        
        for n in nums {
            if rSum < 0 {
                rSum = 0
            }
            rSum += n
            gMax = max(rSum, gMax)
        }
        return gMax
    }
}
