def change(n, k):
    result = ''
    while k >= 1:
        remainder = k%n
        if remainder >= 10:
            remainder = chr(ord('A')+(remainder-10))
            result = remainder + result
        else:
            result = str(remainder) + result
        k = k // n
    return result

def solution(n, t, m, p):
    answer = ''
    sequence = '0'
    k = 1
    while len(answer) < t:
        sequence += change(n, k)
        if len(sequence) >= p:
            answer += sequence[p-1]
            p += m
        k += 1
    return answer