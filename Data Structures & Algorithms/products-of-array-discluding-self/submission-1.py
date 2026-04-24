class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        retArray = [1 for _ in range(len(nums))]
        # O(n) - Fill prefixes
        runningPrefix = 1
        for i, val in enumerate(nums) :
            if i != 0:
                runningPrefix *= nums[i-1]
                retArray[i] *= runningPrefix
            

        # O(n) - Fill suffix
        runningSuffix = 1
        for i in range(len(nums)-1, -1, -1):
            if i != len(nums)-1:
                runningSuffix *= nums[i+1]
                retArray[i] *= runningSuffix

        return retArray
