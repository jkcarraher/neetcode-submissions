class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        gMax = nums[0]
        curSum = 0
        
        for num in nums:
            if curSum < 0:
                curSum = 0
            curSum += num
            gMax = max(curSum, gMax)
        return gMax