def solution(n, k, cmd):
    answer = ''
    graph = {i: [i - 1, i + 1] for i in range(0, n)}
    graph[0] = [n-1, 1]
    graph[n-1] = [n-2, 0]
    stack = []
    ptr = k
    for c in cmd:
        if c == 'C':
            x, y = graph[ptr]
            graph[x][1] = y
            graph[y][0] = x
            
            stack.append([ptr, x, y])
            del graph[ptr]
            
            if y < ptr:
                ptr = x
            else:
                ptr = y
        elif c == 'Z':
            p, x, y = stack.pop()
            graph[p] = [x,y]
            graph[x][1] = p
            graph[y][0] = p
        else:
            o, cnt = c.split()
            if o == 'U':
                for _ in range(int(cnt)):
                    ptr = graph[ptr][0]
            else:
                for _ in range(int(cnt)):
                    ptr = graph[ptr][1]
    
    for i in range(n):
        if i in graph:
            answer += 'O'
        else:
            answer += 'X'
    return answer