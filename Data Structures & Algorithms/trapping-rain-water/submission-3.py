class Solution:
    def trap(self, height: List[int]) -> int:

        if( len(height)==1 ):
            return 0

        maxL = {}
        maxR = {}
        tot = 0

        # O(n)
        for i, val in enumerate(height):
            if i == 0:
                maxL[i] = 0
            else:
                maxL[i] = max( height[:i] )
        # O(n)
        for i, val in enumerate(height):
            if i == len(height)-1 :
                maxR[i] = 0
            else :
                maxR[i] = max(height[i+1:])

        # O(n)
        for i, val in enumerate(height):
            tot += max(0, min(maxR[i], maxL[i]) - height[i])



        return tot
