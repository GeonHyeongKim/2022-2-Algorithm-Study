from collections import defaultdict

def solution(gems):
    answer = []
    length = len(gems)+1
    gem_num = len(set(gems))
    basket = defaultdict(int)
    l, r = 0, 0
    while r < len(gems):
        basket[gems[r]] += 1
        r += 1
        
        if len(basket) >= gem_num:
            while l < r:
                if basket[gems[l]] > 1:
                    basket[gems[l]] -= 1
                    l += 1
                else:
                    break
            if length > r-l:
                length = r-l
                answer = [l+1, r]
    return answer