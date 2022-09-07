from collections import defaultdict


def solution(genres, plays):
    answer = []
    album_total = defaultdict(int)
    album_list = defaultdict(list)
    # 장르별 가장 많이 재생된 음악 2개

    for idx, (g, p) in enumerate(zip(genres, plays)):
        album_total[g] += p
        album_list[g].append((p, idx))
        idx += 1
    album_total = sorted(album_total.items(), key=lambda x: x[1], reverse=True)  # 재생 횟수 정렬

    for genre, total in album_total:
        temp = sorted(album_list[genre], key=lambda x: x[0], reverse=True)[:2]
        for t in temp:
            answer.append(t[1])

    return answer


genres = ["classic", "pop", "classic", "classic", "pop"]
plays = [500, 600, 150, 800, 2500]

print(solution(genres, plays))
