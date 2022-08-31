import math
from collections import Counter, defaultdict


def solution(gems):
    total_count = len(Counter(gems))  # 종류 수
    get_dict = defaultdict(int)
    get_dict[gems[0]] += 1

    i, j = 0, 0
    diff = math.inf
    answer = (i, j)
    while True:
        if total_count == len(get_dict):  # 길이를 줄일 수 있다
            get_dict[gems[i]] -= 1
            if get_dict[gems[i]] == 0:
                del get_dict[gems[i]]
            if diff > j - i + 1:
                answer = (i, j)
                diff = j - i + 1
            i += 1
        else:  # 추가 가능
            j += 1
            if j == len(gems):
                break
            get_dict[gems[j]] += 1
    return (answer[0] + 1, answer[1] + 1)


# gems = ["DIA", "RUBY","DIA", "RUBY", "RUBY","RUBY" ,"EMERALD", "EMERALD","SAPPHIRE", "DIA"]
# gems = ["DIA", "EM", "EM", "RUB", "DIA"]
gems = ["AA", "AB", "AC", "AA", "AC"]
# gems = ["XYZ", "XYZ", "XYZ"]
# gems = ["A","AC","AB", "A","C", "AC", "C"]

print(solution(gems))
