struct Index: Hashable {
    var i: Int
    var j: Int

    func hash(into hasher: inout Hasher) {
        hasher.combine(i)
        hasher.combine(j)
    }
}

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var visited: [Index: Int] = [:]
        
        func dfs(_ i: Int,_ j: Int) -> Int {
            if i < 0 || i == m { return 0 }
            if j < 0 || j == n { return 0 }
            if i == m-1 && j == n-1 { return 1 }
            if visited[Index(i: i,j: j)] != nil { return visited[Index(i: i,j: j)]!}

            let sum = dfs(i+1, j) + dfs(i, j+1)
            visited[Index(i: i,j: j)] = sum
            return sum
        }
        return dfs(0,0)
    }
}