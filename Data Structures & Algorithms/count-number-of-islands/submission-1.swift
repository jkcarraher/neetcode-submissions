class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: cols), count: rows)
        var count: Int = 0
        
        func dfs(_ r: Int, _ c: Int) {
            // NOT - Out of Bounds
            guard r >= 0 && c >= 0 && r < rows && c < cols else { return }
            // NOT - Already visited
            guard !visited[r][c] else { return }
            visited[r][c] = true
            // NOT - IsZero
            guard grid[r][c] != "0" else { return }

            dfs(r+1, c)
            dfs(r-1, c)
            dfs(r, c+1)
            dfs(r, c-1)
        }
        for c in 0..<cols {
            for r in 0..<rows {
                if grid[r][c] == "1" && !visited[r][c]{
                    dfs(r,c)
                    count+=1
                }
            }
        }

        return count
    }
}
