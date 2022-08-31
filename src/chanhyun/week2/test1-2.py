from collections import defaultdict

def check(wantList, available):
    for k, v in wantList.items():
        if available[k] != v:
            return False
    return True

def solution(want, number, discount):
    answer = 0
    wantList = dict()
    available = defaultdict(int)
    for i in range(len(want)):
        wantList[want[i]] = number[i]
    for i in range(10):
        available[discount[i]] += 1
    if check(wantList, available):
        answer += 1
    for i in range(10, len(discount)):
        available[discount[i-10]] -= 1
        available[discount[i]] += 1
        if check(wantList, available):
            answer += 1
    return answer