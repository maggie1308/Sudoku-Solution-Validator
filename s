'''
Sudoku Background
Sudoku is a game played on a 9x9 grid. The goal of the game is to fill all cells of the grid with digits from 1 to 9, so that each column, each row, and each of the nine 3x3 sub-grids (also known as blocks) contain all of the digits from 1 to 9.
(More info at: http://en.wikipedia.org/wiki/Sudoku)

Sudoku Solution Validator
Write a function // that accepts a 2D array representing a Sudoku board, and returns true if it is a valid solution, or false otherwise. The cells of the sudoku board may also contain 0's, which will represent empty cells. Boards containing one or more zeroes are considered to be invalid solutions.validSolutionValidateSolutionvalid_solution()

The board is always 9 cells by 9 cells, and every cell only contains integers from 0 to 9.

Examples
validSolution([
  [5, 3, 4, 6, 7, 8, 9, 1, 2],
  [6, 7, 2, 1, 9, 5, 3, 4, 8],
  [1, 9, 8, 3, 4, 2, 5, 6, 7],
  [8, 5, 9, 7, 6, 1, 4, 2, 3],
  [4, 2, 6, 8, 5, 3, 7, 9, 1],
  [7, 1, 3, 9, 2, 4, 8, 5, 6],
  [9, 6, 1, 5, 3, 7, 2, 8, 4],
  [2, 8, 7, 4, 1, 9, 6, 3, 5],
  [3, 4, 5, 2, 8, 6, 1, 7, 9]
]); // => true
validSolution([
  [5, 3, 4, 6, 7, 8, 9, 1, 2], 
  [6, 7, 2, 1, 9, 0, 3, 4, 8],
  [1, 0, 0, 3, 4, 2, 5, 6, 0],
  [8, 5, 9, 7, 6, 1, 0, 2, 0],
  [4, 2, 6, 8, 5, 3, 7, 9, 1],
  [7, 1, 3, 9, 2, 4, 8, 5, 6],
  [9, 0, 1, 5, 3, 7, 2, 1, 4],
  [2, 8, 7, 4, 1, 9, 6, 3, 5],
  [3, 0, 0, 4, 8, 1, 1, 7, 9]
]); // => false

'''



def vertical_list(board):
    vertical_board = []
    for i in range(len(board)):
        vertical_board.append([board[0][i],board[1][i],board[2][i],
                       board[3][i],board[4][i],board[5][i],
                       board[6][i],board[7][i], board[8][i]])
    return vertical_board 

def cubic_list(board):
    cubic_board = []
    for i in range(0,len(board),3):
        for j in range(0,len(board),3):
            cubic_board.append([board[i][j],board[i+1][j],board[i+2][j],
                                   board[i][j+1],board[i+1][j+1],board[i+2][j+1],
                                   board[i][j+2],board[i+1][j+2], board[i+2][j+2]])
    return cubic_board

def valid_solution(board):
    vertical_board = vertical_list(board)
    cobic_board = cubic_list(board)
    k = 0
    a = False
    if len(board) != 9:
        return False
    for i in range(len(board)):
        for number in (board[i]):
            if number == 0:
                return False
            else:
                if board[i].count(number) == 1 \
                and vertical_board[0+k].count(number) == 1 \
                and cobic_board[k//3+ i//3 ].count(number) == 1:
                    k +=1
                else: return False 
        k = 0
    return True
