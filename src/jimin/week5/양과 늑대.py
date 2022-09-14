from collections import defaultdict, deque


def solution(info, edges):  # 0: 양, 1: 늑대
    tree = defaultdict(list)

    def bfs():
        queue = deque()
        queue.append((1, 0, 0, set()))  # 양 수, 늑대 수, 현재 노드, 다음 이동할 노드

        max_sheep = -1
        while queue:
            print(queue)
            sheep, wolf, curr_n, next_n_set = queue.popleft()
            max_sheep = max(max_sheep, sheep)

            for next in tree[curr_n]:
                next_n_set.add(next) #다음 이동할 수 있는 노드들 추가

            for n in next_n_set:
                if info[n] == 0: #양이라면
                    queue.append((sheep+1, wolf, n, next_n_set - {n}))
                else: #늑대면
                    if sheep > wolf +1:
                        queue.append((sheep, wolf+1, n, next_n_set - {n}))
        return max_sheep

    for p, c in edges:
        tree[p].append(c)

    return bfs()


info = [0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1]
edges = [[0, 1], [1, 2], [1, 4], [0, 8], [8, 7], [9, 10], [9, 11], [4, 3], [6, 5], [4, 6], [8, 9]]
print(solution(info, edges))
