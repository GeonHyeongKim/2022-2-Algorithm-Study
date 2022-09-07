import copy

N, M = map(int, input().split())
desk = [list(map(int, input())) for _ in range(N)]
K = int(input())

answer = 0
for i in range(-1, N):
    temp = copy.deepcopy(desk)
    if i > -1:
        change = []
        for j in range(M):
            if temp[i][j] == 0:
                change.append(j)
        
        if len(change) > K:
            continue

        if (K-len(change)) % 2 == 1:
            continue

        for c in change:
            for k in range(N):
                if temp[k][c] == 0:
                    temp[k][c] = 1
                else:
                    temp[k][c] = 0

    cnt = 0
    for x in range(N):
        flag = True
        for y in range(M):
            if temp[x][y] == 0:
                flag = False
                break
        if flag:
            cnt += 1

    if i == -1 and K % 2 == 1:
        continue

    answer = max(answer, cnt)
print(answer)