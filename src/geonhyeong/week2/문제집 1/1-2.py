#
#  1-2w.swift
#  Question Link:
#  Primary idea:   dictionary
#
#  Time Complexity : O()
#  Space Complexity : O()
#  Runtime:  ms
#  Memory Usage:  MB
#

from collections import defaultdict

def solution(want, number, discount):
    answer = 0

    for i in range(0, len(discount) - 9):
        dic = defaultdict(int)
        for food in discount[i:i+10]:
            dic[food] += 1

        flag = True
        for (j, w) in enumerate(want):
            if (not w in dic) or (dic[w] < number[j]):
                flag = False
                break
        
        if flag:
            answer += 1
                
    return answer

print(solution(["banana", "apple", "rice", "pork", "pot"], [3, 2, 2, 2, 1], ["chicken", "apple", "apple", "banana", "rice", "apple", "pork", "banana", "pork", "rice", "pot", "banana", "apple", "banana"])) # 3
print(solution(["apple"], [10], ["banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana"])) # 0
