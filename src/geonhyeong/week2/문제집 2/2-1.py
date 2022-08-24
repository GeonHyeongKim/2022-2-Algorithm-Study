#
#  2-1.swift
#  Question Link:
#  Primary idea:   dfs 조합
#
#  시간 : 01:10
#  Time Complexity : O()
#  Space Complexity : O()
#  Runtime:  ms
#  Memory Usage:  MB
#

from itertools import combinations
from functools import reduce

def solution(number):
    answer = 0
    for c in combinations(number, 3):
        if reduce(lambda x, y: x + y, c) == 0:
            answer += 1
    return answer

print(solution([-2, 3, 0, 2, -5])) # 2
print(solution([-3, -2, -1, 0, 1, 2, 3])) # 5
print(solution([-1, 1, -1, 1])) # 0
