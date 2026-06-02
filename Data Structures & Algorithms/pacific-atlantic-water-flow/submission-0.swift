class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        let rows: Int = heights.count
        let cols: Int = heights[0].count
        var pacific = Set<Cell>()
        var atlantic = Set<Cell>()

        func dfs(_ r: Int, _ c: Int,_ visited: inout Set<Cell>,_ prev: Int) {
            if visited.contains( Cell(row: r, col: c) ) { return }
            if r == rows || c == cols || c < 0 || r < 0 { return }
            if heights[r][c] < prev { return }
            
            visited.insert( Cell(row: r,col: c) )
            dfs(r+1,c, &visited, heights[r][c])
            dfs(r-1,c, &visited, heights[r][c])
            dfs(r,c+1, &visited, heights[r][c])
            dfs(r,c-1, &visited, heights[r][c])
            
        }

        for c in 0..<cols {
            dfs(0, c, &pacific, heights[0][c])
            dfs(rows-1, c, &atlantic, heights[rows-1][c])
        }

        for r in 0..<rows {
            dfs(r, 0, &pacific, heights[r][0])
            dfs(r, cols-1, &atlantic, heights[r][cols-1])
        }

        var retArr: [[Int]] = []
        for r in 0..<rows {
            for c in 0..<cols {
                if pacific.contains(Cell(row:r, col:c)) && atlantic.contains(Cell(row:r, col:c)){
                    retArr.append([r,c])
                }
            }
        }
        return retArr
    }
}

struct Cell: Hashable {
    let row: Int
    let col: Int
}
