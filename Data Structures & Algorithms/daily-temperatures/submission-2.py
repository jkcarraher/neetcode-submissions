class Solution:
    def dailyTemperatures(self, temperatures: List[int]) -> List[int]:
        result = []

        # Edge case - one temp in list
        if len(temperatures) <=1:
            return [0]

        l, r = 0,1
        tempCount = 0
        while l < len(temperatures):
            if r >= len(temperatures):
                # Found None
                result.append(0)
                tempCount=0
                l+=1
                r=l+1
            elif temperatures[r] > temperatures[l]:
                # Found Greater
                result.append(tempCount+1)
                tempCount=0
                l+=1
                r=l+1
            else:
                # Greater Not Found Yet
                tempCount+=1
                r+=1

        return result

