#
# 택배 배송.py
# Question Link: https://www.acmicpc.net/problem/5972
# Primary idea:
#                  1.
#
# 걸린 시간 : 15:00
# Time Complexity : O()
# Space Complexity : O()
# Runtime:  ms
# Memory Usage:  MB
#

import sys
from heapq import heappush, heappop

# 출발지를 모를 때는 플로이드와샬로
# 모두 알고 있을 때는 다익스트라로 해결하는 것이 좋다고 한다.

input = sys.stdin.readline
n, m = map(int, input().split())
road = [[] for _ in range(n+1)]

for _ in range(m):
    a, b, c = map(int, input().split())

    # 양방향 - 두 개의 헛간은 하나 이상의 길로 연결되어 있을 수도 있음
    road[a].append([b, c])
    road[b].append([a, c])

# 다익스트라
queue = [[0, 1]] # 거리, start 헛간
distance = [float('inf')] * (n + 1)
distance[1] = 0

while queue:
    dist, now = heappop(queue)
    if distance[now] < dist:
        continue
    for i in road[now]:
        cost = dist + i[1]
        if cost < distance[i[0]]:
            distance[i[0]] = cost
            heappush(queue, [cost, i[0]])

print(distance[n])
