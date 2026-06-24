class Solution {
    /**
     * @param {number[]} nums
     * @return {number}
     */
    maxSubArray(nums: number[]): number {
        let rSum = 0
        let gMax = nums[0]

        for (let n of nums) {
            if (rSum < 0) {
                rSum = 0
            }
            rSum += n
            gMax = Math.max(rSum, gMax)
        }

        return gMax
    }
}
