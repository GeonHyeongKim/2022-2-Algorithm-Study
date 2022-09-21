from collections import defaultdict

def solution(cacheSize, cities):
    answer = 0
    cache = defaultdict()
    
    if cacheSize == 0:
        return len(cities)*5
    
    for clock, city in enumerate(cities):
        city = city.lower()
        if city in cache:
            answer += 1
            cache[city] = clock
        else:
            answer += 5
            if len(cache) < cacheSize:
                cache[city] = clock
            else:
                # LRU
                cacheList = sorted(cache.items(), key=lambda x: x[1])
                del cache[cacheList[0][0]]
                cache[city] = clock
    return answer