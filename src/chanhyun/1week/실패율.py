def solution(N, stages):
    answer = []
    players = [0 for _ in range(N+2)]
    for s in stages:
        players[s] += 1
    
    dp = [0 for _ in range(N+2)]
    dp[-1] = players[-1]
    for i in range(N, 0, -1):
        dp[i] = dp[i+1] + players[i]
    
    fail = []
    for i in range(1, N+1):
        if dp[i] == 0:
            fail.append([0, i])
        else:
            fail.append([players[i]/dp[i], i])
    fail.sort(key=lambda x: (-x[0], x[1]))
    
    for f in fail:
        answer.append(f[1])
    return answer

##############################################

def solution(N, stages):
    fail = {}
    clear = len(stages)
    for i in range(1, N+1):
        if clear != 0:
            count = stages.count(i)
            fail[i] = count / clear
            clear -= count
        else:
            fail[i] = 0

    return sorted(fail, key=lambda x : fail[x], reverse=True)