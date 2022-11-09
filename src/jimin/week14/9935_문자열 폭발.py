import sys
from collections import deque

input = sys.stdin.readline

str1 = input().rstrip()
str2 = input().rstrip()

len2 = len(str2)

stack = []
str_temp = deque(str1)
while str_temp:
    if (len(stack) >= len2) and ''.join(stack[-len2:]) == str2:
        for i in range(len2):
            stack.pop()
        continue
    stack.append(str_temp.popleft())

if ''.join(stack[-len2:]) == str2:
    stack = stack[:-len2]
print(''.join(stack) if stack else "FRULA")
