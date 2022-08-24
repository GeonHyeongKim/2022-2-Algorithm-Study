#
#  3-3.swift
#  Question Link:
#  Primary idea:   
#
#  시간 : 약 1시간
#  Time Complexity : O()
#  Space Complexity : O()
#  Runtime:  ms
#  Memory Usage:  MB
#

import Foundation

func solution(_ distance: Int, _ scope: [[Int]], _ times: [[Int]]) -> Int {
  var answer = distance
  
  for (_scope, _times) in zip(scope, times) {
    let (start, end) = (_scope[0], _scope[1])
    let (work, rest) = (_times[0], _times[1])
    
    // scope[i]는 정렬되어 있지 않을 수 있음
    let _start = min(start, end)
    let _end = max(start, end)
    
    for i in _start..._end {
      let cycle = work + rest
      let na = i % cycle
      
      print(i, "cycle = \(cycle)", "na = \(na)", "work = \(work)")
      if na <= work && na != 0 { // na <= work 라는 것은 근무시간에 걸림, na == 0이라는 것은 휴식시간 마지막에 걸려 통과
        answer = min(answer, i)
      }
    }
  }
  
  return answer
}

print(solution(10, [[3, 4], [5, 8]], [[2, 5], [4, 3]])) // 8
//print(solution(12, [[7, 8], [4, 6], [11, 10]], [[2, 2], [2, 4], [3, 3]])) // 12
