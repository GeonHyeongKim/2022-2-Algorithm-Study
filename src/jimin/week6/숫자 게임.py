from collections import deque
def solution(A, B):
    answer = 0
    A.sort(reverse=True)
    B = deque(sorted(B, reverse=True))

    for a in A:
        if a < B[0]:
            B.popleft()
            answer += 1

    return answer

A = [5,1,3,7]
B = [2,2,6,8]
# A = [2,2,2,2]
# B = [1,1,1,1]
print(solution(A, B))