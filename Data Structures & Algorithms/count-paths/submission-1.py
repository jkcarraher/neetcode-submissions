class Solution:
    def uniquePaths(self, m: int, n: int) -> int:
        visited = {}
        
        def dfs(i: int, j: int) -> int:
            if i < 0 or i > m : return 0
            if j < 0 or j > n : return 0
            if i == m-1 and j == n-1 : return 1
            if (i, j) in visited: return visited[(i,j)]

            sum = dfs(i+1, j) + dfs(i, j+1)
            visited[(i,j)] = sum
            return sum
        
        return dfs(0,0)