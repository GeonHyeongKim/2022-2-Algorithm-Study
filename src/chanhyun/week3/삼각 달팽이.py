def solution(n):
    answer = []
    tri = [[0 for _ in range(n)] for _ in range(n)]
    dx = [1,0,-1]
    dy = [0,1,-1]
    d = 0
    total = 0
    for i in range(1, n+1):
        total += i
    x = 0
    y = 0
    tri[x][y] = 1
    for i in range(2, total+1):
        if x + dx[d] >= n or y + dy[d] >= n or tri[x+dx[d]][y+dy[d]] != 0:
            if d == 2:
                d = 0
            else:
                d += 1
        x += dx[d]
        y += dy[d]
        tri[x][y] = i
    for i in range(n):
        for j in range(n):
            if tri[i][j] != 0:
                answer.append(tri[i][j])
    return answer