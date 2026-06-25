class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var goal = nums.count-1

        for i in stride(from: nums.count-2, through: 0, by: -1) {
            if goal <= i+nums[i] {
                goal = i
            }
        }
        return goal == 0
    }
}
