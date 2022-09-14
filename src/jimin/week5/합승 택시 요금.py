import math
from collections import defaultdict
import heapq

def solution(n, s, a, b, fares):  # 노드수, 출발 ,a도착, b도착
    fee = defaultdict(list)
    for c, d, f in fares: #c,d 사이 f요금
        fee[c].append((d,f)) # c-> d 요금
        fee[d].append((c,f)) # d-> c 요금

    #a, b의 경로 출력
    queue = []
    def dijkstra(start):
        dist = [math.inf] * (n + 1)
        heapq.heappush(queue, (0, start))
        dist[start] = 0

        while queue:
            curr_w, curr_n = heapq.heappop(queue)

            if dist[curr_n] < curr_w:
                continue

            for next_n, next_w in fee[curr_n]:
                cost = curr_w + next_w
                if cost < dist[next_n]:
                    dist[next_n] = cost
                    heapq.heappush(queue, (cost, next_n))

        return dist

    result_dist = [[]]
    for i in range(1, n+1):
        result_dist.append(dijkstra(i)) #모든 지점을 출발점으로 둔다

    answer = math.inf
    for i in range(1, n+1): #s -> i, i -> a, i -> b
        answer = min(answer, result_dist[s][i] + result_dist[i][a] + result_dist[i][b])
    return answer


n = 6
s = 4
a = 6
b = 2
fares = [[4, 1, 10], [3, 5, 24], [5, 6, 2], [3, 1, 41], [5, 1, 24], [4, 6, 50], [2, 4, 66], [2, 3, 22], [1, 6, 25]]
print(solution(n, s, a, b, fares))
