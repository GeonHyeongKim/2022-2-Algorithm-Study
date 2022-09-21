from itertools import permutations

def check(perm, banned):
    for i in range(len(perm)):
        ui, bi = perm[i], banned[i]
        if len(bi) != len(ui):
            return False
        for i in range(len(bi)):
            if bi[i] != '*' and bi[i] != ui[i]:
                return False
    return True

def solution(user_id, banned_id):
    result = set()
    for perm in permutations(user_id, len(banned_id)):
        if check(perm, banned_id):
            result.add("".join(sorted(list(perm))))
    return len(result)