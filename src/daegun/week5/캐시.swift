func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    var cache: [String] = []    // index가 작을수록 오래된 값
    var time = 0
    
    if cacheSize == 0 {
        return cities.count * 5
    }
    
    for rawCity in cities {
        
        let city = rawCity.lowercased()
        
        // cache hit
        if cache.contains(city) {
            
            time += 1
            
            if city != cache.last! {
                cache.append(cache.remove(at:cache.firstIndex(of: city)!))
            }
            
        // cache miss
        } else {
            
            time += 5
            
            // cahce full
            if cache.count == cacheSize {
                cache.removeFirst()
            }
            
            cache.append(city)
        }
    }
    
    return time
}
