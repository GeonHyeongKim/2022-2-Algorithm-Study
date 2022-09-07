from collections import deque


def solution(queue1, queue2):
    queue_len = len(queue1)
    queue1, queue2 = deque(queue1), deque(queue2)
    queue1_sum, queue2_sum = sum(queue1), sum(queue2)

    answer = 0

    for i in range(queue_len * 3):
        if queue1_sum == queue2_sum:
            return answer
        if queue1_sum < queue2_sum:
            queue1_sum += queue2[0]
            queue2_sum -= queue2[0]
            queue1.append(queue2.popleft())
            answer += 1
        else:
            queue1_sum -= queue1[0]
            queue2_sum += queue1[0]
            queue2.append(queue1.popleft())
            answer += 1

    return -1
