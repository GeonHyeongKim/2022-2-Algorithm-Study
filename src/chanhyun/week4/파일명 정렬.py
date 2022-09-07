def solution(files):
    answer = []
    for file in files:
        head, number, tail = '', '', ''
        for i in range(len(file)):
            if file[i].isdigit():
                head = file[:i]
                number = file[i:]
                for j in range(len(number)):
                    if not number[j].isdigit():
                        tail = number[j:]
                        number = number[:j]
                        break
                answer.append([head, number, tail])
                break
        answer.sort(key = lambda x: (x[0].lower(), int(x[1])))
    return ["".join(a) for a in answer]