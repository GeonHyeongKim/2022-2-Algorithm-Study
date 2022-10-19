import sys
from collections import deque

input = sys.stdin.readline

n, k = map(int, input().split())
n_2 = 2 * n
arr = deque(list(map(int, input().split())))
robot = deque([0] * n)

# 한 칸 이동
def stage1():
    arr.rotate()
    robot.rotate()
    robot[n - 1] = 0

def stage2():
    for i in range(n-1, -1, -1):
        if not robot[i] and arr[i] >= 1:
            curr_robot = robot[i-1]
            robot[i] += curr_robot
            robot[i-1] -= curr_robot
            arr[i] -= curr_robot
    robot[n - 1] = 0


def stage3():
    if arr[0] and not robot[0]:
        robot[0] += 1
        arr[0] -= 1

def stage4():
    if arr.count(0) >= k:
        return True
    return False

answer = 1
while 1:
    stage1()
    stage2()
    stage3()
    if stage4():
        print(answer)
        break
    answer+=1
