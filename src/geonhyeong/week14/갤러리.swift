// 갤러리.swift
// Question Link: https://www.acmicpc.net/problem/2115
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
let (row, col) = (input[0], input[1])
var board = [[String]]()
var visited = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: col), count: row), count: 4)
var answer = 0

// 방형
let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

// 입력
for _ in 0..<row {
	let input = readLine()!
	board.append(Array(input).map{String($0)})
}

func check(_ x: Int, _ y: Int) {
	
	// pattern 0, 1
	if board[x+1][y] == "." {
		// pattern 0
		if board[x][y-1] == "X" && board[x+1][y-1]  == "X" && !visited[0][x][y] {
			visited[0][x][y] = true
			visited[0][x+1][y] = true
			answer += 1
		}
		
		// pattern 1
		if board[x][y+1] == "X" && board[x+1][y+1]  == "X" && !visited[1][x][y] {
			visited[1][x][y] = true
			visited[1][x+1][y] = true
			answer += 1
		}
	}
	
	// pattern 2, 3
	if board[x][y+1] == "." {
		// pattern 2
		if board[x-1][y] == "X" && board[x-1][y+1]  == "X" && !visited[2][x][y] {
			visited[2][x][y] = true
			visited[2][x][y+1] = true
			answer += 1
		}
		
		// pattern 3
		if board[x+1][y] == "X" && board[x+1][y+1]  == "X" && !visited[3][x][y] {
			visited[3][x][y] = true
			visited[3][x][y+1] = true
			answer += 1
		}
	}
}

for x in 1..<row-1 {
	for y in 1..<col-1 {
		if board[x][y] == "." {
			check(x, y)
		}
	}
}

print(answer)
