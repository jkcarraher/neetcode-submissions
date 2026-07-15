class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        uNums = set(nums)
        for i in range(len(nums)+1):
            if i not in uNums:
                return i
        return -1