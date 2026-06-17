class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var res = nums.max()!
        var curMax = 1
        var curMin = 1

        for n in nums {
            if n == 0 {
                curMax = 1
                curMin = 1
            }
            let tmp = [curMax*n]+[curMin * n]+[n]
            curMax = tmp.max()!
            curMin = tmp.min()!
            
            res = max(curMax, res)
        }
        return res
    }
}
