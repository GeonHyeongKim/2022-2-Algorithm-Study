
# def solution(info, query):
#     answer = []
#     info_list = []
#     #언어, 직군, 경력, 소울 푸드, 점수
#     for i in info:
#         info_list.append(i.split(" "))
#
#     info_list = sorted(info_list, key= lambda x : int(x[4]))
#
#     query_list = []
#     for q in query:
#         q = q.replace("and", "")
#         q= q.split()
#         query_list.append(q)
#
#     n = len(info_list)
#     for q in query_list:
#         is_checked = [0] * n
#         for idx in range(5):
#             for info_idx, user_info in enumerate(info_list):
#                 if q[idx] == "-":
#                     continue
#                 if (idx == 4) and not is_checked[info_idx]:
#                     if int(q[idx]) > int(user_info[idx]):
#                         is_checked[info_idx] = 1
#                 elif q[idx] != user_info[idx] and not is_checked[info_idx]: #같지 않고, 이전까지 가능했다면
#                     is_checked[info_idx] = 1
#
#         answer.append(is_checked.count(0))
#     return answer
#
#
# print(solution(info,query))

from collections import defaultdict
from itertools import combinations

def binary_search(target, list):
    left, right = 0, len(list)
    while left < right:
        mid = (left + right) // 2
        if list[mid] < target:
            left = mid + 1
        else:
            right = mid
    return left

def solution(info, query):
    answer = []
    info_list = defaultdict(list)
    #key: 가능한 단어 조합, value: 수
    for i in info:
        for j in range(5):
            user_info = i.split(" ")
            for co in combinations(list(user_info[:4]), j):
                info_list["".join(co)].append(int(user_info[4]))
    print(info_list)

    for value in info_list.values():
        value.sort()

    for q in query:
        q = q.replace("and", "").replace("-","")
        q = q.split()
        count = int(q[-1])
        info_result = info_list["".join(q[:-1])]
        answer.append(len(info_result) - binary_search(count, info_result))
    return answer

info = ["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"]
query = ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]
print(solution(info,query))