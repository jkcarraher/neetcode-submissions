class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        var dict: [Int:Bool] = [:]

        for num in nums {
            if dict[num] == nil {
                dict[num] = true
            } else {
                return true
            }
        }
        return false
    }
}
