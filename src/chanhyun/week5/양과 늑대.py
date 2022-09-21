import sys
from copy import deepcopy
sys.setrecursionlimit(10**9)

answer = 0
def solution(info, edges):
    global answer
    graph = [[] for _ in range(len(info))]
    for x, y in edges:
        graph[x].append(y)
    
    def dfs(node, sheep, wolf, possible, route):
        global answer
        if info[node] == 0:
            sheep += 1
        else:
            wolf += 1
        if sheep <= wolf:
            return
        answer = max(answer, sheep)

        possible |= set(graph[node])
        route.add(node)
        for nextNode in possible-route:
            dfs(nextNode, sheep, wolf, deepcopy(possible), deepcopy(route))
        
    dfs(0, 0, 0, set(), set())
    return answer