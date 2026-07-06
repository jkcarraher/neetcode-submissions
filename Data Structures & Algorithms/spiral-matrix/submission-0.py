class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        visited = []
        left = 0
        right = len(matrix[0])
        top = 0
        bottom = len(matrix)

        while left != right and top != bottom :

            # Move col right
            for i in range(left, right):
                visited.append(matrix[top][i])
            top+=1

            # Move row down
            for j in range(top, bottom):
                visited.append(matrix[j][right-1])
            right-=1

            if left == right or top == bottom:
                break

            # Move col left
            for i in range(right-1, left-1, -1):
                visited.append(matrix[bottom-1][i])
            bottom-=1

            # Move row up
            for j in range(bottom-1, top-1, -1):
                visited.append(matrix[j][left])
            left+=1
            
        return visited