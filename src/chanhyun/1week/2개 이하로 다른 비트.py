def countOne(n):
    cnt = 0
    while n>=0:
        x = n%2
        if x == 1:
            cnt += 1
        else:
            break
        n = n//2
    return cnt

def solution(numbers):
    answer = []
    for n in numbers:
        cnt = countOne(n)
        if cnt == 0:
            answer.append(n+1)
        else:
            answer.append(n+2**(cnt-1))
    return answer