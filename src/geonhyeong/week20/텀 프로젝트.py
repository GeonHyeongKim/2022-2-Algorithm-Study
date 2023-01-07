## 텀 프로젝트
## Question Link: https://www.acmicpc.net/problem/9466

## 텀 프로젝트
## Question Link: https://www.acmicpc.net/problem/9466

import sys
input = sys.stdin.readline

def dfs(student):
    global ans
    visited[student] = True
    cycle.append(student)
    num = board[student]

    if visited[num]:
        if num in cycle:
            ans += cycle[cycle.index(num):]
        return
    else:
        dfs(num)

t = int(input())

for _ in range(t):
    n = int(input())
    board = [0] + list(map(int, input().split()))
    visited = [False] * (n + 1)
    ans = []

    for i in range(1, n + 1):
        if not visited[i]:
            cycle = []
            dfs(i)

    print(n - len(ans))
