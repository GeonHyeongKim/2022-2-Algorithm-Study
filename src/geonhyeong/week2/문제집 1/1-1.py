#
#  1-1.swift
#  Question Link:
#  Primary idea:   
#
#  Time Complexity : O()
#  Space Complexity : O()
#  Runtime:  ms
#  Memory Usage:  MB
#

from collections import defaultdict

def solution(X, Y):
    X = sorted(X, reverse=True)
    Y = sorted(Y, reverse=True)
    pair = ""
    dic = defaultdict(int)

    # count
    for y in Y:
        dic[y] += 1

    # cal
    for x in X:
        if (x in dic) and (dic[x] > 0):
            pair += x
            dic[x] -= 1
    
    if len(pair) != 0 and pair[0] == "0":
        return "0"
    return "-1" if len(pair) == 0 else "".join(pair)

print(solution("100", "2345")) # "-1"
print(solution("100", "203045")) # "0"
print(solution("100", "123450")) # "10"
print(solution("12321", "42531")) # "321"
