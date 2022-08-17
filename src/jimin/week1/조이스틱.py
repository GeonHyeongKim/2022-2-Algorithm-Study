def solution(name):
    answer = 0
    min_move = len(name) - 1
    for idx, n in enumerate(name):
        diff = abs(ord(n) - ord('A'))
        answer += min(diff, 26 - diff )

        next = idx + 1
        while next < len(name) and name[next] == 'A':
            next += 1
        print(next, "z", idx)

        conti_a = idx + 1
        for i in range(idx + 1, len(name)):
            if name[i] != 'A': #다음에 A가 나오지 않는다면
                conti_a = i
                break
        print(conti_a)
        #왼쪽으로 이동: 현 위치까지 오른쪽으로 갔다가 다시 왼쪽으로 원점 (idx *2) + A 의 오른쪽까지 이동
        #오른쪽으로 이동: A의 오른쪽까지 갔다가 원점 (len(name)-conti_a) *2 + 현 위치로 이동
        #min_move = min([min_move, idx*2 + len(name) - conti_a, (len(name)-conti_a) * 2 + idx])
    answer += min_move
    return answer


name = "BCAAABCA"
print(solution(name))