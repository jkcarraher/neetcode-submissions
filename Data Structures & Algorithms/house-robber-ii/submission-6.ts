class Solution {
    /**
     * @param {number[]} nums
     * @return {number}
     */
    rob(nums: number[]): number {
        if (nums.length == 1) { return nums[0] }

        function robArr(arr: number[]): number {
            let visited: Record<number, number> = {};

            function dfs(i: number): number {
                if (i >= arr.length) {return 0}
                if (visited[i] != null ) {
                    return visited[i]
                }
                const skip = dfs(i+1)
                const steal = arr[i]+dfs(i+2)
                visited[i] = Math.max( skip, steal)
                return visited[i]
            }
            return dfs(0)
        }

        
        return Math.max(
            robArr(nums.slice(1)),
            robArr(nums.slice(0, -1))
        )
    }
}
