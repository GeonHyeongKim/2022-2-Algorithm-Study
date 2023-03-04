// 일요일 아침의 데이트
// Question Link: https://www.acmicpc.net/problem/1445

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1]) // 세로, 가로
var board = [[Character]]()
let dx = [1, -1, 0, 0]		// 움직일 방향
let dy = [0, 0, 1, -1]
var start = (0, 0)
var end = (0, 0)
var trash = [(Int, Int)]() 	// 쓰레기 위치

for i in 0..<n {
	let row = Array(readLine()!)
	board.append(row)
	
	// 시작, 끝, 쓰레기 위치 저장
	for (j, r) in row.enumerated() {
		if r == "g" {
			trash.append((i, j))
		} else if r == "S" {
			start = (i, j)
		} else if r == "F" {
			end = (i, j) // 쓰이지 않음
		}
	}
}

for t in trash {
	for dir in 0..<4 {
		let nx = t.0 + dx[dir]
		let ny = t.1 + dy[dir]
		
		if 0 > nx || nx >= m || 0 > ny || ny >= n { continue }
		if board[nx][ny] == "F" { continue }
		if board[nx][ny] == "." {
			board[nx][ny] = "#" // 근처를 # 으로 변경
		}
	}
}

var queue = [(0, 0, start.0, start.1)] // 쓰레기 수, 쓰레기 옆에 수, 시작x, 시작y
var visited = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
visited[start.0][start.1] = 1

print(start)
for i in 0..<board.count {
	print(board[i], terminator: " ")
	print()
}

while !queue.isEmpty {
	let first = queue.removeFirst()
	let (t, side, x, y) = (first.0, first.1, first.2, first.3)
	
	for dir in 0..<4 {
		let nx = x + dx[dir]
		let ny = y + dy[dir]
		
		if 0 > nx || nx >= m || 0 > ny || ny >= n { continue }
		if visited[nx][ny] == 1 { continue }
		
		visited[nx][ny] = 1
		
		if board[nx][ny] == "." {
			queue.append((t, side, nx, ny))
		} else if board[nx][ny] == "#" {
			queue.append((t, side+1, nx, ny))
		} else if board[nx][ny] == "g" {
			queue.append((t+1, side, nx, ny))
		} else {
			print(t, side)
			break
		}
		
		// 우선순위 정렬
		queue.sort {
			if $0.0 == $1.0 {
				return $0.1 < $1.1
			} else {
				return $0.0 < $1.0
			}
		}
	}
}

