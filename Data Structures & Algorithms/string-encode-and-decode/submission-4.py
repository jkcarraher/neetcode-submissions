sep = "#"

class Solution:

    def encode(self, strs: List[str]) -> str:
        retString = ""
        for string in strs:
            retString+=(str(len(string))+sep+string)

        print(retString)
        return retString

    def decode(self, s: str) -> List[str]:
        retArray = []

        i = 0

        while i < len(s):
            j = i
            print(s, j)
            while s[j] != sep:
                j+=1
            strLen = int( s[i:j] )
            retArray.append(s[(j+1) : j+1+strLen])
            
            i = j+1+strLen
        


        return retArray