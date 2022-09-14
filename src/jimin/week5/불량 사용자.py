import re
from itertools import permutations

def solution(user_id, banned_id):
    banned_count = len(banned_id)
    answer = []

    for i in range(banned_count):
        banned_id[i] = banned_id[i].replace("*", ".")

    for permutation in permutations(user_id, banned_count):
        visited = [0] * banned_count
        temp = set()
        for b in banned_id:
            for i, p in enumerate(permutation):
                if visited[i]:
                    continue
                if re.fullmatch(b, p):
                    visited[i] = 1
                    temp.add(p)
                    break
        if sum(visited) == banned_count:
            if temp not in answer:
                answer.append(temp)
    return len(answer)


user_id = ["frodo", "fradi", "crodo", "abc123", "frodoc"]
banned_id = ["fr*d*", "abc1**"]

# user_id = ["frodo", "fradi", "crodo", "abc123", "frodoc"]
# banned_id = ["*rodo", "*rodo", "******"]

user_id = ["frodo", "fradi", "crodo", "abc123", "frodoc"]
banned_id = ["fr*d*", "*rodo", "******", "******"]

# user_id = ["12345", "12453", "aaaaab"]
# banned_id = ["*****", "******" ]
print(solution(user_id, banned_id))
