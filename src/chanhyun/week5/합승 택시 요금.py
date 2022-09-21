def solution(n, s, a, b, fares):
    answer = 0
    dist = [[1e9 for _ in range(n)] for _ in range(n)]
    for f in fares:
        dist[f[0]-1][f[1]-1] = f[2]
        dist[f[1]-1][f[0]-1] = f[2]
    for i in range(n):
        dist[i][i] = 0
    for k in range(n):
        for i in range(n):
            for j in range(n):
                if dist[i][j] > dist[i][k]+dist[k][j]:
                    dist[i][j] = dist[i][k]+dist[k][j]
    s -= 1
    a -= 1
    b -= 1
    answer = 1e9
    for i in range(n):
        answer = min(answer, dist[s][i]+dist[i][a]+dist[i][b])
    return answer