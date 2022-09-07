import re
from collections import defaultdict


def solution(files):
    temp = defaultdict(list)
    for idx, file in enumerate(files):
        result = re.search('([\D]+)([0-9]+)(\S*)', file)  # 정규표현식
        # 같은 문자열을 가지는 파일명 저장
        # key: 파일명, value: (숫자, 인덱스)
        temp[result.group(1).lower()].append((int(result.group(2)), idx))

    temp = sorted(temp.items(), key=lambda x: x[0])  # header 명 기준 정렬
    answer = []
    for key, value in temp:
        value = sorted(value, key=lambda x: x[0])
        for v in value:
            answer.append(files[v[1]])
    return answer


files = ["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"]
files = ["B-50 Superfortress", "A-10 Thunderbolt II", "F-14 Tomcat", "F-5 Freedom Fighter"]
print(solution(files))
