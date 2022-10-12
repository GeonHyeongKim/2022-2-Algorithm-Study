# 후보키.py
# Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/42890
# Primary idea:   튜플
#                   1.
#
# 걸린 시간 : 15:00
# Time Complexity : O()
# Space Complexity : O()
# Runtime:  ms
# Memory Usage:  MB


from itertools import combinations

def solution(relation):
    row = len(relation)
    col = len(relation[0])
    combi = []

    # 유일성을 위한 모든 조합
    for i in range(1, col+1):
        _combi = combinations(range(col), i)
        combi.extend(_combi)
    
    candidate = []
    for i in combi:
        temp = [tuple([info[key] for key in i]) for info in relation]
        
        if len(set(temp)) == row: # 유일성
            isNotDuplicate = True
            
            for data in candidate:
                if set(data).issubset(set(i)):  # 최소성, 부분집합
                    isNotDuplicate = False
                    break
            
            if isNotDuplicate:
                candidate.append(i)
    
    return len(candidate)
