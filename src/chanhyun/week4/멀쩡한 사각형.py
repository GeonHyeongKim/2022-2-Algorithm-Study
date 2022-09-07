import math

def solution(w,h):
    answer = 0
    for i in range(h//2):
        answer += w//2 - math.ceil((w/h)*(i+1))
    return answer*4+(w//2)*(h//2)*2