class Solution:
    def isPalindrome(self, s: str) -> bool:

        i, j = 0, len(s)-1
        while i < j:
            print(s)
            while i < len(s) and not s[i].isalnum():
                i+=1
            while j > 0 and not s[j].isalnum():
                j-=1
            
            if not i <= j:
                return True
            elif s[i].upper() != s[j].upper():
                return False
            
            j-=1
            i+=1

        return True

        