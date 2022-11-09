// Puyo Puyo.swift
// Question Link: https://www.acmicpc.net/problem/11559
// Primary idea:
//                   1.
//
// 걸린 시간 : 15:00
// Time Complexity : O()
// Space Complexity : O()
// Runtime:  ms
// Memory Usage:  MB

import Foundation

let (row, col) = (12, 6)
var board = [[String]]()
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

// 각 로봇의 초기 위치(x, y좌표 순)및 방향
for _ in 0..<row {
	let input = readLine()!.map{String($0)}
	board.append(Array(input))
}

var answer = 0

// 4칸 확인하는 함수 하나
func bfs(_ x: Int, _ y: Int, _ temp: inout [(Int, Int)], _ visited: inout [[Int]]) {
	var queue = [(Int, Int)]()
	queue.append((x, y))
	temp.append((x, y))
	
	while !queue.isEmpty {
		let info = queue.removeFirst()
		let (_x, _y) = (info.0, info.1)
		
		for i in 0..<4 {
			let nx = _x + dx[i]
			let ny = _y + dy[i]
			
			if 0 <= nx && nx < 12 && 0 <= ny && ny < 6 { // out of index
				if board[nx][ny] == board[x][y] { // 이전 값과 같은지
					if visited[nx][ny] == 0 { // 방문하지 않은 곳인지?
						visited[nx][ny] = 1
						queue.append((nx, ny))
						temp.append((nx, ny))
					}
				}
			}
		}
	}
}


// 4칸 이상일 때 지우는 함수
func delete(_ temp: inout [(Int, Int)]) {
	for (x, y) in temp {
		board[x][y] = "."
	}
}

// 아래로 내리는 함수
func down() {
	for i in 0..<col {
		for j in (0..<row-1).reversed() { // 위에서 아래
			for k in (j..<row).reversed() {
				if board[j][i] != "." && board[k][i] == "." {
					board[k][i] = board[j][i]
					board[j][i] = "."
					break
				}
			}
		}
	}
}

while true {
	var flag = false // 4개 이상이 모여 터졌는지?
	var visited = [[Int]](repeating: [Int](repeating: 0, count: col), count: row)

	for i in 0..<row {
		for j in 0..<col {
			if board[i][j] != "." && visited[i][j] == 0 {
				visited[i][j] = 1
				var temp = [(Int, Int)]()
				bfs(i, j, &temp, &visited)
				
				if temp.count >= 4 {
					flag = true
					delete(&temp)
				}
			}
		}
	}
	
	if !flag {
		break
	}
	
	down()
	answer += 1
//	printAraa()
}

print(answer)

func printAraa() {
	for i in board {
		print(i.joined())
	}
}
