from itertools import combinations_with_replacement

def compare(apeach, ryan):
    r = 0
    a = 0
    for i in range(11):
        if ryan[i] == 0 and apeach[i] == 0:
            continue
        if ryan[i] > apeach[i]:
            r += 10-i
        else:
            a += 10-i
    if r>a:
        return r-a
    else:
        return -1

def solution(n, info):
    answer = []
    max_result = 0
    for case in combinations_with_replacement([i for i in range(11)], n):
        count = [0 for _ in range(11)]
        for c in case:
            count[10-c] += 1
        result = compare(info, count)
        if result > max_result:
            max_result = result
            answer = count
    if answer == []:
        return [-1]
    else:
        return answer

########################

from itertools import combinations_with_replacement

def compare(apeach, ryan):
    apeach_score = 0
    ryan_score = 0
    for i in range(11):
        if apeach[i] == 0 and ryan[i] == 0:
            continue
        if apeach[i] >= ryan[i]:
            apeach_score += 10-i
        else:
            ryan_score += 10-i
    if apeach_score < ryan_score:
        return [apeach_score, ryan_score]
    else:
        return []

def solution(n, info):
    answer = []
    score_diff = -1
    points = [i for i in range(11)]
    cases = list(combinations_with_replacement(points, n))
    ryans = []
    for c in cases:
        p = [0 for _ in range(11)]
        for x in c:
            p[10-x] += 1
        ryans.append(p)
    for r in ryans:
        result = compare(info, r)
        if result != []:
            if result[1]-result[0] > score_diff:
                score_diff = result[1]-result[0]
                answer = r
    if score_diff == -1:
        return [-1]
    else:
        return answer