class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        seenMap = {}

        for i, num in enumerate(nums):
            searchNum = target - num
            if (searchNum in seenMap):
                return [ seenMap[searchNum], i]
            else:
                seenMap[num] = i

        return []