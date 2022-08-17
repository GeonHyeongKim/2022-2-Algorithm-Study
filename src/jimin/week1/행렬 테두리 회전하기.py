rows = 6
columns = 6
queries = [[2,2,5,4],[3,3,6,6],[5,1,6,3]]

rows = 100
columns = 97
queries = [[1,1,100,97]] #x1, y1, x2, y2

def solution(rows, columns, queries):
    arr = [[(i) * columns + (j + 1) for j in range(columns)] for i in range(rows)]
    answer = []
    for x1, y1, x2, y2 in queries:
        x1 -= 1
        y1 -= 1
        x2 -= 1
        y2 -= 1
        left_top = arr[x1][y1]
        min_idx = left_top
        for i in range(x1, x2):
            temp = arr[i + 1][y1]
            arr[i][y1] = temp
            min_idx = min(min_idx, temp)
        for i in range(y1, y2):
            temp = arr[x2][i + 1]
            arr[x2][i] = temp
            min_idx = min(min_idx, temp)
        for i in range(x2, x1, -1):
            temp = arr[i - 1][y2]
            arr[i][y2] = temp
            min_idx = min(min_idx, temp)
        for i in range(y2, y1, -1):
            temp = arr[x1][i - 1]
            arr[x1][i] = temp
            min_idx = min(min_idx, temp)
        arr[x1][y1+1] =left_top
        answer.append(min_idx)
    return answer

print(solution(rows, columns, queries))