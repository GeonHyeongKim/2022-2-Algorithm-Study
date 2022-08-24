from itertools import combinations

#삼총사의 합이 0인 개수 찾기
def solution(number):
    answer = 0
    len_number = len(number)
    for combi in list(combinations(range(len_number), 3)):
        temp_sum = 0
        for c in combi:
            temp_sum += number[c]
        if temp_sum == 0:
            answer += 1
    return answer

number = [-2, 3, 0, 2, -5]
print(solution(number))