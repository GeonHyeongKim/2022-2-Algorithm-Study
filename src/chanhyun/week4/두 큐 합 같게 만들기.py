from collections import deque

def solution(queue1, queue2):
    sum1 = sum(queue1)
    sum2 = sum(queue2)
    q = queue1 + queue2
    l, r = 0, len(queue1)-1
    
    flag = False
    count = 0
    while True:
        if sum1 == sum2:
            flag = True
            break
        elif sum1 > sum2:
            sum1 -= q[l]
            sum2 += q[l]
            l += 1
            if l >= len(q):
                break
        elif sum1 < sum2:
            r += 1
            if r >= len(q):
                break
            sum2 -= q[r]
            sum1 += q[r]
        count += 1
        
    if flag:
        return count
    else:
        return -1