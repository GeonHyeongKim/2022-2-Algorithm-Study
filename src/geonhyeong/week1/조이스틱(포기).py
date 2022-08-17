#
#  조이스틱.swift
#  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/42860?language=swift
#  Primary idea:   그리디
#
#  문제 이해/풀이 : 03:20, 02:13:15
#  참고 : https://bellog.tistory.com/152
#  Time Complexity : O()
#  Space Complexity : O()
#  Runtime:  ms
#  Memory Usage:  MB
#

# 참고함
def solution(name):
    answer = 0
    
    # ▲,▼ 구하기
    for char in name:
        left = ord(char) - ord('A')
        right = ord('Z') - ord(char) + 1
        answer += min(left, right)
        
    # ◀, ▶ (shift) 구하기
    shift = len(name) - 1
    next = 0 # 현재 A에서 다음 'A가 아닌 알파벳'의 위치
    
    for i, char in enumerate(name):
        if char == 'A':
            next = i
            while next < len(name) and name[next] == 'A':
                next += 1
            
            left = 0 if i == 0 else i - 1
            right = len(name) - next
            shift = min(shift, left + right + min(left, right)) # 왕복을 해야하기 때문에
            # print(i, next, shift, left, right)
            
    answer += shift
    
    return answer

print(solution("BBAAABAAAAAAAAAAAABA")) # len = 20
