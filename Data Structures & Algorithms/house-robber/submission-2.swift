class Solution {
    func rob(_ nums: [Int]) -> Int {
        var memo = Array(repeating: -1, count: nums.count)
        
        func dfs(_ i: Int) -> Int {
            guard i < nums.count else { return 0 }

            if memo[i] != -1 {
                return memo[i]
            }
            let skip = dfs(i+1)
            let rob = nums[i]+dfs(i+2)
            memo[i] = max(skip, rob)

            return memo[i]
        }

        return dfs(0)
    }
}

