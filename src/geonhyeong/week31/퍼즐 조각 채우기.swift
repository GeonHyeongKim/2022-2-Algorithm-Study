// 퍼즐 조각 채우기
// Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/84021

import Foundation

var visit: [[Bool]] = []
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

// bfs를 통한 도형 위치 추출
func getSquare(_ table: [[Int]], _ r: Int, _ c: Int, option: Int) -> [[Int]] {
	var positions: [(Int, Int)] = []
	var queue: [(Int, Int)] = [(r, c)]
	visit[r][c] = true

	while(!queue.isEmpty) {
		let (r, c) = queue.popLast()!
		positions.append((r, c))
		
		for i in (0...3) {
			let nx = r + dx[i]
			let ny = c + dy[i]
			if nx >= 0 && nx < table.count && ny >= 0 && ny < table[0].count && table[nx][ny] == option && !visit[nx][ny] {
				visit[nx][ny] = true
				queue.append((nx, ny))
			}
		}
	}
	
	return makeSquare(positions)
}

func makeSquare(_ positions: [(Int, Int)]) -> [[Int]] {
	for position in positions {
		
	}
	
	return result
}

func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {
	var answer = 0
	var squares: [[[Int]]] = []
	visit = [[Bool]](repeating: [Bool](repeating: false, count: table[0].count), count: table.count)
		
	// 도형 추출하기
	for x in 0..<table.count {
		for y in 0..<table[0].count {
			if table[x][y] == 1 && !visit[x][y] {
				squares.append(getSquare(table, x, y, option: 1))
			}
		}
	}
	
	return answer
}
