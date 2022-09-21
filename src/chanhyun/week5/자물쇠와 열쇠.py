def rotate(key):
    M = len(key)
    newKey = [[0 for _ in range(M)] for _ in range(M)]
    for i in range(M):
        for j in range(M):
            newKey[M-1-j][i] = key[i][j]
    return newKey

def check(board):
    N = len(board)//3
    for i in range(N, N*2):
        for j in range(N, N*2):
            if board[i][j] != 1:
                return False
    return True

def solution(key, lock):
    N = len(lock)
    M = len(key)
    board = [[0 for _ in range(N*3)] for _ in range(N*3)]
    for i in range(N):
        for j in range(N):
            board[N+i][N+j] = lock[i][j]
    for _ in range(4):
        key = rotate(key)
        for i in range(N*2):
            for j in range(N*2):
                for x in range(M):
                    for y in range(M):
                        board[i+x][j+y] += key[x][y]
                if check(board):
                    return True
                for x in range(M):
                    for y in range(M):
                        board[i+x][j+y] -= key[x][y]
    return False