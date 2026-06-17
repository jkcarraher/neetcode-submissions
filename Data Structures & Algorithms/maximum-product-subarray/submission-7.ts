class Solution {
    /**
     * @param {number[]} nums
     * @return {number}
     */
    maxProduct(nums: number[]): number {
        let res = Math.max(...nums)
        let curMax = 1
        let curMin = 1

        for (let n of nums) {

            let tmp = curMax * n
            curMax = Math.max(tmp, curMin*n, n)
            curMin = Math.min(tmp, curMin*n, n)

            res = Math.max(res, curMax)
        }

        return res

    }
}
