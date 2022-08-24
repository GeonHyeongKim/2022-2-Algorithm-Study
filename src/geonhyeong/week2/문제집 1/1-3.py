#
#  1-3.swift
#  Question Link:
#  Primary idea:   스택
#
#  Time Complexity : O()
#  Space Complexity : O()
#  Runtime:  ms
#  Memory Usage:  MB
#

def solution(order):
    answer = 0
    stack = []
    i = 0
    num = 1


    while i < len(order):
        if stack:
            if stack[-1] == order[i]:
                answer += 1
                stack.pop()
            elif stack[-1] < order[i]:
                while num <= order[i]:
                    if num == order[i]:
                        answer += 1
                    else:
                        stack.append(num)
                    num += 1
            else:
                break
        else:
            while num <= order[i]:
                if num == order[i]:
                    answer += 1
                else:
                    stack.append(num)
                num += 1
        i += 1
    
    return answer

# print(solution([4, 3, 1, 2, 5])) # 2
# print(solution([5, 4, 3, 2, 1])) # 5
print(solution([3, 4, 1, 2]))

# 시험 본뒤 정리
def solution(order):
    answer = 0
    stack = []
    num = 1

    for (i, o) in enumerate(order):
        if stack and stack[-1] == o:
            answer += 1
            stack.pop()
        else:
            if not stack or stack[-1] < o:
                while num <= o:
                    if num == o:
                        answer += 1
                    else:
                        stack.append(num)
                    num += 1
            elif stack: # stack[-1] >= o
                break
    
    return answer
