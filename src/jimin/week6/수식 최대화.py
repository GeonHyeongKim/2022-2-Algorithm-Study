#수식 최대화
from itertools import permutations
from collections import deque
import re
from copy import deepcopy

def calculator(operator, num1, num2):
    if operator == '*':
        return num1 * num2
    elif operator == '-':
        return num1 - num2
    elif operator == '+':
        return num1 + num2

def solution(expression):
    answer = 0
    operators = ['*', '-', '+']

    # num = ""
    # op_list = deque()
    # for ex in expression:
    #     if ex.isdigit():
    #         num += ex
    #     else:
    #         op_list.append(int(num))
    #         op_list.append(ex)
    #         num = ""
    # op_list.append(int(num))

    op_list = re.split(r'(\D)', expression)
    op_list = deque([int(o) if o.isdigit() else o for o in op_list])

    for operator in list(permutations(operators, 3)):
        op_list_tmp = deepcopy(op_list)
        for o in operator: #* - + 연산자
            temp = deque()
            while len(op_list_tmp) != 0:
                curr = op_list_tmp.popleft()
                if curr == o:
                    temp.append(calculator(curr, temp.pop(), op_list_tmp.popleft()))
                else:
                    temp.append(curr)
            op_list_tmp = temp
        answer = max(answer, abs(op_list_tmp[-1]))

    return answer

expression = "100-200*300-500+20"
print(solution(expression))