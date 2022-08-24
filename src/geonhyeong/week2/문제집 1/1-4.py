#
#  1-4.swift
#  Question Link:
#  Primary idea:   완전탐색
#
#  Time Complexity : O()
#  Space Complexity : O()
#  Runtime:  ms
#  Memory Usage:  MB
#

from copy import deepcopy

def reverseRow(board, row):
    for i in range(0, len(board[row])):
        board[row][i] = board[row][i] ^ 1

def reverseCol(board, col):
    for i in range(0, len(board)):
        board[i][col] = board[i][col] ^ 1

def printBoard(board, target):
    for i in range(len(board)):
        print(board[i], target[i], sep=" ")
    print()

def solution(beginning, target):
    answer1 = [0, 0]
    answer2 = [0, 0]
    rotaionCount = 0 # 반복 횟수 -> 최대 20번

    for i in range(0, 2):
        changeFlag = i
        rotaionCount = 0
        board = deepcopy(beginning)
        
        while board != target:
            if changeFlag == 0: # 행 뒤집기
                for j in range(0, len(board)):
                    if (board[j][0] != target[j][0]):
                        reverseRow(board, j)
                        answer1[i] += 1
            else:
                for j in range(0, len(board[0])):
                    if (board[0][j] != target[0][j]):
                        reverseCol(board, j)
                        answer1[i] += 1
            
            changeFlag = changeFlag ^ 1
            if rotaionCount == 20:
                answer1[i] = -1
                break
            else:
                rotaionCount += 1
    
    for i in range(0, 2):
        changeFlag = i
        rotaionCount = 0
        board = deepcopy(beginning)
        l = len(board) - 1
        ll = len(board[0]) - 1

        while board != target:
            if changeFlag == 0: # 행 뒤집기
                for j in range(0, len(board)):
                    if (board[j][ll] != target[j][ll]):
                        reverseRow(board, j)
                        answer2[i] += 1
            else:
                for j in range(0, len(board[0])):
                    if (board[l][j] != target[l][j]):
                        reverseCol(board, j)
                        answer2[i] += 1
            
            changeFlag = changeFlag ^ 1
            if rotaionCount == 20:
                answer2[i] = -1
                break
            else:
                rotaionCount += 1

    return min(answer1[0], answer1[1], answer2[0], answer2[1])

# print(solution([[0, 1, 0, 0, 0], [1, 0, 1, 0, 1], [0, 1, 1, 1, 0], [1, 0, 1, 1, 0], [0, 1, 0, 1, 0]], [[0, 0, 0, 1, 1], [0, 0, 0, 0, 1], [0, 0, 1, 0, 1], [0, 0, 0, 1, 0], [0, 0, 0, 0, 1]])) # 5
# print(solution([[0, 0, 0], [0, 0, 0], [0, 0, 0]], [[1, 0, 1], [0, 0, 0], [0, 0, 0]])) # -1
print(solution([[0,0,0,0,0,0,1,1,1,0]], [[1,0,1,0,1,0,0,0,0,0]])) # 5
