from collections import Counter
#공통인 숫자로 만들 수 있는 최대 수
def solution(X, Y):
    x = Counter(X)
    y = Counter(Y)

    answer = ""
    for i in range(9, -1, -1):
        if str(i) in x.keys() and str(i) in y.keys():
            answer += (str(i) * min(x[str(i)], y[str(i)]))
    if not answer:
        return "-1"
    elif answer[0] == '0':
        return "0"

    return "".join(answer)


X = "200"
Y = "203045"
print(solution(X, Y))