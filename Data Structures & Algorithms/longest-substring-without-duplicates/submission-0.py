class Solution:
    def isUnique(s: str) -> bool:
        return len(s) == len(set(s))

    def lengthOfLongestSubstring(self, s: str) -> int:
        charSet = set()

        l = 0
        r = len(s)

        result = 0

        for r in range(len(s)):
            while s[r] in charSet:
                charSet.remove(s[l])
                l+=1
            charSet.add(s[r])
            result = max(result, r-l+1)
        return result