import math
import sys
from collections import deque

input = sys.stdin.readline

n, m = map(int, input().split())
arr = [list(map(int, input().split())) for _ in range(n)]

dy = [-1, -1, -1, 0, 1, 0, 1, 1]
dx = [-1, 0, 1, 1, 1, -1, 0, -1]


def bfs(y, x):
    visited[y][x] = 1
    queue = deque()
    queue.append((y, x, 0))
    temp = math.inf
    while queue:
        y, x, count = queue.popleft()
        if arr[y][x] == 1:
            return count
        for i in range(8):
            ny, nx = dy[i] + y, dx[i] + x
            if ny < 0 or ny >= n or nx < 0 or nx >= m:
                continue
            if not visited[ny][nx]:
                visited[ny][nx] = 1
                queue.append((ny, nx, count + 1))
    return temp if temp != math.inf else count


answer = -math.inf
for i in range(n):
    for j in range(m):
        if arr[i][j] == 0:
            visited = [[0] * m for _ in range(n)]
            answer = max(bfs(i, j), answer)

print(answer)
