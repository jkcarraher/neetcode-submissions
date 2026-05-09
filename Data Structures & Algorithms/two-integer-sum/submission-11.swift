class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // O(n^2) - Brute force
        print(nums)
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
            }
        }
        return []
    }
}
