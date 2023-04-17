// 무인도여행
// Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/154540

import Foundation

func solution(_ maps:[String]) -> [Int] {
	let dx = [-1, 0, 1, 0]
	let dy = [0, -1, 0, 1]
	let board = maps.map{Array($0)}
	let (row, col) = (board.count, board[0].count)
	var visited = [[Bool]](repeating: [Bool](repeating: false, count: col), count: row)
	var numberList = [(Int, Int)]()
	var answer = [Int]()
	
	for i in 0..<row {
		for j in 0..<col {
			if board[i][j].isNumber {
				numberList.append((i, j))
			}
		}
	}
	
	func bfs(_ x:Int, _ y: Int) -> Int {
		var queue = [(Int, Int)]()
		queue.append((x, y))
		visited[x][y] = true
		var sum = board[x][y].wholeNumberValue!
		
		while !queue.isEmpty {
			let first = queue.removeFirst()
			let (nx, ny) = (first.0, first.1)
			
			for dir in 0..<4 {
				let nnx = nx + dx[dir]
				let nny = ny + dy[dir]
				
				if 0 <= nnx && nnx < row && 0 <= nny && nny < col {
					if !visited[nnx][nny] && board[nnx][nny] != "X" {
						visited[nnx][nny] = true
						queue.append((nnx, nny))
						sum += board[nnx][nny].wholeNumberValue!
					}
				}
			}
		}
		return sum
	}
	
	for (i, j) in numberList {
		if !visited[i][j] {
			let total = bfs(i, j)
			answer.append(total)
		}
	}
	
	return answer.isEmpty ? [-1] : answer.sorted()
}
