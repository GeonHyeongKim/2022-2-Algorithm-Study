def solution(m, n, board):
    answer = 0
    for i in range(m):
        board[i] = list(board[i])
    
    while True:
        pop_list = []
        for i in range(m-1):
            for j in range(n-1):
                if board[i][j] != '0' and board[i][j] == board[i+1][j] and board[i][j] == board[i][j+1] and board[i][j] == board[i+1][j+1]:
                    pop_list.append((i,j))

        if len(pop_list) == 0:
            break
                    
        for i,j in pop_list:
            for x,y in [[0,0],[0,1],[1,0],[1,1]]:
                if board[i+x][j+y] != '0':
                    board[i+x][j+y] = '0'
                    answer += 1
        
        for j in range(n):
            for i in range(m-1, -1, -1):
                if board[i][j] != '0' and i+1 < m:
                    x = i
                    while x+1 < m and board[x+1][j] == '0':
                        board[x][j], board[x+1][j] = board[x+1][j], board[x][j]
                        x += 1
    
    return answer