from collections import Counter
from collections import defaultdict

#롤케이크 토핑을 동일하게 나누는 문제
def solution(topping):
    answer = 0
    topping_dict = Counter(topping)
    topping_dict_len = len(topping_dict)
    find_dict = defaultdict(int)
    for t in topping:
        find_dict[t] += 1
        topping_dict[t] -= 1
        topping_dict_len = topping_dict_len-1 if topping_dict[t] == 0 else topping_dict_len
        if len(find_dict) == topping_dict_len:
            answer += 1
    return answer

topping = [1, 2, 3, 1, 4]
print(solution(topping))