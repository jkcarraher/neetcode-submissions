class Solution {
    /**
     * @param {number[]} nums
     * @return {number}
     */
    rob(nums: number[]): number {
        let memo: number[] = new Array(nums.length).fill(-1)
        
        function dfs(i: number): number {
            if (i >= nums.length) {
                return 0
            }
            if (memo[i] !== -1) {
                return memo[i]
            }
            const skip = dfs(i+1)
            const rob = nums[i]+dfs(i+2)
            memo[i] = Math.max(skip, rob)
            return memo[i]
        }
        return dfs(0)
    }
}
