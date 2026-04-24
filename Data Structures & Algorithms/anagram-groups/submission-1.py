class Solution:
    def getCharMap(self, word: str):
        # O(n) where n is length of each word
        wordMap = {}
        for char in word :
            if char in wordMap:
                wordMap[char] += 1
            else:
                wordMap[char] = 1
        
        return wordMap

    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        allMaps = []
        retArray = []

        for word in strs:
            currMap = self.getCharMap(word)

            if currMap not in allMaps:
                allMaps.append(currMap)
                retArray.append([])

            matchIndex = allMaps.index(currMap)
            retArray[matchIndex].append(word)
        return retArray
