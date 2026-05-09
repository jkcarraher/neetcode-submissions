class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // Value:Index
        var dict: [Int:Int] = [:]

        for (i,n) in nums.enumerated() {
            let diff = target - n
            if let val = dict[diff] {
                return [val, i]
            }
            dict[n] = i
        }
        return []
    }
}
