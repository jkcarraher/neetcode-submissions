class Solution:
    def largestRectangleArea(self, heights: List[int]) -> int:
        # Edge case - One height
        if len(heights) <= 1:
            return heights[0]
        
        maxRects = {}

        for l in range(len(heights)):
            localMin = heights[l]
            maxRects[l] = localMin
            for j in range(len(heights[l+1:])):
                r = l+j+1
                if heights[r] < localMin:
                    localMin = heights[r]
                currArea = localMin * (j+2)

                if currArea > maxRects[l]:
                    maxRects[l] = currArea
        
        return max(maxRects.values())
