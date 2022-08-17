from collections import deque

dx = [0,0,-1,1]
dy = [-1,1,0,0]

def solution(places):
    answer = []
    visited = [[0] * 5 for _ in range(5)]
    # P 상하좌우에 P -> 못지킴
    # P 상하좌우에 O -> 따라갔다가 상하좌우에 P -> 못지킴
    def bfs(y,x, visited):
        queue = deque()
        queue.append((y,x,0))
        while queue:
            y,x,depth = queue.popleft()
            visited[y][x] = 1
            if depth == 2:
                break
            for i in range(4):
                nx, ny = x + dx[i], y + dy[i]
                if 0 <= nx < 5 and 0 <= ny < 5 and not visited[ny][nx]:
                    if place[ny][nx] == 'P':
                        return False
                    if place[ny][nx] == 'O':
                        queue.append((ny,nx, depth+1))
        return True

    def dist(place):
        for i in range(5):
            for j in range(5):
                if place[i][j] == 'P':
                    if not bfs(i,j, visited):
                        return False
        return True

    for place in places:
        visited = [[0] * 5 for _ in range(5)]
        if not dist(place):
            answer.append(0)
        else:
            answer.append(1)
    return answer

places = [["PXPXP", "OPXPX", "PXPXP", "XPXPX", "PXPXP" ], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]]
print(solution(places))

# dx = [0,0,-1,1]
# dy = [-1,1,0,0]
# def solution(places):
#     answer = []
#     visited = [[0] * 5 for _ in range(5)]
#     # P 상하좌우에 P -> 못지킴
#     # P 상하좌우에 O -> 따라갔다가 상하좌우에 P -> 못지킴
#     def dfs(y,x, depth, place, visited):
#         visited[y][x] = 1
#         if depth == 2:
#             return True
#         for i in range(4):
#             nx, ny = x+dx[i], y+dy[i]
#             if 0 <= nx < 5 and 0 <= ny < 5 and not visited[ny][nx]:
#                 if place[ny][nx] == 'P':
#                     return False
#                 if place[ny][nx] == 'O':
#                     if not dfs(ny,nx,depth+1,place, visited):
#                         return False
#         return True
#
#     def dist(place):
#         for i in range(5):
#             for j in range(5):
#                 if place[i][j] == 'P':
#                     if not dfs(i,j,0,place, visited):
#                         return False
#         return True
#
#     for place in places:
#         visited = [[0] * 5 for _ in range(5)]
#         if not dist(place):
#             answer.append(0)
#         else:
#             answer.append(1)
#     return answer