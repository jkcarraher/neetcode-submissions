class Solution {
    func combinationSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var nums = nums
        var res: [[Int]] = []

        func dfs(_ i: Int, _ cur: [Int], _ total: Int) {
            var cur = cur
            if total == target {
                res.append(cur)
                return
            }

            if i >= nums.count || total > target {
                return
            }

            cur.append(nums[i])
            dfs(i, cur, total + nums[i])
            cur.popLast()
            dfs(i+1, cur, total)
            
        }

        dfs(0,[],0)
        return res
    }

    
}
