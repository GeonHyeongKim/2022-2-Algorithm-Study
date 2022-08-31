def solution(n):
    answer = []
    arr = list([0] * n for _ in range(n))
    y, x = -1, 0
    count = 1
    for i in range(n):
        for j in range(i, n):
            if i % 3 == 0:
                y += 1
            elif i % 3 == 1:
                x += 1
            else:
                x -= 1
                y -= 1
            arr[y][x] = count
            count += 1
    for i in range(n):
        for j in range(0, i + 1):
            answer.append(arr[i][j])

    return answer


n = 4
print(solution(n))
