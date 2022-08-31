import math

def solution(s):
    answer = math.inf
    if len(s) == 1:
        return 1
    for i in range(1, len(s) // 2 + 1):  # 압축할 길이
        temp = s[:i]
        cnt = 1
        new_string = ""
        for j in range(i, len(s), i):
            if s[j:j + i] == temp:  # temp와 같으면 압축길이 증가
                cnt += 1
            else:  # 다르다면 temp 변경
                cnt_str = "" if cnt == 1 else str(cnt)
                new_string += cnt_str + temp
                temp = s[j:j + i]
                cnt = 1
        cnt_str = "" if cnt == 1 else str(cnt)
        new_string += cnt_str + temp
        answer = min(answer, len(new_string))

    return answer


s = "aabbaccc"
s = "ababcdcdababcdcd"
s = "aaaaaaaaaaaabcd"
print(solution(s))
