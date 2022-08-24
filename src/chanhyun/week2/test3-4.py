import sys
sys.setrecursionlimit(10**9)

def solution(n, lighthouse):
    answer = 0
    dp = [[0,0] for _ in range(n+1)]
    graph = [[] for _ in range(n+1)]
    for x, y in lighthouse:
        graph[x].append(y)
        graph[y].append(x)
    
    visited = [False for _ in range(n+1)]
    def dfs(x):
        visited[x] = True
        dp[x][1] = 1
        for y in graph[x]:
            if not visited[y]:
                dfs(y)
                dp[x][0] += dp[y][1]
                dp[x][1] += min(dp[y][0] , dp[y][1])
    dfs(1)
    answer = min(dp[1][0],dp[1][1])
    return answer