/*
*  베스트 앨범.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/42579
*  Primary idea:   <key-value>
*                   1. 
*
*  걸린 시간 : 05:00, 53:00
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
  var plays = plays
  var dic = [String:[Int]]()
  var result = [Int]()
  
  for (i, genre) in genres.enumerated() {
    dic[genre, default: []].append(plays[i])
  }
  
  // 장르 내에서 많이 재생된 노래
  let dic2 = dic.mapValues{$0.sorted(by:>)} // ["pop": [2500, 600], "classic": [800, 500, 150]]
  // 속한 노래가 많이 재생된 장르
  let dic3 = dic2.sorted(by: {$0.value.reduce(0, +) > $1.value.reduce(0, +)}).map{$0.key} // ["pop", "classic"]
  
  for genre in dic3 {
    var cnt = 0
    for value in dic2[genre]! {
      if cnt == 2 { // 최대 두 개까지
        continue
      }
      
      let index = plays.firstIndex(of: value)!
      result.append(index)
      plays[index] = 0
      cnt += 1
    }
  }
  return result
}

print(solution(["classic", "pop", "classic", "classic", "pop"]  , [500, 600, 150, 800, 2500]  )) // [4, 1, 3, 0]
