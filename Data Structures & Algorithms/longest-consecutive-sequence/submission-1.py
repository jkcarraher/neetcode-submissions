class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        startNumMap = {}
        
        # Convert to dictionary - O(n)
        numsMap = {num: 0 for num in nums}

        # For e/a num find startNums- O(n)
        for num in nums:
            if num-1 not in numsMap:
                startNumMap[num] = 1
        
        # For e/a start count how long it goes - O(n)
        for num in startNumMap:
            i = num
            while i+1 in numsMap:
                startNumMap[num] += 1
                i+=1

        # Return max of the startNums - O(m) where m = len of startMap
        if len(startNumMap.values()) == 0:
            return 0
        
        return max(startNumMap.values())
