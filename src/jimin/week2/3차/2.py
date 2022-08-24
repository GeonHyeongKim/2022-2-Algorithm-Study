from collections import deque
#햄버거 재료에 맞게 순서대로 쌓는 문제
def solution(ingredient):
    answer = 0
    order = [1,2,3,1] #쌓아야하는 순서
    ingredient = deque(ingredient)
    make = []

    while ingredient:
        make.append(ingredient.popleft())
        if len(make) >= 4:
            if make[-4:] == order:
                answer += 1
                for i in range(4):
                    make.pop()

    return answer

ingredient = [2, 1, 1, 2, 3, 1, 2, 3, 1]
#ingredient = [1, 3, 2, 1, 2, 1, 3, 1, 2]
print(solution(ingredient))