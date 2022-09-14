/*
*  불량 사용자.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/64064
*  Primary idea:   dfs, 완탐
*                   1. 
*
*  걸린 시간 :
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
  var candidate = [[String]]() // 불량 사용자 후보 저장할 배열
  var set = Set<[String]>()
  
  for ban in banned_id {
    var temp = [String]()
    
    for user in user_id {
      if user.count == ban.count {
        var count = 0 // 일치하는 갯수
        
        for i in 0..<user.count {
          let index = ban.index(ban.startIndex, offsetBy: i)
          
          if ban[index] == "*" || ban[index] == user[index] {
            count += 1
          } else {
            break
          }
        }
        
        if count == ban.count { // 일치할 경우
          temp.append(user)
        }
      }
    }
    
    candidate.append(temp)
  }
  
  // 조합구하기
  func dfs(_ i: Int, _ subStr: [String]) {
    if subStr.count == banned_id.count {
      set.update(with: subStr.sorted())
      return
    }
        
    for c in candidate[i] {
      if subStr.contains(c) {
        continue
      }
      
      dfs(i+1, subStr + [c])
    }
  }
  
  dfs(0, [])
  
  return set.count
}

//print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "abc1**"])) // 2
//print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["*rodo", "*rodo", "******"])) // 2
//print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "*rodo", "******", "******"])) // 3
