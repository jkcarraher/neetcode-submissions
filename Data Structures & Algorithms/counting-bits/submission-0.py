class Solution:
    def countBits(self, n: int) -> List[int]:

        retArr = []
        
        for num in range(n+1) :
            
            count = 0
            for i in range(32) :
                mask = 1 << i
                if (num & mask) != 0:
                    count +=1

            retArr.append(count)
                
        return retArr