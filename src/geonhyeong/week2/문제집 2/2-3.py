#
#  2-3.py
#  Question Link:
#  Primary idea: bfs 최적경로
#
#  문제 시간 : 약 50분
#  Time Complexity : O()
#  Space Complexity : O()
#  Runtime:  ms
#  Memory Usage:  MB
#

from collections import deque

def solution(n, roads, sources, destination):
    answer = []
    board = [[] for i in range(n+1)]

    # 초기화 - 양방향
    for a, b in roads:
        board[a].append(b)
        board[b].append(a)

    # 방문
    visited = [-1 for _ in range(n+1)]

    # BFS
    queue = deque()
    queue.append((destination, 0)) # 목적지, 거리
    visited[destination] = 0

    while queue:
        cur, distance = queue.popleft()

        for next in board[cur]:
            if visited[next] == -1:
                visited[next] = distance+1
                queue.append((next, distance+1))

    for s in sources:
        answer.append(visited[s])
    
    return answer

print(solution(3, [[1, 2], [2, 3]], [2, 3], 1)) # [1, 2]
print(solution(5, [[1, 2], [1, 4], [2, 4], [2, 5], [4, 5]], [1, 3, 5], 5)) # [2, -1, 0]
