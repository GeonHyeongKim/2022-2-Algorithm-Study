def solution(play_time, adv_time, logs):
    play_time = get_time(play_time)
    adv_time = get_time(adv_time)
    total_time = [0] * (play_time + 1)

    for log in logs:
        start, end = log.split("-")
        start_second = get_time(start)
        end_second = get_time(end)

        total_time[start_second] += 1
        total_time[end_second] -= 1

    # 1, -1을 처리하기 위한 구간 합
    for i in range(1, play_time):
        total_time[i] += total_time[i - 1]
    #print(total_time)

    # 사람에 대한 구간 합
    for i in range(1, play_time):
        total_time[i] += total_time[i - 1]

    max_people = -1
    answer = 0  # 시작 위치
    # 끝나는 시간 기준으로 반복
    for i in range(adv_time - 1, play_time):
        if i >= adv_time:
            temp = total_time[i] - total_time[i - adv_time]
        else:
            temp = total_time[i]
        if temp > max_people:
            max_people = temp
            answer = i - adv_time + 1

    return get_str(answer)


def get_time(time):
    h, m, s = time.split(':')
    return int(h) * 60 * 60 + int(m) * 60 + int(s)


def get_str(time):
    h = time // 3600
    time = time % 3600
    m = time // 60
    s = time % 60
    return str(h).zfill(2) + ":" + str(m).zfill(2) + ":" + str(s).zfill(2)


play_time = "02:03:55"
adv_time = "00:14:15"
logs = ["01:20:15-01:45:14", "00:40:31-01:00:00", "00:25:50-00:48:29", "01:30:59-01:53:29", "01:37:44-02:02:30"]

play_time = "99:59:59"
adv_time = "25:00:00"
logs = ["69:59:59-89:59:59", "01:00:00-21:00:00", "79:59:59-99:59:59", "11:00:00-31:00:00"]

play_time = "00:00:10"
adv_time = "00:00:05"
logs = ["00:00:08-00:00:10"]

print(solution(play_time, adv_time, logs))
