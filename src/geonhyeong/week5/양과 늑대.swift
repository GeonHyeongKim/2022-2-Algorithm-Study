/*
*  양과 늑대.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/92343
*  Primary idea:   완전탐색, dfs
*                   1. 
*
*  걸린 시간 : 05:00, 53:00
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

import Foundation

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
  var graph = [Int: [Int]]()  // 단방향 그래프 생성
  var maxSheep = 0            // 양의 수
  
  // 단방향 그래프 생성
  for edge in edges {
    graph[edge[0], default: []].append(edge[1])
  }
  
  func dfs(_ wolf: Int, _ sheep: Int, _ visitedNode: [Int]) {
    for node in visitedNode { // 매번 당장 이동할 수 있는 노드만을 전달
      let nextWolf = wolf + info[node]
      let nextSheep = sheep + (info[node] ^ 1)
      
      if nextSheep <= nextWolf { continue } // backTracking
      
      maxSheep = max(maxSheep, nextSheep) // 최대 양 수
      
      //지금 방문할 수 있는 노드
      var visitedNode = visitedNode
      let curIndex = visitedNode.firstIndex(of: node)!
      visitedNode.remove(at: curIndex)                  // 자기 자신으로는 못가기 때문에 제외
      visitedNode.append(contentsOf: graph[node] ?? []) // 기존 + 현재 노드와 연결된 노드
      dfs(nextWolf, nextSheep, visitedNode)
    }
  }
  
  dfs(0, 0, [0])
  return maxSheep
}

print(solution([0,0,1,1,1,0,1,0,1,0,1,1], [[0,1],[1,2],[1,4],[0,8],[8,7],[9,10],[9,11],[4,3],[6,5],[4,6],[8,9]])) // 5
//print(solution([0,1,0,1,1,0,1,0,0,1,0], [[0,1],[0,2],[1,3],[1,4],[2,5],[2,6],[3,7],[4,8],[6,9],[9,10]])) // 5


