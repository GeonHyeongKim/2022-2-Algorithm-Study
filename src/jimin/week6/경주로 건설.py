import math
from collections import deque

def solution(board):
    n = len(board) #0: 비어있음, 1: 채움

    #상 하 좌 우
    dy = [-1, 1, 0, 0]
    dx = [0, 0, -1, 1]

    queue = deque()
    def bfs(y, x, dir):
        visited = list([math.inf] * n for _ in range(n))
        visited[0][0] = 0
        queue.append((y, x, 0, dir)) #좌표, 비용, 방향
        while queue:
            y, x, cost, dir = queue.popleft()
            for i in range(4):
                ny, nx = dy[i] + y, dx[i] + x
                if 0 <= ny < n and 0 <= nx < n and board[ny][nx] != 1:
                    temp_cost = cost + (100 if dir == i else 600)
                    if temp_cost <= visited[ny][nx]:
                        visited[ny][nx] = temp_cost
                        queue.append((ny, nx, temp_cost, i))
        return visited[-1][-1]

    return min(bfs(0, 0, 3), bfs(0, 0, 1))


board = [[0,0,0],[0,0,0],[0,0,0]]
board = [[0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0],[0,0,0,0,0,1,0,0],[0,0,0,0,1,0,0,0],[0,0,0,1,0,0,0,1],[0,0,1,0,0,0,1,0],[0,1,0,0,0,1,0,0],[1,0,0,0,0,0,0,0]]
board = [[0,0,1,0],[0,0,0,0],[0,1,0,1],[1,0,0,0]]
board = [[0,0,0,0,0,0],[0,1,1,1,1,0],[0,0,1,0,0,0],[1,0,0,1,0,1],[0,1,0,0,0,1],[0,0,0,0,0,0]]
print(solution(board))