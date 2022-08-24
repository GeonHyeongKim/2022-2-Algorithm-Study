from collections import defaultdict

def solution(topping):
    answer = 0
    l = defaultdict(int)
    r = defaultdict(int)
    for t in topping:
        r[t] += 1
    
    for t in topping:
        if r[t] > 0:
            r[t] -= 1
            l[t] += 1
            if r[t] == 0:
                del r[t]

        if len(l) == len(r):
            answer += 1

    return answer