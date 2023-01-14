## 우체국
## Question Link: https://www.acmicpc.net/problem/2285
## 그리디

import sys
input = sys.stdin.readline

N = int(input()) 	# 반복 횟수
totalPeople = 0		# 전체 인원
houses = []			# 집

# 입력
for _ in range(N):
    i, people = map(int, input().split())
    totalPeople += people			# 전체 누적
    houses.append((i, people))		# 몇번째, 사람수

peopleCount = 0

for i, people in sorted(houses, key=lambda x: x[0]):
    peopleCount += people
    
    if peopleCount > totalPeople//2: # 사람 수의 절반이 넘어가는 지점의 마을
        print(i)
        break