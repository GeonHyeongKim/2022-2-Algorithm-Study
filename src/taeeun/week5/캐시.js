function solution(cacheSize, cities) {
    var answer = 0;
    let cache=[]; //캐시 순서는 참조 순

    cities=cities.map(city=>city.toLowerCase());
    
    if (cacheSize===0) return cities.length*5;
    
    for (const city of cities) {
        //캐시에 존재하는지 확인
        const idx=cache.findIndex((c)=>c===city);
        if (idx!==-1) {
            answer+=1;
            //해당 도시를 가장 앞으로
            cache.splice(idx, 1);
            cache.unshift(city);
        }
        else {
            //캐시에 존재 x
            answer+=5;
            if (cache.length>=cacheSize) cache.pop();
            cache.unshift(city);
        }
    }
    return answer;
}
