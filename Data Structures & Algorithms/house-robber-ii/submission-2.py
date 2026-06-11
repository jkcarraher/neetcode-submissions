class Solution:
    def rob(self, nums: List[int]) -> int:
        if len(nums) == 1 :
            return nums[0]
        
        def robArr(arr: List[int]) -> int:
            visited = {}
            def dfs(i: int) -> int:
                if i >= len(arr): return 0

                if i in visited :
                    return visited[i]
                
                steal = arr[i]+dfs(i+2)
                skip = dfs(i+1)

                visited[i] = max(steal, skip)
                return max(steal, skip)
            return dfs(0)
        
        return max(
            robArr( nums[:-1] ), 
            robArr( nums[1:] )
            )
