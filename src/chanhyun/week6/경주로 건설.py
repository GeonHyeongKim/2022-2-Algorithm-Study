from collections import deque

def solution(board):
    answer = 0
    n = len(board)
    cost = [[1e9 for _ in range(n)] for _ in range(n)]
    cost[0][0] = 0
    dx = [-1,0,1,0]
    dy = [0,1,0,-1]
    q = deque([[0,0,1],[0,0,2]])
    while q:
        x, y, d = q.popleft()
        for i in range(4):
            nx = x + dx[i]
            ny = y + dy[i]
            if 0<=nx<n and 0<=ny<n and board[nx][ny] == 0:
                if d == i and cost[nx][ny] >= cost[x][y]+100:
                    cost[nx][ny] = cost[x][y]+100
                    q.append([nx, ny, i])
                elif d != i and cost[nx][ny] >= cost[x][y]+600:
                    cost[nx][ny] = cost[x][y]+600
                    q.append([nx, ny, i])
    return cost[-1][-1]