from itertools import permutations

def cal(p, i, exp):
    if exp.isdigit():
        return exp
    elist = exp.split(p[i])
    tlist = []
    for e in elist:
        tlist.append(int(cal(p, i-1, e)))
    result = int(tlist[0])
    for x in range(1, len(tlist)):
        t = int(tlist[x])
        if p[i] == '+':
            result += t
        elif p[i] == '-':
            result -= t
        else:
            result *= t
    return result

def solution(expression):
    answer = 0
    priority = list(permutations(['+', '-', '*']))
    t = []
    for p in priority:
        result = cal(p, 2, expression)
        if result < 0:
            result = abs(result)
        answer = max(answer, result)
    return answer