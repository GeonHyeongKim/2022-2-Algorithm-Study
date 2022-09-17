/*
*   순위 검색.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/72412
*  Primary idea:   이분 탐색, 조합
*                   1. 
*
*  걸린 시간 : 01:17:26
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

import Foundation

// 이분탐색
func birnarySearch(_ arr: [Int], _ score: Int) -> Int {
  var low = 0
  var high = arr.count
  
  while low < high {
    
    let mid = (low + high) / 2
    if score <= arr[mid] {
      high = mid
    } else {
      low = mid + 1
    }
  }
  
  // low = score 이상의 점수가 처음 등장하는 인덱스
  return arr.count - low
}

// 조합
func combination(_ dic: inout [String:[Int]], _ arr: [String], _ curIdx: Int, _ score: Int) {
  if curIdx == arr.count {
    let key = arr.joined()
    
    // 항목들을 하나의 문자열로 합쳐서 딕셔너리에 점수를 저장
    dic[key, default: []].append(score)
  } else {
    var temp = arr
    
    combination(&dic, temp, curIdx + 1, score)
    temp[curIdx] = "-"
    combination(&dic, temp, curIdx + 1, score)
  }
}

func solution(_ info:[String], _ query:[String]) -> [Int] {
  var dic = [String:[Int]]()
  var answer = [Int]()
  
  // info
  for data in info {
    var _info = data.components(separatedBy: " ")
    let score = Int(_info.removeLast())!
    
    combination(&dic, _info, 0, score)
    print(dic)
  }
  
  // sorted - 이분탐색을 위한 오름차순
  for (query, scores) in dic {
    dic[query] = scores.sorted()
  }
  
  // query
  for q in query {
    var _query = q.components(separatedBy: " ").filter{$0 != "and"}
    let score = Int(_query.removeLast())!
    let key = _query.joined()
    
    if dic[key] == nil { // 해당 조건을 충족하는 점수가 없다면 0
      answer.append(0)
    } else { // 해당 조건을 충족하는 점수 배열이 존재하면, 쿼리의 요구 점수로 이분 탐색
      answer.append(birnarySearch(dic[key]!, score))
    }
  }
  
  return answer
}

print(solution(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"], ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"])) // [1,1,1,1,2,4]
