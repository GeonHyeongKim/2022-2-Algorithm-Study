def count_minutes(end, start):
    s = start.split(':')
    s_t = int(s[0])*60+int(s[1])
    e = end.split(':')
    e_t = int(e[0])*60+int(e[1])
    return e_t-s_t

def count_fee(m, fees):
    money = fees[1]
    if m > fees[0]:
        if (m - fees[0])%fees[2] == 0:
            money += (m - fees[0])//fees[2] * fees[3]
        else:
            money += ((m - fees[0])//fees[2] + 1) * fees[3]
    return money

def solution(fees, records):
    answer = []
    book = dict()
    minutes = dict()
    for record in records:
        r = record.split()
        if r[1] in book:
            book[r[1]].append(r[0])
        else:
            book[r[1]] = [r[0]]
        if r[1] not in minutes:
            minutes[r[1]] = 0
    
    for k, v in book.items():
        if len(v) % 2 == 1:
            book[k].append("23:59")
    
    for k, v in book.items():
        for i in range(1, len(v), 2):
            minutes[k] += count_minutes(v[i], v[i-1])
    
    for k, v in minutes.items():
        answer.append((k, count_fee(v, fees)))
        
    answer.sort()
    result = []
    for a in answer:
        result.append(a[1])
    return result