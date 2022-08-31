# from collections import deque
#
# def solution(n, k, cmd): #n: 행의 개수, k: 처음 시작 위치
#     last_idx = n - 1
#
#     def move(num, add_num, delete_list, k):  # 이동하고자 하는 수, + or -
#         cnt = 0
#         while True:
#             if num == cnt:
#                 break
#             k += add_num
#             if delete_list[k] == 1:
#                 continue
#             cnt += 1
#         return k
#
#     delete_list = [0] * n
#     delete_stack = deque()
#     for idx, command in enumerate(cmd):
#         if len(command) > 1: #단순 이동
#             c, num = command.split(" ")
#             if c == "U":
#                 k = move(int(num), -1, delete_list, k)
#             elif c == "D":
#                 k = move(int(num), 1, delete_list, k)
#         else:
#             if command == "C":
#                 delete_stack.append(k)
#                 delete_list[k] = 1
#                 if k == last_idx:
#                     k = move(1, -1, delete_list, k)
#                     last_idx -= 1
#                 else:
#                     k = move(1, 1, delete_list, k)
#             elif command == "Z":
#                 #print("z", delete_stack, last_idx)
#                 if delete_stack[-1] == last_idx+1:
#                     last_idx += 1
#                 delete_list[delete_stack.pop()] = 0
#
#     answer = ""
#     for i in range(n):
#         if delete_list[i] == 1:
#             answer += "X"
#         else:
#             answer += "O"
#
#     return answer


# 효율성 테스트 5까지만 통과 -> 해설 참고, 링크드 리스트로 풀이
###############################################################

def solution(n, k, cmd):  # n: 행의 개수, k: 처음 시작 위치
    linked = {0: [n - 1, 1], n - 1: [n - 2, 0]}
    for i in range(1, n - 1):
        linked[i] = [i - 1, i + 1]

    delete_stack = []

    for idx, command in enumerate(cmd):
        if len(command) > 1:  # 단순 이동
            c, num = command.split(" ")
            if c == "D":
                for i in range(int(num)):
                    k = linked[k][1]
            elif c == "U":
                for i in range(int(num)):
                    k = linked[k][0]
        else:
            if command == "C":
                pre, next = linked[k]
                delete_stack.append([k, pre, next])
                linked[linked[k][0]][1] = linked[k][1]
                linked[linked[k][1]][0] = linked[k][0]
                temp = k
                if linked[k][1] == 0:  # 마지막이면 전으로 이동
                    k = linked[k][0]
                elif linked[k][1] != 0:  # 마지막이 아니라면 한칸 후로 이동
                    k = linked[k][1]
                del linked[temp]
            elif command == "Z":
                z, pre, next = delete_stack.pop()
                linked[z] = [pre, next]
                linked[pre][1] = z
                linked[next][0] = z

    answer = ""
    print(linked)
    for i in range(n):
        temp = linked.get(i, "X")
        answer += "X" if temp == "X" else "O"

    return answer


n, k = 8, 2
# cmd = ["D 2","C","U 3","C","D 4","C","U 2","Z","Z"] #0 1 2 3 4/ 5 6 7
cmd = ["D 4", "C", "C"]
# cmd = ["C", "C", "C", "C", "C" , "C"]
# cmd = ["D 2","C","U 3","C","D 4","C","U 2","Z","Z","U 1","C"]

# n, k = 5, 1
# cmd = ["D 1", "D 1", "U 2", "C", "C"] #01234
print(solution(n, k, cmd))
