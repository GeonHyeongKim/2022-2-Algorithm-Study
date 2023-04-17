// 파괴되지 않은 건물
// Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/92344

import Foundation

// 효율성이 있다? 그냥 단순히 생각하면 안된다
func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
	var board = board
	let (row, col) = (board.count, board[0].count)
	var temp = [[Int]](repeating: [Int](repeating: 0, count: col+1), count: row+1)
	
	for s in skill {
		let (type, r1, c1, r2, c2, degree) = (s[0], s[1], s[2], s[3], s[4], s[5])
		temp[r1][c1] += type == 2 ? degree : -degree
		temp[r1][c2 + 1] += type == 2 ? -degree : degree
		temp[r2 + 1][c1] += type == 2 ? -degree : degree
		temp[r2 + 1][c2 + 1] += type == 2 ? degree : -degree
	}
	
	// 행 기준 누적합
	for i in 0..<row {
		for j in 0..<col-1 {
			temp[i][j + 1] += temp[i][j]
		}
	}
	
	// 열 기준 누적합
	for i in 0..<col-1 {
		for j in 0..<row {
			temp[i + 1][j] += temp[i][j]
		}
	}
	
	// 원래 배열과 합
	var answer = 0
	for i in 0..<row {
		for j in 0..<col {
			board[i][j] += temp[i][j]
			
			// 1이상이면
			if board[i][j] > 0 {
				answer += 1
			}
		}
	}
	
	return answer
}

print(solution([[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5]], [[1,0,0,3,4,4],[1,2,0,2,3,2],[2,1,0,3,1,2],[1,0,1,3,3,1]]	))
