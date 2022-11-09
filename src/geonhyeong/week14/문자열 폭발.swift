// 문자열 폭발.swift
// Question Link: https://www.acmicpc.net/problem/9935
// Primary idea:
//                   1.
//
// 걸린 시간 : 15:00
// Time Complexity : O()
// Space Complexity : O()
// Runtime:  ms
// Memory Usage:  MB

import Foundation

let str = String(readLine()!) 	// 전체 문자열
let bomb = String(readLine()!) 	// 폭발 문자열
let bombLen = bomb.count
let bombLast = bomb.last!		// 마지막 문자열
var answer = ""

for char in str {
	answer += String(char)
	
	// 현재 stack(answer)에 넣은 문자가 폭발 문자열의 맨끝문자와 일치하지 않을 경우 pass
	if char != bombLast { continue }
	
	// stack(answer)에서 폭발문자열의 길이만큼 문자열을 추출했을 때, 이 문자열이 폭발문자열과 일치하지 않는 경우 pass
	if answer.suffix(bombLen) != bomb { continue }
	
	let range = answer.index(answer.endIndex, offsetBy: -bombLen)..<answer.endIndex
	answer.removeSubrange(range)
}

if answer == "" {
	print("FRULA")
} else {
	print(answer)
}
