class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        retMap = {}
        retArray = []

        for i, num in enumerate(nums):
            if not num in retMap:
                retMap[num] = 1
            else: 
                retMap[num] += 1
        
        topKValues = [
            key for key, value in 
            sorted(retMap.items(), key=lambda item: item[1], reverse=True)
        ][:k]
        
        return topKValues