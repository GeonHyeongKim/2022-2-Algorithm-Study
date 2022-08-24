from collections import defaultdict

#10일을 연속해서 만족하는 제품이 있을 때, 가입할 수 있는 날
def solution(want, number, discount):
    #일정 금액 -> 10일 회원
    #한 가지 제품 할인, 하나만 구매 가능

    def in_dict(discount_dict, number, want):
        for idx, w in enumerate(want):
            if discount_dict[w] < number[idx]:
                return False
        return True

    answer = 0
    discount_dict = defaultdict(int)
    #일단 첫날부터 10일 구한다. -> 빼고 더하기
    for i in range(10):
        discount_dict[discount[i]] += 1
    if in_dict(discount_dict, number, want):
        answer += 1
    if len(discount) > 10:
        idx = 0
        for i in range(10, len(discount)):
            discount_dict[discount[idx]] -= 1
            discount_dict[discount[i]] += 1
            idx += 1
            if in_dict(discount_dict, number, want):
                answer += 1

    return answer


want = ["banana", "apple", "rice", "pork", "pot"]
number = [3, 2, 2, 2, 1]
discount = ["chicken", "apple", "apple", "banana", "rice", "apple", "pork", "banana", "pork", "rice", "pot", "banana", "apple", "banana"]

want = ["apple"]
number = [10]
discount = ["banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana"]
print(solution(want, number, discount))