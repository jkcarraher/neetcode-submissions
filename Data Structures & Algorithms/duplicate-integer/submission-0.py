class Solution:
    def hasDuplicate(self, nums: List[int]) -> bool:
        my_dict = {}

        for num in nums:
            if my_dict.get(num) == None:
                my_dict[num] = True
            else:
                return True
        return False