/*
*  삼각 달팽이.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/68645
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

func solution(_ n:Int) -> [Int] {
  var board = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
  var num = 1
  
  var (row, col) = (-1, 0)
  
  for i in stride(from: n, through: 1, by: -3) {
    // ↙︎
    if i > 0 {
      for _ in 0..<i {
        row += 1
        board[row][col] = num
        num += 1
      }
    }
    
    // →
    if i - 1 > 0 {
      for _ in 0..<i-1 {
        col += 1
        board[row][col] = num
        num += 1
      }
    }
    
    // ↖︎
    if i - 2 > 0 {
      for _ in 0..<i-2 {
        row -= 1
        col -= 1
        
        board[row][col] = num
        num += 1
      }
    }
  }
  
  return board.flatMap{$0}.filter{$0 != 0}
}
