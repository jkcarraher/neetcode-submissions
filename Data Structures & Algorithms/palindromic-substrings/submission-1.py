class Solution:
    def countSubstrings(self, s: str) -> int:
        subStrs = []

        for i in range(len(s)):
            # Odd case
            l, r = i, i
            while l >= 0 and r < len(s) and s[l] == s[r]:
                subStrs.append(s[l:r+1])
                l-=1
                r+=1
            # Even case
            l, r = i, i+1
            while l >= 0 and r < len(s) and s[l] == s[r]:
                subStrs.append(s[l:r+1])
                l-=1
                r+=1
        return len(subStrs)