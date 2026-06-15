class Solution {
    func numDecodings(_ s: String) -> Int {
        let s = Array(s)
        guard s.count > 0 else { return 0 }

        var visited: [Int: Int] = [:]

        return dfs(0)

        func dfs(_ i: Int) -> Int {
            guard i < s.count else { return 1 }
            guard s[i] != "0" else { return 0 }
            if visited[i] != nil { return visited[i]! }

            var subSum = dfs(i+1)
            if i+1 < s.count && (s[i] == "1" || (s[i] <= "2" && s[i+1] <= "6") ) {
                subSum += dfs( i+2 )
            }
            visited[i] = subSum
            return subSum
        }
    }
}
