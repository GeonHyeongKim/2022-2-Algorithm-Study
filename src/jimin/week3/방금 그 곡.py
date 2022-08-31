def solution(m, musicinfos):
    replace = {"C#": "H", "D#": "I", "F#": "J", "G#": "K", "A#": "L", "E#": "M"}
    music_dict = dict()

    for musicinfo in musicinfos:  # 시작, 끝, 제목, 악보
        start, end, title, music = musicinfo.split(",")
        duration = getTime(end) - getTime(start)
        for k, v in replace.items():
            if k in music:
                music = music.replace(k, v)

        # 재생된 길이가 짧다면 길이만큼 잘라서
        music_len = len(music)
        if music_len >= duration:
            music = music[:duration]
        else:  # 길다면 더 붙이도록
            music *= duration // music_len
            music += music[:duration % music_len]
        music_dict[title] = [duration, music]

    music_dict = dict(sorted(music_dict.items(), key=lambda x: x[1][0], reverse=True))

    for title, musicinfo in music_dict.items():
        for k, v in replace.items():
            if k in m:
                m = m.replace(k, v)
        if m in musicinfo[1]:
            return title
    return "(None)"


def getTime(start):
    time = start.split(":")
    return int(time[0]) * 60 + int(time[1])


m = "ABCDEFG"
musicinfos = ["13:00,13:04,WORLD,ABC#DEF", "12:00,12:14,HELLO,CDEFGA#B"]
m = "ABC"
musicinfos = ["12:00,12:14,HELLO,C#DEFGAB", "13:00,13:05,WORLD,ABCDEF"]
m = "CC#BCC#BCC#BCC#B"
musicinfos = ["03:00,03:30,FOO,CC#B", "04:00,04:08,BAR,CC#BCC#BCC#B"]
m = "A#"
musicinfos = ["12:00,12:01,HELLO,A#"]
print(solution(m, musicinfos))
