/*
*  보석 쇼핑.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/67258
*  Primary idea:   <>
*                   1. 
*
*  걸린 시간 : 
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

import Foundation

func solution(_ gems:[String]) -> [Int] {
  let setCnt = Set(gems).count
  if setCnt == 1 {
    return [1, 1]
  }
  
  var answer = [Int]()

  var dic = [String:Int]()
  var diff = Int.max
  
  var (start, end) = (0, 0)
  
  while end < gems.count {
    if let _ = dic[gems[start]] { // key 값이 있을 경우
      if dic.count == setCnt { // 모든 종류의 gem이 있을 경우
        if end - start < diff { // 더
          diff = end - start
          answer = [start + 1, end + 1]
        }
        
        dic[gems[start]]! -= 1
        if dic[gems[start]] == 0 {
          dic[gems[start]] = nil
        }
        start += 1
      } else {
        if let _ = dic[gems[end]] { // end(끝)에 있는 gem 추가
          dic[gems[end]]! += 1
          end += 1
        } else {
          dic[gems[end]] = 0
        }
      }
      
    } else { // key 값이 없을 경우
      dic[gems[start]] = 0
    }
  }
  
  return answer
}

print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"])) //   [3, 7]
print(solution(["AA", "AB", "AC", "AA", "AC"])) //   [1, 3]
print(solution(["XYZ", "XYZ", "XYZ"])) // [1, 1]
//print(solution(["ZZZ", "YYY", "NNNN", "YYY", "BBB"])) // [1, 5]
