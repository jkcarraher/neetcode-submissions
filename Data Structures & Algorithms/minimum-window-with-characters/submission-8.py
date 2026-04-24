class Solution:
    def createFreqMap(self, s: str) -> dict:
        freqMap = {}
        for c in s:
            if c in freqMap:
                freqMap[c] += 1
            else:
                freqMap[c] = 1

        return freqMap


    def containsSubStr(self, s: str, tMap: dict) -> bool:
        sMap = self.createFreqMap(s)
        for key in tMap:
            if (not key in sMap) or (sMap[key] < tMap[key]):
                return False
        return True


    def minWindow(self, s: str, t: str) -> str:
        # Map of the string we're searching for
        tMap = self.createFreqMap(t)
        l, r = 0, 1
        retStr = ""
        retStrLen = float('inf')

        while r <= len(s) and l<r:
            if self.containsSubStr(s[l:r], tMap):
                if len(s[l:r]) < retStrLen:
                    retStr = s[l:r]
                    retStrLen= len(s[l:r])
                l+=1
            else:
                r+=1
        return retStr


        