from collections import deque

#보조 컨테이너 벨트
def solution(order):
    answer = 0

    #순서에 맞게 상자 담기
    order_list = [0] * len(order)
    idx = 1
    for o in order:
        order_list[o-1] = idx
        idx += 1

    order_list = deque(order_list)
    sub_queue = deque()
    #보조 컨테이너는 스택
    current_idx = 1
    while order_list:
        if current_idx == order_list[0]:
            order_list.popleft()
            answer += 1
            current_idx += 1
        elif sub_queue and current_idx == sub_queue[-1]:
            sub_queue.pop()
            answer += 1
            current_idx += 1
        else:
            sub_queue.append(order_list.popleft())

    #보조에서 꺼낼 수 있으면 꺼내야함
    while sub_queue:
        if sub_queue[-1] == current_idx:
            sub_queue.pop()
            answer += 1
            current_idx += 1
        else:
            break

    return answer

#order = [4, 3, 1, 2, 5]
order = [5,4,3,2,1]
print(solution(order))