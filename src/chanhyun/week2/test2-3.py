import heapq

def solution(n, roads, sources, destination):
    answer = []
    graph = [[] for _ in range(n+1)]
    for x,y in roads:
        graph[x].append(y)
        graph[y].append(x)

    distance = [1e9 for _ in range(n+1)]
    q = [(0, destination)]
    distance[destination] = 0
    while q:
        dist, x = heapq.heappop(q)
        if distance[x] < dist:
            continue
        for y in graph[x]:
            cost = dist + 1
            if cost < distance[y]:
                distance[y] = cost
                heapq.heappush(q, (cost, y))

    for s in sources:
        if distance[s] == 1e9:
            answer.append(-1)
        else:
            answer.append(distance[s])
    return answer