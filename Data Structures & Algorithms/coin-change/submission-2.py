class Solution:
    def coinChange(self, coins: List[int], amount: int) -> int:
        if amount == 0: return 0
        
        cache = {}

        def dfs(curr_sum) -> float:
            if curr_sum == amount:
                return 0
            if curr_sum > amount:
                return float('inf')

            if curr_sum in cache:
                return cache[curr_sum]

            ans = min(1 + dfs(curr_sum + c) for c in coins)
            cache[curr_sum] = ans
            return ans
        
        res = []
        for coin in coins:
            res.append( dfs(coin) )
        
        if min(res) == float('inf'):
            return -1
        else :
            return int(min(res)+1)
        
        
        
            