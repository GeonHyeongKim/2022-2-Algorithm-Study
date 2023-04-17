// 십자가 2개 놓기
// Question Link: https://www.acmicpc.net/problem/17085

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (input[0], input[1])
var board = [[String]]()
let dx = [0, 0, 1, -1] // 위, 아래, 오른쪽, 왼쪽
let dy = [1, -1, 0, 0]
var info = [(size:Int, x:Int, y:Int)]() // size, x, y - 크기와 위치 정보

// 저장
for _ in 0..<n {
	let row = Array(readLine()!).map{String($0)}
	board.append(row)
}

// 추출
for i in 0..<n {
	for j in 0..<m {
		if board[i][j] == "#" { // 만들어질 수 있는 모든 십자가 탐색
			var size = 0 // 십자가 중심으로부터의 거리??
			
			// 1. i, j에 size만큼을 증감했을때 범위(n, m) 내에 있어야하고
			// 2. 그 범위의 값들이 모두 #일때
			while (0 <= i-size && i+size < n) && (0 <= j-size && j+size < m)
					&& (board[i-size][j] == "#") && (board[i+size][j] == "#")
					&& (board[i][j-size] == "#") && (board[i][j+size] == "#") {
				size += 1
				info.append((size:size, x:i, y:j))
			}
		}
	}
}

var answer = 0 // max 값

// 완전 탐색
for i in 0..<info.count - 1 {
	for j in i+1..<info.count {
		var flag = true
		let base = 1 + (info[i].size - 1) * 4 // +1은 가운데 중심, *4는 4가지 방향
		let other = 1 + (info[j].size - 1) * 4
		let score = base * other
		
		if score > answer {
			var newBoard = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n) // 확인용
			
			// for문을 각 size만큼 돌리기
			// 겹치는지 확인
			for k in 0..<info[i].size {
				for dir in 0..<4 {
					let nx1 = info[i].x + dx[dir] * k
					let ny1 = info[i].y + dy[dir] * k
					newBoard[nx1][ny1] = true
				}
			}
			
			for k in 0..<info[j].size {
				for dir in 0..<4 {
					let nx2 = info[j].x + dx[dir] * k
					let ny2 = info[j].y + dy[dir] * k
					
					if newBoard[nx2][ny2] { // 앞에서 계산한 적이 있다 (겹쳐진다)
						flag = false
					}
				}
			}
			
			if flag { // 안겹칩
				answer = score
			}
		}
		
	}
}

print(answer)
