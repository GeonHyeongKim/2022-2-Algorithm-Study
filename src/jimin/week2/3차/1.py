#정답은 아무한테 말하지마세요 콜라병 문제
def solution(a, b, n): # 빈병 a 병 -> 콜라 b병, 현재 가지고 있는 빈병: n
    answer = 0
    while n >= a:
        temp = (n // a) * b
        if n % a == 0: #모두 바꿀 수 있는 경우
            n = temp
        else: #바꾸고 남는게 있는 경우
            n = temp+ n % a
        answer += temp
    return answer

a, b, n = 2, 1, 20
#a, b, n = 3, 1, 20
print(solution(a, b, n))
