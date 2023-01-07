## 로봇 청소기.py
## Question Link: https://www.acmicpc.net/problem/14503

n, m = map(int, input().split())
r, c, d = map(int, input().split())
board = [list(map(int, input().split())) for _ in range(n)]

## 북, 동, 남, 서 (시계방향)
dx = [-1, 0, 1, 0]
dy = [0, 1, 0, -1]

## 방문 Check
visited = [[0] * m for _ in range(n)]

## 시작지 방문 Check and 카운트!
visited[r][c] = 1
cnt = 1

while True:
	flag = 0                    ## 아직 아무것도 청소 안함

	for _ in range(4):          ## 4방향
		d = (d + 3) % 4         ## 왼쪽방향으로 한 칸 회전
		nx = r + dx[d]
		ny = c + dy[d]

		## 범위 안에 들고, 빈 칸이고, 방문한적이 없다면
		if 0 <= nx < n and 0 <= ny < m and board[nx][ny] == 0:
			if visited[nx][ny] == 0:
				visited[nx][ny] = 1 ## 들려서 청소하고
				cnt += 1            ## 카운트하고
				r = nx              ## 현재 위치 갱신
				c = ny
				flag = 1            ## 청소하기
				break

	if flag == 0:
		## 즉 네 방향 모두 청소를 할 수 없을 때
		## 후진 했을 때 벽이면 break
		if board[r - dx[d]][c - dy[d]] == 1:
			print(cnt)
			break
		else:
			# 만약 뒤가 벽이 아니라면, 그 위치를 다시 갱신
			r = r - dx[d]
			c = c - dy[d]
