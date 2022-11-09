// 문자열 잘라내기.swift
// Question Link: https://www.acmicpc.net/problem/2866
// Primary idea:
//                   1.
//
// 걸린 시간 : 15:00
// Time Complexity : O()
// Space Complexity : O()
// Runtime:  ms
// Memory Usage:  MB

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let (r, c) = (input[0], input[1])
var board = [String]()

// 입력
for _ in 0..<r {
	let input = readLine()!
	board.append(input)
}
