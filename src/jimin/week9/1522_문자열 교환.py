import math
import sys
from collections import Counter

input = sys.stdin.readline

# a는 모두 연속으로 만들기 위해 교환하는 문제
s = input().rstrip()
n = len(s)  # 문자열 길이
a_count = s.count('a')  # a갯수

#초반 a개수만큼 자름
count_dict = Counter(s[0:a_count])

l, r = 0, a_count - 1
answer = math.inf
while r < n + a_count - 1:
    answer = min(answer, count_dict['b'])

    count_dict[s[l % n]] -= 1
    r, l = r + 1, l + 1
    count_dict[s[r % n]] += 1

print(answer)
