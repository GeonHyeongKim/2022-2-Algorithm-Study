def toSeconds(time):
    h, m, s = map(int, time.split(':'))
    return h*60*60+m*60+s

def toTime(second):
    h = str(second // 3600)
    if len(h) == 1:
        h = '0'+h
    second = second % 3600
    m = str(second // 60)
    if len(m) == 1:
        m = '0'+m
    s = str(second % 60)
    if len(s) == 1:
        s = '0'+s
    return str(h)+':'+str(m)+':'+str(s)
    
def solution(play_time, adv_time, logs):
    playTime = toSeconds(play_time)
    advTime = toSeconds(adv_time)
    
    watchers = [0 for _ in range(playTime+1)]
    for log in logs:
        start, end = log.split('-')
        s, e = toSeconds(start), toSeconds(end)
        watchers[s] += 1
        watchers[e] -= 1
    
    for i in range(1, playTime+1):
        watchers[i] += watchers[i-1]
        
    for i in range(1, playTime+1):
        watchers[i] += watchers[i-1]
    
    answer = 0
    maxCount = watchers[advTime-1]
    for i in range(1, playTime-advTime+1):
        if watchers[i+advTime] - watchers[i] > maxCount:
            maxCount = watchers[i+advTime] - watchers[i]
            answer = i+1
    return toTime(answer)