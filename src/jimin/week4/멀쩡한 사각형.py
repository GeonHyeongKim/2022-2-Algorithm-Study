# https://luv-n-interest.tistory.com/736
def get_gcd(x, y):
    if (y == 0):
        return x
    else:
        return get_gcd(y, x % y)


def solution(w, h):
    gcd = get_gcd(max(w, h), min(w, h))
    return w * h - (w + h - gcd)


w, h = 8, 12
print(solution(w, h))
