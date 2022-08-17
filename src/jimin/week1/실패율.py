# 22:12 - 22:37
N = 4
stages = [1,1,1]

from collections import Counter
def solution(N, stages):
    people_count = len(stages)
    stage_count = dict(sorted(Counter(stages).items(), key= lambda x:x[0]))
    fail_rate = dict()

    #확률 계산
    for i in range(1, N+1):
        if i in stages: #스테이지 존재한다면
            fail_rate[i] = stage_count[i] / people_count
            people_count -= stage_count[i]
        else:
            fail_rate[i] = 0 #여기서도 / people_count 넣었다가.. 런타임에러

    fail_rate = sorted(fail_rate.items(), key=lambda x:x[1], reverse=True)

    return [key for key,value in fail_rate]

print(solution(N, stages))