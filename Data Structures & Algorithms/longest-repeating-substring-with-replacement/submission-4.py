class Solution:
    def isValid (self, s: str, k: int) -> bool:
        charFreq = {}
        for char in s:
            if char in charFreq:
                charFreq[char] += 1
            else:
                charFreq[char] = 1
                refChar = s[0]
        refChar = max(charFreq, key=charFreq.get)
        
        return len(s) - charFreq[refChar] <= k

    def characterReplacement(self, s: str, k: int) -> int:
        l = 0
        r = 1
        max = 0

        while r < len(s)+1:
            print(s[l:r])
            if self.isValid(s[l:r], k):
                if max < len(s[l:r]):
                    max = len(s[l:r])
                    print(max)
                r+=1
            else:
                l+=1
                
        return max
