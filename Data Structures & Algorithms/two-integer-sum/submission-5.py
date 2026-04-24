class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        
        for i, numA in enumerate(nums):

            for j, numB in enumerate(nums[i:]):
                if (numA+numB == target) and i != j+i:
                    return [i, j+i];
        
        return []