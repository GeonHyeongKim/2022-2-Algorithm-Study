#경비병을 피해 최대로 이동할 수 있는 거리 찾는 문제

def solution(distance, scope, times): #전체 거리, 감시 구간, 근무, 휴식시간
    answer = distance
    for s, time in zip(scope, times): #스코프는 정렬되어있지 않음
        start, end = min(s), max(s)
        work, rest = time[0], time[1]
        total = work+rest
        for i in range(start, end+1):
            curr_time = total if i % total == 0 else i % total #근무(3), 휴식(4) -> 나머지가 0이면 가장 큰 수(7)로 들어가도록
            if curr_time <= work:
                answer = min(answer, i)
    return answer

distance = 10
scope = [[3, 4], [5, 8]]
times = [[2, 5], [4, 3]]

print(solution(distance, scope, times))

