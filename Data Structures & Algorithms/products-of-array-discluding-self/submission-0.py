class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        retArray = []
        for i, val in enumerate(nums):
            product = 1
            for j, innerVal in enumerate(nums):
                if j != i:
                    product=product*innerVal
            retArray.append(product)
        return retArray
