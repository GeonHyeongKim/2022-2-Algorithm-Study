import math
import sys, heapq
from collections import defaultdict
input = sys.stdin.readline

n, m = map(int, input().split()) #헛간, 길 개수
#1에서 n으로 이동하는 다익스트라

graph = defaultdict(list)
for i in range(m):
    a, b, c = map(int, input().split())
    graph[a].append((c, b))
    graph[b].append((c, a))

dist = [math.inf] * (n+1)
def dijkstra():
    queue = []
    heapq.heappush(queue, (0, 1)) #weight, 현 위치

    while queue:
        curr_w, curr_n = heapq.heappop(queue)
        for next_w, next_n in graph[curr_n]:
            temp_w = next_w + curr_w
            if dist[next_n] > temp_w:
                dist[next_n] = temp_w
                heapq.heappush(queue, (temp_w, next_n))

dijkstra()
print(dist[n])

