class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let word = Array(word)
        let rows = board.count
        let cols = board[0].count
        var path: [(Int, Int)] = []

        func dfs(_ r: Int, _ c: Int, _ i: Int) -> Bool {
            if i == word.count {
                return true
            }
            if r < 0 || c < 0 ||
                r >= rows || c >= cols ||
                word[i] != board[r][c] ||
                path.contains(where: { $0 == (r, c) }) {
                return false
            }                
            // Success!
            path.append((r,c))
            let res = dfs(r+1, c, i+1) ||
                dfs(r-1, c, i+1) ||
                dfs(r, c+1, i+1) ||
                dfs(r, c-1, i+1)
            path.removeLast()
            return res
        }

        for r in 0..<rows {
            for c in 0..<cols {
                if dfs(r,c,0) {
                    return true
                }
            }
        }
        return false
    }
}
