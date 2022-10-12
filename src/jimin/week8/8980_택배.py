import sys
input = sys.stdin.readline

n, c = map(int, input().split()) #마을 수, 박스 용량
deli = []
m = int(input())
for i in range(m):
     d, e, f = map(int, input().split()) #보냄, 받음, 박스 수
     deli.append((d,e,f))

#도착지에 따라 정렬
deli = sorted(deli, key= lambda x: x[1])

remain = [c] * (n + 1)
answer = 0
for i in range(m):
    temp = c #최대 용량 이동 가능
    #1 - 2에서 이동
    for j in range(deli[i][0], deli[i][1]): #내려놓기 전까진 용량 차지 중
        temp = min(temp, remain[j])
    temp = min(deli[i][2], temp)

    #옮기는 양 감소
    for j in range(deli[i][0], deli[i][1]):
        remain[j] -= temp
    answer += temp

print(answer)


