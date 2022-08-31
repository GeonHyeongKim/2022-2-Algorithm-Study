from collections import deque, defaultdict
#강철부대 다시 돌아오는 문제
# def solution(n, roads, sources, destination): #부대수, 연결된 그래프, 출발지점, 목적지
#     graph = defaultdict(list)
#
#     def dfs(v):
#         visited = [0 for _ in range(n+1)]
#         visited[v] = 1
#
#         queue = deque()
#         queue.append((v, 0)) #현 위치, depth
#         while queue:
#             v, depth = queue.popleft()
#             if v == destination:
#                 return depth
#             for w in graph[v]:
#                 if not visited[w]:
#                     queue.append((w, depth+1))
#                     visited[w] = 1
#         return -1
#
#     for road in roads:
#         r1, r2 = road
#         graph[r1].append(r2)
#         graph[r2].append(r1)
#
#     answer = []
#     for source in sources:
#         depth = dfs(source)
#         answer.append(depth)
#     return answer

#######################################################
#도착지 기준으로 계산하도록 반대로 풀이
from collections import deque, defaultdict
def solution(n, roads, sources, destination): #부대수, 연결된 그래프, 출발지점, 목적지
    graph = defaultdict(list)
    cache_depth = dict()

    def bfs(v):
        visited = [0 for _ in range(n+1)]
        visited[v] = 1

        queue = deque()
        queue.append((v, 0)) #현 위치, depth
        while queue:
            v, depth = queue.popleft()
            cache_depth[v] = depth

            for w in graph[v]:
                if not visited[w]:
                    queue.append((w, depth+1))
                    visited[w] = 1

    for road in roads:
        r1, r2 = road
        graph[r1].append(r2)
        graph[r2].append(r1)

    answer = []
    bfs(destination)
    for source in sources:
        answer.append(cache_depth.get(source,-1))
    return answer


n = 5
roads = [[1, 2], [1, 4], [2, 4], [2, 5], [4, 5]]
sources = [1, 3, 5]
destination = 5

# n = 6
# roads = [[1, 2], [2,3], [3,1], [4,5], [2,5]]
# sources = [1,2,3,4,5,6]
# destination = 4
#
# n = 5
# roads = [[1, 2], [2, 3], [4,5]]
# sources = [2, 3]
# destination = 1

print(solution(n, roads, sources, destination))