/*
*  자물쇠와 열쇠.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/60059
*  Primary idea:   완전탐색, 구현
*                   1. 
*
*  걸린 시간 : 05:00, 53:00
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
  var board = [[Int]](repeating: Array(repeating: 0, count: lock.count * 3), count: lock.count * 3) // Lock이 3*3 이라면 3배로 9*9
  var key = key
  
  for y in lock.count..<(lock.count * 2) {
    for x in lock.count..<(lock.count * 2) {
      board[y][x] = lock[y - lock.count][x - lock.count]
    }
  }
  
  if checkFit(board, lock) { return true }
  
  let cnt = key.count - 1
  for _ in 0..<4 { // 전체 탐색을 해버리고 90씩, 4번 돌려주는게 전부
    for y in 1...lock.count + cnt {
      for x in 1...lock.count + cnt {
        if moveKey(x: x, y : y, board, key, lock) {
          return true
        }
      }
    }
    key = rotateKey(key)
  }
  
  return false
}

// 새로 만들어준 보드에 숫자를 넣고 서로 더하기
func moveKey( x : Int, y : Int,_ board : [[Int]],_ key : [[Int]],_ lock : [[Int]]) -> Bool{
  var tempBoard = board
  let ystart = (lock.count - key.count + y)
  let xstart = (lock.count - key.count + x)
  var y = 0
  
  for row in ystart..<ystart + key.count{
    var x = 0
    
    for col in xstart..<xstart + key.count{
      tempBoard[row][col] += key[y][x]
      x += 1
    }
    
    y += 1
  }
  
  return checkFit(tempBoard, lock)
}

// 자물쇠로 열수 있는지 없는지 확인
func checkFit(_ board : [[Int]],_ lock :[[Int]]) -> Bool{
  for x in lock.count..<(lock.count * 2){
    for y in lock.count..<(lock.count * 2){
      if board[x][y] == 2 || board[x][y] == 0 { // 더했을때 2: 튀어나온 부분, 0: 비어있다는 것
        return false
      }
    }
  }
  
  return true
}

// 회전
func rotateKey(_ key : [[Int]]) -> [[Int]]{
  let keysize = key.count - 1
  var tempKey = [[Int]](repeating: Array(repeating: 0, count: key.count), count: key.count)
  
  for y in 0..<key.count {
    for x in 0..<key.count {
      tempKey[x][keysize - y] = key[y][x]
    }
  }
  
  return tempKey
}
