class Solution:
    def maxSlidingWindow(self, nums: List[int], k: int) -> List[int]:
        l, r = 0, k
        retArray = []

        while r <= len(nums):
            retArray.append(max(nums[l:r]))
            l+=1
            r+=1

        return retArray