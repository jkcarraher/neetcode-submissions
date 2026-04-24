class Solution:
    def isValidSudoku(self, board: List[List[str]]) -> bool:

        # O(n^2) - Check rows
        for row in board:
            rowRecord = {str(index): False for index in range(1, len(row)+1) }
            for entry in row:
                if rowRecord.get(entry) == True:
                    return False
                elif entry.isdigit():
                    rowRecord[entry] = True

        # O(n^2) - Check cols
        for i in range(9):
            rowRecord = {str(index): False for index in range(1, 9 )}
            for j in range(9):
                entry = board[j][i]
                if rowRecord.get(entry) == True:
                    return False
                elif entry.isdigit():
                    rowRecord[entry] = True

        # O(n^2) - check 3x3 boxes
        for i in range(9):
            rowRecord = {str(index): False for index in range(1, 9 )}
            rowBase = 3 * (i % 3)
            colBase = (int(i/3)) * 3
            for j in range(3):
                for k in range(3):
                    entry = board[rowBase+j][colBase+k]
                    if rowRecord.get(entry) == True:
                        return False
                    elif entry.isdigit():
                        rowRecord[entry] = True

            

        return True
