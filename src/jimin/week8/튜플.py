def solution(s):
    answer = []

    tuple_list = []
    num = ""
    flag = False
    for element in s[1:-1]:
        if element == '{':
            tuple_element = []
            flag = True
        if element == '}':
            tuple_element.append(int(num))
            tuple_list.append(tuple_element)
            num = ""
            flag = False
        if element == ',' and flag:
            tuple_element.append(int(num))
            num = ""
        if element.isdigit():
            num += element

    tuple_list = sorted(tuple_list, key=lambda x: len(x))

    for tuple in tuple_list:
        for i in tuple:
            if not i in answer:
                answer.append(i)
    return answer

s = "{{20,111},{111}}"
print(solution(s))