class Solution {
    /**
     * @param {number[]} nums
     * @return {boolean}
     */
    hasDuplicate(nums: number[]): boolean {
        let dict: Record<number, boolean> = {}
        for (let num of nums) {
            if (num in dict) {
                return true
            } else {
                dict[num] = true
            }
        }
        return false
    }
}
