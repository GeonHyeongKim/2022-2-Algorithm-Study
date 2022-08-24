import copy
import math
from itertools import combinations

#행, 열 뒤집으면서 목표로 향한다 ..
#시간초과 (70)
def solution(beginning, target):
    row, col = len(beginning), len(beginning[0]) #수
    min_count = math.inf

    def change(combi, arr):
        for c in combi:
            if c < col: # 세로로 변환
                for i in range(row):
                    arr[i][c] = (arr[i][c] + 1) % 2
            elif c >= col:
                temp = c % col
                for i in range(col):
                    arr[temp][i] = (arr[temp][i] + 1) % 2

    def check(arr):
        for i in range(row):
            if arr[i] != target[i]:
                return False
        return True

    if check(beginning):
        return 0

    for i in range(1, row+col+1):
        for combi in combinations(range(0, row+col), i):
            arr = copy.deepcopy(beginning)
            change(combi, arr)
            if check(arr):
                min_count = min(len(combi), min_count)

    return -1 if min_count == math.inf else min_count


beginning = [[0, 0, 0], [0, 0, 0]]
target = [[1, 0, 1], [0, 0, 0]]

print(solution(beginning, target))