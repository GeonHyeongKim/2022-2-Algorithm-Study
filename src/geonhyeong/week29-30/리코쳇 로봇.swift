// 리코쳇 로봇
// Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/169199

import Foundation

func solution(_ board:[String]) -> Int {
	let dx = [-1, 0, 1, 0]
	let dy = [0, -1, 0, 1]
	var start = (0, 0)
	let (row, col) = (board.count, board[0].count)
	var _board = [[String]]()
	
	for b in board {
		_board.append(Array(b).map{String($0)})
	}
	
	// 시작, 끝 위치 추출
	for (i, row) in board.enumerated() {
		for (j, col) in row.enumerated() {
			if col == "R" {
				start = (i, j)
			}
		}
	}
	
	func bfs() -> Int {
		var queue = [(Int, Int)]() // (x_Pos, y_Pos)
		queue.append((start.0, start.1))
		var dist = [[Int]](repeating: [Int](repeating: -1, count: col), count: row)
		dist[start.0][start.1] = 0
		
		while !queue.isEmpty {
			var first = queue.removeFirst()
			let (x, y) = (first.0, first.1)
			
			if _board[x][y] == "G" {
				return dist[x][y]
			}
			
			for dir in 0..<4 {
				var nx = x
				var ny = y
				
				while true {
					nx += dx[dir]
					ny += dy[dir]
					
					if !(0 <= nx && nx < row) || !(0 <= ny && ny < col) {
						nx -= dx[dir]
						ny -= dy[dir]
						break
					}
					
					if _board[nx][ny] == "D" {
						nx -= dx[dir]
						ny -= dy[dir]
						break
					}
				}
				
				if dist[nx][ny] == -1 {
					dist[nx][ny] = dist[x][y] + 1
					queue.append((nx, ny))
				}
			}
		}
		
		return -1
	}
	
	return bfs()
}
