def solution(distance, scope, times):
    answer = distance
    for i in range(len(scope)):
        scope[i].sort()
        for t in range(scope[i][0], scope[i][1]+1):
            x = t % (times[i][0]+times[i][1])
            if 0<x<=times[i][0]:
                answer = min(answer, t)
    return answer