// 아기 상어2.swift
// Question Link: https://www.acmicpc.net/problem/17086
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
var board = [[Int]]()

let dx = [-1, 1, 0, 0, -1, -1, 1, 1]
let dy = [0, 0, -1, 1, -1, 1, -1, 1]
var babyShark = [(Int, Int)]()
var answer = 0

// 입력
for x in 0..<r {
	let input = readLine()!.split(separator: " ").map{Int($0)!}
	board.append(input)
	
	// 아기 상어 위치
	for (y, num) in input.enumerated() {
		if num == 1 {
			babyShark.append((x, y))
		}
	}
}

func bfs() {
	while !babyShark.isEmpty {
		let shark = babyShark.removeFirst()
		let (x, y) = (shark.0, shark.1)
		
		for dir in 0..<8 {
			let nx = x + dx[dir]
			let ny = y + dy[dir]
			
			if (0 <= nx && nx < r) && (0 <= ny && ny < c) {
				if board[nx][ny] == 0 {
					board[nx][ny] += board[x][y] + 1
					babyShark.append((nx, ny))
				}
			}
		}
	}
}

bfs()

for x in 0..<r {
	for y in 0..<c {
		answer = max(answer, board[x][y])
	}
}

print(answer - 1)
