# 문자열 교환.py
# Question Link: https://www.acmicpc.net/problem/1522
# Primary idea:   슬라이딩 윈도우
#                   1.
#
# 걸린 시간 : 15:00
# Time Complexity : O()
# Space Complexity : O()
# Runtime:  ms
# Memory Usage:  MB

str = input()
a = str.count('a') # a의 갯수가 window 크기

length = len(str)
answer = len(str)

for i in range(0, length):
    b = 0
    for j in range(i, i+a): # a의 갯수가 window 크기
        index = j % length
        if str[index] == 'b':
            b += 1
            
    answer = min(answer, b)

print(answer)
