import sys
from collections import defaultdict

input = sys.stdin.readline

dy = [-1, -1, 0, 1, 1, 1, 0, -1]
dx = [0, 1, 1, 1, 0, -1, -1, -1]

N, M, K = map(int, input().split())  # 격자크기, 발사할 파이어볼 수, 명령 횟수
fireballs = defaultdict(list)

for i in range(M):
    r, c, m, s, d = map(int, input().split())  # 위치, 질량, 속력, 방향
    fireballs[(r - 1, c - 1)].append((m, s, d))

def move():
    global fireballs
    next_fireballs = defaultdict(list)
    for k, v in fireballs.items():
        y, x = k
        for temp in v:
            m, s, d = temp
            ny, nx = (dy[d] * s + y) % N, (dx[d] * s + x) % N
            next_fireballs[(ny, nx)].append((m, s, d))
    fireballs = next_fireballs.copy()

def check_dir(d_list):
    odd_cnt, even_cnt = 0, 0
    for d in d_list:
        if d % 2 == 0:
            even_cnt += 1
        else:
            odd_cnt += 1
    #모두 짝이나 홀이라면
    if len(d_list) == even_cnt or len(d_list) == odd_cnt:
        return True
    else:
        return False

def solution():
    global fireballs
    next_fireballs = defaultdict(list)
    for k, v in fireballs.items():
        if len(v) == 1:
            next_fireballs[k].append(v[0])
            continue
        sum_m, sum_s = 0, 0
        d_list = []
        for m, s, d in v:
            sum_m += m
            sum_s += s
            d_list.append(d)
        temp_m = sum_m // 5
        temp_s = sum_s // len(v)
        if temp_m == 0:
            continue
        if check_dir(d_list):
            for d in [0,2,4,6]:
                next_fireballs[k].append((temp_m, temp_s, d))
        else:
            for d in [1,3,5,7]:
                next_fireballs[k].append((temp_m, temp_s, d))
    fireballs = next_fireballs.copy()

for _ in range(K):
    move()
    solution()

answer = 0

for k, v in fireballs.items():
    for i in v:
        answer += i[0]
print(answer)

