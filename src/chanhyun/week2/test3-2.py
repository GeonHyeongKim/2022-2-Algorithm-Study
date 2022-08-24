from collections import deque

def solution(ingredient):
    answer = 0
    ingredient = deque(ingredient)
    stack = []
    while ingredient:
        i = ingredient.popleft()
        if len(stack) >= 3 and i == 1 and stack[-1] == 3 and stack[-2] == 2 and stack[-3] == 1:
            stack.pop()
            stack.pop()
            stack.pop()
            answer += 1
        else:
            stack.append(i)

    if len(stack) >= 3 and i == 1 and stack[-1] == 3 and stack[-2] == 2 and stack[-1] == 1:
        stack.pop()
        stack.pop()
        stack.pop()
        answer += 1
        
    return answer