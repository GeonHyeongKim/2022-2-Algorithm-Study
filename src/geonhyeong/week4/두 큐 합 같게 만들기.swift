/*
*  두 큐 합 같게 만들기.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/118667?language=swift
*  Primary idea:   <최대, 최소>
*                   1. 
*
*  걸린 시간 : 05:00, 53:00
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
  var (q1, q2) = (queue1, queue2)
  var (sum1, sum2) = (queue1.reduce(0, +), queue2.reduce(0, +))
  var (idx1, idx2) = (0, 0)
  let len = queue1.count
  var count = 0

  while count <= (len * 3) {
    if sum1 < sum2 {
      let num = q2[idx2]
      idx2 += 1
      sum1 += num
      sum2 -= num
      q1.append(num)
    } else if sum1 > sum2 {
      let num = q1[idx1]
      idx1 += 1
      sum2 += num
      sum1 -= num
      q2.append(num)
    } else { // sum1 == sum2
      return count
    }
    count += 1
  }
  
  return -1
}

print(solution([3, 2, 7, 2], [4, 6, 5, 1])) // 2
print(solution([1, 2, 1, 2], [1, 10, 1, 2])) // 7
print(solution([1, 1], [1, 5])) // -1
