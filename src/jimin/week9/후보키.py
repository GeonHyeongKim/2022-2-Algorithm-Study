relation = [["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]]
from itertools import combinations

def solution(relation):
    answer = []
    col = len(relation[0])
    row = len(relation)
    # 칼럼의 수로 늘려가면서 진행 1 이상 8이하
    idxs = []
    for i in range(1, col+1):
        idxs.extend(list(combinations(range(col), i)))

    for idx in idxs:
        temp = []
        for rel in relation:
            temp_tuple = []
            for i in idx:
                temp_tuple.append(rel[i])
            temp.append(tuple(temp_tuple))

        if len(set(temp)) == row:
            is_put = True
            for j in answer:
                if set(j).issubset(set(idx)):

                    is_put = False
                    break
            if is_put:
                answer.append((idx))


    return len(answer)

print(solution(relation))