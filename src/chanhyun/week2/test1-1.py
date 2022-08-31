def solution(X, Y):
    answer = ''
    countX = [0 for _ in range(10)]
    countY = [0 for _ in range(10)]
    for i in range(len(X)):
        countX[int(X[i])] += 1
    for i in range(len(Y)):
        countY[int(Y[i])] += 1
    for i in range(9, 0, -1):
        if countX[i] == 0 or countY[i] == 0:
            continue
        answer += str(i)*min(countX[i], countY[i])
    if countX[0] != 0 and countY[0] != 0:
        if answer == '':
            return '0'
        else:
            answer += str(0)*min(countX[0], countY[0])
            return answer
    else:
        if answer == '':
            return '-1'
        else:
            return answer