/*
*  파일명 정렬.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/17686
*  Primary idea:   <split, 정렬>
*                   1. 
*
*  걸린 시간 : 05:00, 01:05:00
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

func getNumberPos(_ file: String) -> (Int, Int) {
  let _file = Array(file)
  let len = file.count
  var start = 0
  
  for i in 0..<len {
    if _file[i].isNumber { // 처음 숫자 발견
      if i == len { return (i, i) }
      start = i
      for j in i+1..<len {
        if !_file[j].isNumber {
          return (i, j) // 숫자와 문자 발견 위치
        }
      }
      
      break
    }
  }
  
  return (start, len) // tail이 없는 경우
}

func getSplit(_ order: Int, _ file: String) -> (String, Int, String, Int) {
  let lowerFile = file.lowercased() // 소문자로 바꾸기
  let startIndex = file.startIndex
  let (start, end) = getNumberPos(lowerFile)
  let (_start, _end) = (file.index(startIndex, offsetBy: start), file.index(startIndex, offsetBy: end))
  let head = lowerFile[startIndex..<_start]
  let number = lowerFile[_start..<_end]
  let tail = lowerFile[_end..<file.endIndex]
  
  return (String(head), Int(number)!, String(tail), order)
}

func solution(_ files:[String]) -> [String] {
  var _files = [(String, Int, String, Int)]() // head, number, tail, order
  
  for (i, file) in files.enumerated() {
    let split = getSplit(i, file)
    _files.append(split)
  }
  
  let sortedFiles = _files.sorted {
    if $0.0 == $1.0 {
      if $0.1 == $1.1 {
        return $0.3 < $1.3 // order
      } else {
        return $0.1 < $1.1 // number
      }
    } else {
      return $0.0 < $1.0 // head
    }
  }
  
  var answer = [String]()
  for i in 0..<sortedFiles.count {
    let index = sortedFiles[i].3
    let file = files[index]
    answer.append(file)
  }
  
  return answer
}

//print(solution(["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"]) == ["img1.png", "IMG01.GIF", "img02.png", "img2.JPG", "img10.png", "img12.png"] ? "정답" : solution(["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"])) // ["img1.png", "IMG01.GIF", "img02.png", "img2.JPG", "img10.png", "img12.png"]
//
//print(solution(["F-5 Freedom Fighter", "B-50 Superfortress", "A-10 Thunderbolt II", "F-14 Tomcat"]) == ["A-10 Thunderbolt II", "B-50 Superfortress", "F-5 Freedom Fighter", "F-14 Tomcat"] ? "정답" : solution(["F-5 Freedom Fighter", "B-50 Superfortress", "A-10 Thunderbolt II", "F-14 Tomcat"])) // ["A-10 Thunderbolt II", "B-50 Superfortress", "F-5 Freedom Fighter", "F-14 Tomcat"]

print(solution(["foo9.txt", "foo010bar020.zip", "F-15"]))
