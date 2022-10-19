from collections import defaultdict
import sys
sys.setrecursionlimit(10**6)

def make_tree(node_dict, curr_node, root_x, tree, root):  # 7 (8,6)
    x, y = node_dict[curr_node]

    while True:
        if root_x > x:
            if tree[root][0] == -1:  # 비어 있다면
                tree[root][0] = curr_node
                break
            else:
                root = tree[root][0]

        elif root_x < x:
            if tree[root][1] == -1:
                tree[root][1] = curr_node
                break
            else:
                root = tree[root][1]
        root_x = node_dict[root][0]


pre_order = []
def preorder(node, tree):
    if node == -1:
        return
    pre_order.append(node)
    preorder(tree[node][0], tree)
    preorder(tree[node][1], tree)


post_order = []
def postorder(node, tree):
    if node == -1:
        return
    postorder(tree[node][0], tree)
    postorder(tree[node][1], tree)
    post_order.append(node)


def solution(nodeinfo):
    node_dict = defaultdict(list)
    for idx, node in enumerate(nodeinfo):
        node_dict[idx + 1].extend(node)  # x,y좌표
    # y좌표로 정렬(내림) -> x좌표로 정렬(오름)
    node_dict = sorted(node_dict.items(), key=lambda x: (-x[1][1], x[1][0]))
    root = node_dict[0][0]
    node_dict = dict(node_dict)
    root_x, root_y = node_dict[root]
    tree = defaultdict(list)
    for i in range(1, len(nodeinfo) + 1):
        tree[i] = [-1, -1]

    for key in node_dict.keys():
        if key == root:
            continue
        make_tree(node_dict, key, root_x, tree, root)
    #print(tree)
    preorder(root, tree)
    postorder(root, tree)

    return [pre_order, post_order]


nodeinfo = [[5, 3], [11, 5], [13, 3], [3, 5], [6, 1], [1, 3], [8, 6], [7, 2], [2, 2]]
print(solution(nodeinfo))
