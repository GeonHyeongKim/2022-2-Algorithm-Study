#
#  2-2.swift
#  Question Link:
#  Primary idea: dict
#
#  문제 시간 : 약 30분
#  Time Complexity : O()
#  Space Complexity : O()
#  Runtime:  ms
#  Memory Usage:  MB
#

from collections import defaultdict

def solution(topping):
    answer = 0
    A_set = set()
    B_dict = defaultdict(int)

    # 초기화
    for t in topping:
        B_dict[t] += 1
    
    # 종류 갯수
    A_count = 0
    B_count = len(B_dict)

    for t in topping:
        if not t in A_set:
            A_set.add(t)
            A_count += 1
        
        B_dict[t] -= 1
        if B_dict[t] == 0:
            B_count -= 1

        if A_count == B_count:
            answer += 1

    return answer

print(solution([1, 2, 1, 3, 1, 4, 1, 2])) # 2
# print(solution([1, 2, 3, 1, 4])) # 0
