class Solution:
    def maxArea(self, heights: List[int]) -> int:
        left = 0
        right = len(heights) -1
        max = -1

        while left < right:
            area = (right - left) * min([heights[left], heights[right]])
            print(area)
            if area > max:
                max = area
            
            if heights[left] < heights[right]:
                left+=1
            else:
                right-=1
        return max
            