def solution(s):
    answer = len(s)
    for l in range(1, len(s)//2+1):
        parts = []
        for i in range(0, len(s), l):
            parts.append(s[i:i+l])
        
        short = ''
        cnt = 1
        for i in range(len(parts)-1):
            if parts[i] == parts[i+1]:
                cnt += 1
            else:
                if cnt == 1:
                    short += parts[i]
                else:
                    short += str(cnt) + parts[i]
                cnt = 1
        
        if cnt == 1:
            short += parts[-1]
        else:
            short += str(cnt) + parts[-1]
        
        answer = min(answer, len(short))
    return answer