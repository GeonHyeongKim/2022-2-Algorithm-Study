/*
*  주차 요금 계산.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/92341
*  Primary idea:   hash
*                   1. 
*
*  걸린 시간 : 35:56
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

import Foundation

// HH:MM -> Minute
func convertTime(_ time: String) -> Int {
  let _time = time.split(separator: ":").map{Int($0)!}
  return _time[0] * 60 + _time[1]
}

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
  let (defaultTime, defaultFee, standardTime, standardFee) = (fees[0], fees[1], fees[2], fees[3])
  var dic = [String: [Int]]()
  var answer = [Int]()
  let lastMinute = convertTime("23:59")
  
  // info
  for _record in records {
    let record = _record.components(separatedBy: " ")
    let time = record[0]
    let carNum = record[1]
    
    dic[carNum, default: []].append(convertTime(time))
  }
  
  // cal
  for car in dic.sorted(by: {$0.0 < $1.0}) {
    var minute = 0
    
    for i in stride(from: 0, to: car.value.count, by: 2) {
      if i == car.value.count - 1 {
        minute += lastMinute - car.value[i]
      } else {
        minute += car.value[i+1] - car.value[i]
      }
    }
    
    // 요금 계산
    var fee = 0
    if minute > defaultTime {
      if (minute - defaultTime) % standardTime == 0 {
        fee = defaultFee + ((minute - defaultTime) / standardTime) * standardFee
      } else {
        fee = defaultFee + ((minute - defaultTime) / standardTime + 1) * standardFee
      }
    } else {
      fee = defaultFee
    }
    answer.append(fee)
  }
  
  return answer
}

print(solution([180, 5000, 10, 600]  , ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]  )) // [14600, 34400, 5000]
