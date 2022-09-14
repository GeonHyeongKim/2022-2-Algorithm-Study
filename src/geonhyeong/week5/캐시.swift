/*
*  캐시.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/17680
*  Primary idea:   구현
*
*  걸린 시간 :
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

// 같이 원래 있던 도시를 넣으면, cache hit이며 수행시간이 1이 추가되는 것이고
// 새로운 도시를 넣으면, cache miss로 수행시간이 5

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
  if cacheSize == 0 { // 도시들이 추가될 때, 항상 cache miss이므로
    return cities.count * 5
  }
  
  var cache = [String]()
  var time = 0
  
  for city in cities {
    let _city = city.lowercased() // 대소문자 구분을 하지 않는다
    
    if cache.contains(_city) { // 기존에 들어 있으면,
      cache.remove(at: cache.firstIndex(of: _city)!)
      time += 1
    } else { // 새롭게 추가해야한다면,
      if cache.count == cacheSize {
        cache.removeLast()
      }
      time += 5
    }
    cache.insert(_city, at: 0)
  }
  
  return time
}

print(solution(3, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"])) // 50
