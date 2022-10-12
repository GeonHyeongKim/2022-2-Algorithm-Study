import sys
from collections import Counter
input = sys.stdin.readline

n = int(input())
m = int(input())

parent = [i for i in range(n+1)]
def find_parent(x):
    if parent[x] != x:
        parent[x] = find_parent(parent[x])
    return parent[x]

def union(a, b):
    a = find_parent(a)
    b = find_parent(b)

    if a < b:
        parent[b] = a
    else:
        parent[a] = b

arr = []
for _ in range(m):
    x, y = map(int, input().split())
    arr.append((x,y))

arr = sorted(arr, key=lambda x:(x[0], x[1]))

for x, y in arr:
    if find_parent(x) != find_parent(y):
        for i in range(x+1, y+1):
            union(i-1, i)

print(len(Counter(parent[1:])))