from itertools import combinations
from collections import Counter


def solution(orders, courses):
    answer = []
    for course in courses:  # 개수
        order_list = list()
        for order in orders:
            order_list += list(combinations(sorted(order), course))

        count_order = Counter(order_list)
        count_order = sorted(count_order.items(), key=lambda x: x[1], reverse=True)  # 개수로 정렬

        if count_order:
            max_c = count_order[0][1]
        else:
            continue
        for o, c in count_order:
            if c >= 2 and c == max_c:
                answer.append("".join(o))

    return sorted(answer)


orders = ["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"]
course = [2, 3, 4]

orders = ["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"]
course = [2, 3, 5]

orders = ["XYZ", "XWY", "WXA"]
course = [2, 3, 4]
print(solution(orders, course))
