#
#  3-2.swift
#  Question Link:
#  Primary idea:
#
#  시간 : 약 10분
#  Time Complexity : O()
#  Space Complexity : O()
#  Runtime:  ms
#  Memory Usage:  MB
#

def solution(ingredient):
    answer = 0
    stack = []

    for i in ingredient:
        stack.append(i)
        if stack[-4:] == [1, 2, 3, 1]:
            answer += 1
            for _ in range(4): # 4개의 재료 뺴줌
                stack.pop()
                
    return answer

print(solution([2, 1, 1, 2, 3, 1, 2, 3, 1])) # 2
# print(solution([1, 3, 2, 1, 2, 1, 3, 1, 2])) # 0

