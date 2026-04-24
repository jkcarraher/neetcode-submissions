class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        
        for i, numA in enumerate(nums):

            for j, numB in enumerate(nums):
                if (numA+numB == target) and i != j:
                    return [i, j];
        
        return None