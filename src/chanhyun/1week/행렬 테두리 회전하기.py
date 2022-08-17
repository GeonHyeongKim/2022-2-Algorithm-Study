def rotate(board,x1,y1,x2,y2):
    stack = []
    t1 = board[x1][y1]
    
    for i in range(x1, x2):
        board[i][y1] = board[i+1][y1]
        stack.append(board[i][y1])
    for j in range(y1, y2):
        board[x2][j] = board[x2][j+1]
        stack.append(board[x2][j])
    for i in range(x2, x1, -1):
        board[i][y2] = board[i-1][y2]
        stack.append(board[i][y2])
    for j in range(y2, y1, -1):
        board[x1][j] = board[x1][j-1]
        stack.append(board[x1][j])
    
    board[x1][y1+1] = t1
    stack.append(board[x1][y1+1])
    
    return min(stack)

def solution(rows, columns, queries):
    answer = []
    board = [[0 for _ in range(columns)] for _ in range(rows)]
    cnt = 1
    for i in range(rows):
        for j in range(columns):
            board[i][j] = cnt
            cnt += 1
    
    for q in queries:
        answer.append(rotate(board, q[0]-1, q[1]-1, q[2]-1, q[3]-1))
    
    return answer