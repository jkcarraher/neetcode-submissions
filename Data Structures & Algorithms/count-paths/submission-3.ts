class Solution {
    /**
     * @param {number} m
     * @param {number} n
     * @return {number}
     */
    uniquePaths(m: number, n: number): number {
        let visited = {}
        function dfs(i: number, j: number): number {
            let cordStr = i+","+j
            if (i < 0 || i == m+1) { return 0 }
            if (j < 0 || j == n+1) { return 0 }
            if (i == m-1 && j == n-1) { return 1 }
            if (cordStr in visited) { return visited[cordStr] }

            let sum = dfs(i+1, j) + dfs(i, j+1)
            visited[cordStr] = sum
            return sum
        }
        return dfs(0,0)
    }
}
