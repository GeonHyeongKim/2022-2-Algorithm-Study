def solution(n, t, m, p):  # n진법, t개, m참여, 순서p
    answer = ''
    arr = []
    mapping = {'10': 'A', '11': 'B', '12': 'C', '13': 'D', '14': 'E', '15': 'F'}

    def convert(num, n):  # num을 n진수 변환
        convert_result = ''
        while num > 0:
            temp = str(num % n)
            convert_result += mapping[temp] if temp in mapping.keys() else temp
            num = num // n
        return convert_result[::-1]

    arr_len = m * t  # 최소로 필요한 수
    arr.append('0')
    cnt = 1
    while len(arr) < arr_len:
        arr.extend(list(convert(cnt, n)))
        cnt += 1

    for i in range(arr_len):
        if i % m + 1 == p:
            answer += arr[i]

    return answer


n, t, m, p = 2, 4, 2, 1
n, t, m, p = 16, 16, 2, 1
n, t, m, p = 16, 16, 2, 2
print(solution(n, t, m, p))
