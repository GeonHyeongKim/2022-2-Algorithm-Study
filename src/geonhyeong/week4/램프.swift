/*
*  램프.swift
*  Question Link: https://www.acmicpc.net/problem/1034
*  Primary idea:   구현
*                   1. 행의 전구가 꺼져있고 켜져있는 패턴이 같으면 열단위로 스위치를 조작했을 때 다같이 꺼지고 켜질 것이다.
*                   2. 그렇기 때문에 k번 스위치를 조작하였을때, 다 켜져 있으면서 최대한 동일한 패턴이 많은 행을 찾으면 정답!!
*
*  걸린 시간 :
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let (N, M) = (input[0], input[1])
var board = [[Int]]()

// 입력
for _ in 0..<N {
  let input = Array(readLine()!).map{String($0)}
  board.append(input.map{Int($0)!})
}

let K = Int(readLine()!)!

var answer = 0

for i in board { // 행 탐색
  let zeroCount = i.filter{$0 == 0}.count // 0의 개수 카운트
  
  // 1. 0(꺼져있는)의 개수가 k보다 작거나 같은지 -> 0(꺼져있는 스위치)의 개수보다 k가 작게되면 그 행의 전구를 다 킬 수 있는 방법 X
  // 2. 0(꺼져있는)의 개수와 k가 2로 나눈 나머지가 같다면(둘다 짝/홀일 경우)
  if zeroCount <= K && zeroCount % 2 == K % 2 {
    var cnt = 0
    for j in board { // 첫 for문의 행과 동일한 모양의 행을 찾을 예정
      if j == i { // j와 i가 같다면 카운트에 1을 추가
        cnt += 1
      }
    }
    if cnt > answer { // 최댓값 갱신
      answer = cnt
    }
  }
}

print(answer)
