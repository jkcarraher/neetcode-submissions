class Solution:
    def largestRectangleArea(self, heights: List[int]) -> int:
        # Edge case - One height
        if len(heights) <= 1:
            return heights[0]
        
        stack = []
        maxArea = -1

        # O(n)
        for i, val in enumerate(heights):
            poppedidx = -1
            while stack and val < stack[-1][1]:
                popped = stack.pop()
                area = (i - popped[0]) * popped[1]
                poppedidx = popped[0]
                if area > maxArea:
                    maxArea = area
            if poppedidx != -1:
                stack.append((poppedidx, val))
            else:
                stack.append((i, val))

        while stack :
            popped = stack.pop()
            area = ( (len(heights)) - popped[0] ) * popped[1]
            if area > maxArea:
                maxArea = area



        return maxArea

