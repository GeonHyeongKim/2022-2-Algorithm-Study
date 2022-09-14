/*
*   프렌즈4블록.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/17679
*  Primary idea:   완탐
*                   1. 
*
*  걸린 시간 : 
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
  var _board = board.map {Array($0).map {String($0)}}
  
  // 사각형(2x2)이 되는지 확인
  func isSquare(_ row: Int, _ col: Int) -> Bool {
    guard case let leftTop = _board[row][col], leftTop != "" else { // 비어 있을 경우
      return false
    }
    
    return _board[row][col + 1] == leftTop && _board[row + 1][col] == leftTop && _board[row + 1][col + 1] == leftTop
  }
  
  // 검사가 끝날때까지 무한 반복
  while true {
    var posList = [(row: Int, col:Int)]() // 사각형(2x2)이 되는 (row, col)
    
    // 사각형(2x2)의 leftTop 찾기
    for row in 0..<m-1 {
      for col in 0..<n-1 {
        if isSquare(row, col) {
          posList.append((row, col))
        }
      }
    }
    
    if posList.count == 0 { break }
    
    // 사각형(2x2) 빈칸으로 변경
    for pos in posList {
      _board[pos.row][pos.col] = ""
      _board[pos.row][pos.col+1] = ""
      _board[pos.row+1][pos.col] = ""
      _board[pos.row+1][pos.col+1] = ""
    }
    
    // 빈공간 채우기
    for col in 0..<n {
      for row in 1..<m { // 첫번쨰 행은 할 필요없음
        if _board[row][col] == "" {
          for _row in (1...row).reversed() {
            _board[_row][col] = _board[_row-1][col]
            _board[_row-1][col] = ""
          }
        }
      }
    }
  }

  return _board.reduce(0, {$0 + $1.filter {$0 == ""}.count})
}

//print(solution(4, 5, ["CCBDE", "AAADE", "AAABF", "CCBBF"]  )) // 14
//print(solution(6, 6, ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMF", "TMMTTJ"])) // 15
//print(solution(10, 10, ["DDABBAABBA","AAAAAABBBA","DDACCBBBAA","DDABBBBBAA","AAABBABBBA","CCADDAABBB","CCADDAABBB","BBACCABBBA","BBAAABBBAA","DDABBBBAAA"])) // 86
//print(solution(8, 5, ["HGNHU", "CRSHV", "UKHVL", "MJHQB", "GSHOT", "MQMJJ", "AGJKK", "QULKK"]))// 8
