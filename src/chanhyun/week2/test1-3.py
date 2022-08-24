def solution(order):
    sub = []
    ptr = 0
    for i in range(1, len(order)+1):
        if order[ptr] == i:
            ptr += 1
        else:
            while sub and order[ptr] == sub[-1]:
                sub.pop()
                ptr += 1
            sub.append(i)
        if ptr >= len(order):
            break
    while sub and order[ptr] == sub[-1]:
        sub.pop()
        ptr += 1
    return ptr