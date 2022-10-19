def solution(enroll, referral, seller, amount):
    n = len(enroll)  # 총 사람 길이
    answer = [0] * (n+1)
    name = dict() # 이름 - 인덱스

    def find_parent(s, a): #판매인, 남은 판매가격
        if parent[s] == s or (a // 10) == 0:
            answer[s] += a
            return

        # 본인이 부모가 아니라면 타고 올라갈 수 있음
        next = a // 10
        answer[s] += a - next
        find_parent(parent[s], next)


    # 이름 - 인덱스 저장
    for i, e in enumerate(enroll):
        name[e] = i + 1

    # 부모 입력
    parent = [i for i in range(n + 1)]
    for i, r in enumerate(referral): #i의 부모는 r
        if r == "-":
            parent[i + 1] = 0
        else:
            parent[i + 1] = name[r]

    #판매인, 판매량
    for s, a in zip(seller, amount):
        find_parent(name[s], a * 100)

    return answer[1:] #센터는 필요 없음


enroll = ["john", "mary", "edward", "sam", "emily", "jaimie", "tod", "young"]
referral = ["-", "-", "mary", "edward", "mary", "mary", "jaimie", "edward"]
seller = ["young", "john", "tod", "emily", "mary"]
amount = [12, 4, 2, 5, 10]

# enroll = ["john", "mary", "edward", "sam", "emily", "jaimie", "tod", "young"]
# referral = ["-", "-", "mary", "edward", "mary", "mary", "jaimie", "edward"]
# seller = ["sam", "emily", "jaimie", "edward"]
# amount = [2, 3, 5, 4]
print(solution(enroll, referral, seller, amount))
