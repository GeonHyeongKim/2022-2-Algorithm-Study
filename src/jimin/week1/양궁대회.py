from itertools import combinations_with_replacement

n = 5
info = [2,1,1,1,0,0,0,0,0,0,0]
def solution(n, info):
    answer = -1
    #라이언이 쏠수 있는 점수
    for counts in combinations_with_replacement(range(0, 11), n):
        lion_info = [0] * 11
        for count in counts:
            lion_info[count] += 1

        apeach, lion = 0, 0
        for idx, (a,l) in enumerate(zip(info, lion_info)):
            if (a==l==0):
                continue
            elif(a>=l):
                apeach += 10-idx
            elif(a<l):
                lion += 10-idx
        if (lion > apeach):
            answer = max(answer, lion-apeach)
    return answer

print(solution(n,info))