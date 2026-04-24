class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        freqMap = {}
        freqArray = [[] for i in range(len(nums) + 1)]

        for i, value in enumerate(nums):
            freqMap[value] = 1+freqMap.get(value, 0)
        
        print(freqArray)
        
        for key, value in freqMap.items():
            freqArray[value].append(key)

        ret = []

        for i in range(len(freqArray) - 1, 0, -1):
            for j in freqArray[i]:
                ret.append(j)
                if len(ret)>=k:
                    return ret


        return topKValues