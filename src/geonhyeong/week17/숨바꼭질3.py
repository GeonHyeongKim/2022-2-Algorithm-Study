# 숨바꼭질 3.py
# Question Link: https://www.acmicpc.net/problem/13549

import heapq

INF = float("inf")

def solution(n, k):
	# 동생이 수빈이 왼쪽에 있는 경우
	if k <= n:
		print(n - k)
		return

	# 동생이 수빈이 오른쪽에 있는 경우
	dp = [INF] * (100001)
	q = []

	heapq.heappush(q, (0, n))  # 시작 위치 삽입

	# 메인 로직
	while q:
		cost, pos = heapq.heappop(q)
		for i in [pos * 2, pos - 1, pos + 1]:
			# 범위 내
			if 0 <= i and i <= 100000:
				# 2배 이동, 첫 방문
				if i == pos * 2 and dp[i] == INF:
					heapq.heappush(q, (cost, i))
					dp[i] = cost
				# -1,+1 이동, 첫 방문
				elif dp[i] == INF:
					heapq.heappush(q, (cost + 1, i))
					dp[i] = cost + 1

	print(dp[k])


n, k = map(int, input().split())

solution(n, k)
