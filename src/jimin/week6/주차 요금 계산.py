fees = [180, 5000, 10, 600]
records = ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]
import math
def solution(fees, records):
    answer = []
    # OUT 없다면 23:59 뺌
    # 누적 시간 기준
    car_data = {}
    times = {}

    for i, record in enumerate(records):
        time, car_number, info = record.split(" ")
        print(time, car_number, info)
        if info == "IN":
            car_data[car_number] = time
        elif info == "OUT":
            total_time = get_time(car_data, car_number, time)
            times[car_number] = times.get(car_number, 0) + total_time

    while car_data.keys():
        car_number = list(car_data.keys())[0]
        times[car_number] = times.get(car_number, 0) + get_time(car_data, car_number, "23:59")

    for key, value in sorted(times.items(), key = lambda x:x[0]):
        if value <= fees[0]:
            answer.append(fees[1])
        else:
            answer.append(fees[1] + math.ceil((value- fees[0]) / fees[2]) * fees[3])
    return answer


def get_time(car_data, car_number, time):
    in_hour, in_minute = car_data[car_number].split(":")
    del (car_data[car_number])
    out_hour, out_minute = time.split(":")
    total_time = 0
    if (in_minute <= out_minute):
        total_time += int(out_minute) - int(in_minute)
        total_time += (int(out_hour) - int(in_hour)) * 60
    else:
        total_time += abs((int(in_minute) - int(out_minute)) - 60)
        total_time += (int(out_hour) - int(in_hour) - 1) * 60
    return total_time


print(solution(fees, records))