class Node:
    def __init__(self, val):
        self.val: str = val
        self.children: dict[str, Node] = {}

class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        cache = {}
        def dfs(start: int) -> int:
            curr = nums[start]
            if start == len(nums)-1: return 1
            if start in cache: return cache[start]

            resArr = []
            for i in range(start+1, len(nums)) :
                if nums[i] > curr :
                    resArr.append( dfs(i)+1 )

            if len(resArr) == 0:
                cache[start] = 1
                return 1
            cache[start] = max(resArr)
            return max(resArr)
                    
        res = []
        for i in range( 0, len(nums) ):
            res.append( dfs(i) )
        return max(res)

