#20:11 시작 ~

#20:20 / 11, 12 테케 시간 초과
# def solution(numbers):
#     answer = []
#     for number in numbers:
#         index = number + 1
#         while True:
#             cnt = bin(number ^ index)[2:].count('1')
#             if (cnt <= 2):
#                 break
#             index += 1
#         answer.append(index)
#     return answer

#답지 슬쩍.. -> 규칙성 발견하는 문제였음
def solution(numbers):
    answer = []
    for number in numbers:
        if number % 2 == 0: #짝수
            answer.append(number + 1)
        else:
            #뒤에서 부터 탐색해서 0이 나오면 1로 바꿈, 그 다음 수는 0으로 바꿈
            bin_num = '0' + bin(number)[2:]
            for i in range(len(bin_num)-1, -1, -1):
                if bin_num[i] == '0':
                    bin_num = list(bin_num)
                    bin_num[i] = '1'
                    bin_num[i+1] = '0'
                    break
            answer.append(int(''.join(bin_num), 2))
    return answer

numbers = [2,7]
print(solution(numbers))