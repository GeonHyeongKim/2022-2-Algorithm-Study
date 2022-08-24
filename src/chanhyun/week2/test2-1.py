from itertools import combinations

def solution(number):
    answer = 0
    for comb in combinations(number, 3):
        if sum(comb) == 0:
            answer += 1
    return answer