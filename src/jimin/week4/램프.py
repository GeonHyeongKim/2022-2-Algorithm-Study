import sys
from collections import defaultdict
input = sys.stdin.readline

n, m = map(int, input().split())  # 세로 가로
arr = [input().strip() for _ in range(n)]
k = int(input())  # k번 누르도록 한다 -> 열을 선택해서 키면 상태가 바뀌게 된다.
max_answer = 0
arr_cnt = defaultdict(int)

for i in arr:
    arr_cnt[i] += 1

for key, value in arr_cnt.items():
    zero_count = key.count('0')
    if k >= zero_count and zero_count % 2 == k % 2: #껐다 키면 되니까
        max_answer = max(max_answer, value)

print(max_answer)

#########################################################
# from itertools import combinations_with_replacement
# from collections import Counter
# from copy import deepcopy
#
# import sys
# input = sys.stdin.readline
#
# n,m = map(int,input().split()) #세로 가로
# arr = [list(map(int,input().strip())) for _ in range(n)]
# k = int(input()) #k번 누르도록 한다 -> 열을 선택해서 키면 상태가 바뀌게 된다.
# max_answer = -1
#
# def change_col(k, temp):
#     for i in range(n):
#         temp[i][k] = (temp[i][k] + 1) % 2
#
# def count_light(temp): #light 수 센다 ->
#     answer = 0
#     for i in range(n):
#         if temp[i].count(1) == m:
#             answer += 1
#     return answer
#
# for p in combinations_with_replacement(range(0, m), k):
#     counter = Counter(p)
#     temp = deepcopy(arr)
#     for i in range(m):
#         if counter[i] % 2 == 0: #짝수면 그대로
#             continue
#         else:
#             change_col(i, temp)
#     max_answer = max(count_light(temp), max_answer)
#
# print(max_answer)

