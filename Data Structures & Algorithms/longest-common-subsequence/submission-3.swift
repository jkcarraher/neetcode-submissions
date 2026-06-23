class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let text1 = Array(text1)
        let text2 = Array(text2)

        var memo: [String: Int] = [:]
        func dfs(_ i: Int, _ j: Int) -> Int {
            let key: String = String(i)+","+String(j)
            if i == text1.count || j == text2.count { return 0 }
            if text1[i] == text2[j] { return 1+dfs(i+1, j+1) }
            if memo[key] != nil { return memo[key]! }

            memo[ key ] = max(dfs(i+1, j), dfs(i, j+1))
            return memo[key]!
        }
        return dfs(0,0)
    }
}
