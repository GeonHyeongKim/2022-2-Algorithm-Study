/*
*  수식 최대화.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/67257
*  Primary idea:   dfs 조합
*                   1. 
*
*  걸린 시간 : 33:00
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

import Foundation

var numbers = [Int]()
var operands = [Character]()

func solution(_ expression:String) -> Int64 {
  var answer = 0
  var priorityList = [[String]]()
  var visited = [Bool](repeating: false, count: 3)
  
  getPriority(&priorityList, &visited, [], ["+","-","*"]) // 6가지 경우
  
  numbers = expression.components(separatedBy: ["+","-","*"]).map{Int($0)!}
  operands = Array(expression.filter({!$0.isNumber}))
  
  for priority in priorityList {
    var copyNumbers = numbers
    var copyOperands = operands
    for p in priority {
      var i = -1
      while i < copyOperands.count - 1 {
        i += 1
        if p == String(copyOperands[i]) {
          let cal = calculation(copyNumbers.remove(at: i), copyNumbers.remove(at: i), copyOperands[i])
          copyNumbers.insert(cal, at: i)
          copyOperands.remove(at: i)
          i -= 1
        }
      }
    }
    
    answer = max(answer, abs(copyNumbers.first!))
  }
  
  return Int64(answer)
}

func calculation(_ base: Int, _ other: Int, _ oper: Character) -> Int {
  switch oper {
  case "+": return base + other
  case "-": return base - other
  case "*": return base * other
  default: return 0
  }
}

func getPriority(_ priority: inout [[String]], _ visited: inout [Bool], _ cur: [String], _ operand: [String]) {
  if cur.count == 3 {
    priority.append(cur)
    return
  }
  
  for i in 0..<3 {
    if !visited[i] {
      visited[i] = true
      getPriority(&priority, &visited, cur + [operand[i]], operand)
      visited[i] = false
    }
  }
}

print(solution("100-200*300-500+20")) // 60420
