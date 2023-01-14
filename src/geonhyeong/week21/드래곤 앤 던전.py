## 드래곤 앤 던전.py
## Question Link: https://www.acmicpc.net/problem/16434

import sys
input = sys.stdin.readline

N, A = map(int, input().split()) # 방의 갯수, 초기 공격력
info = []   # 사용자 정보

# 입력
for _ in range(N):
    type, atk, hp = map(int, input().split()) # 행동지침, 공격력, 생명력
    info.append((type, atk, hp))

def canClear(curATK, maxHP):
    curHP = maxHP

    # 모든 방 탐색
    for type, atk, hp in info:
        # 몬스터
        if type == 1:
            # 만약 나누어 떨어진다면 그냥 나누고, 아니면 한대 더 맞을수 있기 때문에 ㅎㅎ (숨만 붙어 있는 느낌)
            turn = hp // curATK if not hp % curATK else hp // curATK + 1
            
            curHP -= atk * (turn-1) # 몬스터 공격력 * (용사가 먼저 공격하므로 -1)
        # 물약
        else:
            curATK += atk
            curHP += hp
            # 최대 회복은 maxHP까지만
            if curHP > maxHP:
                curHP = maxHP

        # 용사의 HP가 0이하라면 클리어 불가능
        if curHP <= 0:
            return False
        
    return True


start, end = 1, N*int(1e6)*int(1e6) # 피 1로 시작, 최대피(모든 방(N)의 몬스터가 HP와 공격력이 전부 최대치(100000)일 경우)

while start <= end:
    mid = (start + end) // 2

    if canClear(A, mid):
        end = mid - 1
    else:
        start = mid + 1

print(start)