def getMinutes(t1, t2):
    t1 = t1.split(':')
    t2 = t2.split(':')
    return (int(t2[0])-int(t1[0]))*60+int(t2[1])-int(t1[1])

def changeNote(note):
    newNote = ''
    for i in range(len(note)):
        if note[i] == '#':
            continue
        if i < len(note)-1 and note[i+1] =='#':
            newNote += note[i].lower()
        else:
            newNote += note[i]
    return newNote

def check(m, music):
    for i in range(len(music)-len(m)+1):
        flag = True
        for j in range(len(m)):
            if m[j] != music[i+j]:
                flag = False
                break
        if flag:
            return True        
    return False

def solution(m, musicinfos):
    answer = []
    m = changeNote(m)
    for i in range(len(musicinfos)):
        musicinfo = musicinfos[i].split(',')
        minutes = getMinutes(musicinfo[0], musicinfo[1])
        notes = changeNote(musicinfo[3])
        music = (minutes // len(notes))*notes+notes[:(minutes % len(notes))]
        if check(m, music):
            answer.append([minutes, i, musicinfo[2]])
    if answer == []:
        return '(None)'
    else:
        answer.sort(key = lambda x: (-x[0], x[1]))
        return answer[0][2]