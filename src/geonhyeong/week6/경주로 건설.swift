/*
*  경주로 건설.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/67259
*  Primary idea:   다익스트라
*                   1. 
*
*  걸린 시간 : 15:00
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

import Foundation

func solution(_ board:[[Int]]) -> Int {
  let row = board.count
  let col = board[0].count
  let dx = [-1, 0, 1, 0]
  let dy = [0, -1, 0, 1]
  var dist = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: Int.max, count: 4), count: 25), count: 25)
  var queue = [Point]()
  
  // 초기화 - dist[x][y][direction]
  dist[0][0][0] = 0
  dist[0][0][1] = 0
  dist[0][0][2] = 0
  dist[0][0][3] = 0
  
  // 초기화
  queue.append(Point(x: 0,y: 0,cost: 0,direction: 0))
  queue.append(Point(x: 0,y: 0,cost: 0,direction: 1))
  queue.append(Point(x: 0,y: 0,cost: 0,direction: 2))
  queue.append(Point(x: 0,y: 0,cost: 0,direction: 3))
  
  // 다익스트라
  while !queue.isEmpty {
    let cur = queue.removeFirst()
    let (x, y, cost, dir) = (cur.x, cur.y, cur.cost, cur.direction)
    
    for i in 0..<4 {
      let nx = x + dx[i]
      let ny = y + dy[i]
      
      // 방금 왔던 칸으로 돌아가는 경우
      if abs(dir - i) == 2 { continue }
      
      // out of range
      if nx < 0 || ny < 0 || nx >= row || ny >= col { continue }
      
      // 벽인 경우
      if board[x][y] == 1 { continue }
      
      var curCost = 0
      if dir == i { // 직진인 경우
        curCost = 100
      } else { // 곡선인 경우
        curCost = 600
      }
      
      let nextCost = cost + curCost
      if dist[nx][ny][i] > nextCost {
        dist[nx][ny][i] = nextCost
        queue.append(Point(x: nx, y: ny, cost: nextCost, direction: i))
      }
    }
  }
  
  return dist[row-1][col-1].min()!
}

struct Point {
  let x: Int
  let y: Int
  let cost: Int
  let direction: Int
  
  init(x: Int, y: Int, cost: Int, direction: Int) {
    self.x = x
    self.y = y
    self.cost = cost
    self.direction = direction
  }
}

print(solution([[0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0],[0,0,0,0,0,1,0,0],[0,0,0,0,1,0,0,0],[0,0,0,1,0,0,0,1],[0,0,1,0,0,0,1,0],[0,1,0,0,0,1,0,0],[1,0,0,0,0,0,0,0]])) // 3800
