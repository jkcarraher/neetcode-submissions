class Solution:
    def setZeroes(self, matrix: List[List[int]]) -> None:
        rows = set()
        cols = set()

        for i in range( len(matrix) ) :
            for j in range( len(matrix[0]) ) :
                if matrix[i][j] == 0:
                    rows.add(i)
                    cols.add(j)
        
        for row in rows:
            for col in range(len(matrix[row])):
                matrix[row][col] = 0

        for col in cols:
            for row in range(len(matrix)):
                matrix[row][col] = 0

        
        