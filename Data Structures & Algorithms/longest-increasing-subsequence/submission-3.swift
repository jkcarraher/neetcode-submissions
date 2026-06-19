class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var retArr = Array(repeating: 1, count: nums.count)

        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            for j in i+1..<nums.count {
                if nums[i] < nums[j] { 
                    retArr[i] = max(retArr[i], 1+retArr[j])
                }
            }
        }

        return retArr.max()!
    }
}
