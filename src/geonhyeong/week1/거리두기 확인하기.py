/*
*  거리두기 확인하기.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/81302
*  Primary idea:   bfs
*
*  문제 이해/풀이 : 08:01, 01:14:03 (visited때문에...한 30분 더 씀)
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

from collections import deque

dx = [-1, 0, 1, 0]
dy = [0, -1, 0, 1]

# bfs
def bfs(place):
    pList = []
        
    # p의 위치
    for i in range(5):
        for j in range(5):
            if place[i][j] == 'P':
                pList.append((i, j, 0)) # x, y, 거리

    for p in pList:
        queue = deque([p])
        visited = [[0] * 5 for i in range(5)]   # 방문 처리 리스트
        visited[p[0]][p[1]] = 1
        
        # search
        while queue:
            x, y, dist = queue.popleft()

            for i in range(4):
                nx = x + dx[i]
                ny = y + dy[i]

                # out Of Boundary, 방문 처리
                if 0 <= nx < 5 and 0 <= ny < 5 and visited[nx][ny] == 0:
                    
                    if place[nx][ny] == 'O':
                        queue.append((nx, ny, dist + 1))
                        visited[nx][ny] = 1

                    elif place[nx][ny] == 'P' and dist <= 1:
                        return 0
                    
    return 1

def solution(places):
    answer = []
    
    for place in places:
        answer.append(bfs(place))
                        
    return answer
