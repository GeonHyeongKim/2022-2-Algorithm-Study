/*
*  광고 삽입.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/72414
*  Primary idea:   <split, dp>
*                   1. 
*
*  걸린 시간 : 05:00, 53:00
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

import Foundation

// 초 단위의 시각을 hh:mm:ss 형식의 시각으로 변환
func convertTime(_ sec: Int) -> String {
  let h = sec / 3600 < 10 ? "0\(sec / 3600)" : "\(sec / 3600)"
  let m = (sec % 3600) / 60 < 10 ? "0\((sec % 3600) / 60)" : "\((sec % 3600) / 60)"
  let s = (sec % 3600) % 60 < 10 ? "0\((sec % 3600) % 60)" : "\((sec % 3600) % 60)"
  
  return "\(h):\(m):\(s)"
}

// hh:mm:ss 형식을 sec으로 변환
func convertSec(_ time: String) -> Int {
  let split = time.split(separator: ":").map{Int($0)!}
  let (hour, minute, second) = (split[0], split[1], split[2])
  return hour * 3600 + minute * 60 + second
}

func convertLog(_ log: String) -> (Int, Int) {
  let split = log.split(separator: "-").map{String($0)}
  let start = split[0]
  let end = split[1]
  
  return (convertSec(start), convertSec(end))
}

func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
  let play = convertSec(play_time)
  let ad = convertSec(adv_time)
  var _logs = [(Int, Int)]() // start, end
  var dp = [Int](repeating: 0, count: play+1) // play동안 각 초마다 몇 명이 시청했는지 저장
  
  // 계산하기 쉽게 초(sec)로 변경
  for log in logs {
    let info = convertLog(log)
    _logs.append(info)
    dp[info.0] += 1 // 시작 시각에 + 1
    dp[info.1] -= 1 // 종료 시각에 - 1
  }
  
  // 최종적으로 각 초에 몇 명이 시청했는지 누적해서 저장
  for i in 1...play {
    dp[i] += dp[i-1]
  }
  
  var sum = dp[0..<ad].reduce(0, +) // 0~광고까지 - default
  var maxSum = sum // default
  var maxStart = 0 // 정답이 될 변수(항상 정답은 start 중 하나거나, 0)
  
  for i in ad..<play {
    sum += dp[i] - dp[i-ad]
    
    if maxSum < sum {
      maxSum = sum
      maxStart = i-ad+1
    }
  }
  
  return convertTime(maxStart)
}

print(solution("02:03:55", "00:14:15"  , ["01:20:15-01:45:14", "00:40:31-01:00:00", "00:25:50-00:48:29", "01:30:59-01:53:29", "01:37:44-02:02:30"]  ) == "01:30:59" ? "정답" : solution("02:03:55", "00:14:15"  , ["01:20:15-01:45:14", "00:40:31-01:00:00", "00:25:50-00:48:29", "01:30:59-01:53:29", "01:37:44-02:02:30"]  )) // "01:30:59"
