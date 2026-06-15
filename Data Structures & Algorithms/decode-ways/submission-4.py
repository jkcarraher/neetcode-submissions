class Solution:
    def numDecodings(self, s: str) -> int:
        if len(s) == 0: return 0
        if s[0] == "0": return 0
        
        i = 0
        visited = {}

        def dfs( i: int) -> int:
            if i == len(s): return 1
            if s[i] == "0": return 0
            if i in visited: return visited[i]

            branchSum = 0
            
            branchSum += dfs(i+1)
            if i+1 < len(s) and int(s[i]+s[i+1]) <= 26:
                branchSum += dfs(i+2)

            visited[i] = branchSum
            return branchSum

        return dfs(0)

    


        