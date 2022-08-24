#
#  3-1.swift
#  Question Link:
#  Primary idea:   
#
#  시간 : 약 2분
#  Time Complexity : O()
#  Space Complexity : O()
#  Runtime:  ms
#  Memory Usage:  MB
#

def solution(a, b, n):
    answer = 0
    
    while n >= a:
        temp = (n // a) * b
        answer += temp
        n = (n % a) + temp

    return answer

print(solution(2, 1, 20)) # 19
# print(solution(3, 1, 20)) # 9
