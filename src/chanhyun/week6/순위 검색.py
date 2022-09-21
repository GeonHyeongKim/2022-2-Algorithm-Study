from itertools import combinations
from collections import defaultdict
from bisect import bisect_left

applicants = defaultdict(list)
def getAllCases(info, key, depth):
    global applicants
    if depth == 4:
        applicants[key].append(int(info[4]))
        return
    getAllCases(info, key+info[depth], depth+1)
    getAllCases(info, key+'-', depth+1)

def solution(info, query):
    global applicants
    answer = []
    for i in info:
        app = i.split()
        getAllCases(app, '', 0)
    for k, v in applicants.items():
        v.sort()
    for q in query:
        cnt = 0
        quest = q.split()
        key = quest[0]+quest[2]+quest[4]+quest[6]
        candidates = applicants[key]
        idx = bisect_left(candidates, int(quest[7]))
        cnt = len(candidates)-idx
        answer.append(cnt)
    # print(applicants)
    return answer