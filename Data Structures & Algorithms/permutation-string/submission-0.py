class Solution:
    def createFreqDic(self, text: str) -> dict:
        freq = {}

        for char in text:
            freq[char] = freq.get(char, 0) + 1
        return freq

    def isPermutation(self, s1: str, s2: str) -> bool:
        return self.createFreqDic(s1) == self.createFreqDic(s2)

    def checkInclusion(self, s1: str, s2: str) -> bool:
        l = 0
        r = len(s1)
        while r < len(s2) + 1:
            if self.isPermutation(s1, s2[l:r]):
                return True
            r+=1
            l+=1
        return False
        