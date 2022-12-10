// 새로운 게임 2.py
// Question Link: https://www.acmicpc.net/problem/17837

import Foundation

// 입력
let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,k) = (nk[0], nk[1])

var chess = [[Int]]()
for _ in 0 ..< n {
	let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
	chess.append(input)
}

var horses = [(Int, Int, Int)]() // 말들의 정보
var horsesInChess = [[[Int]]](repeating: [[Int]](repeating: [], count: n), count: n) // 체스판 위에 말들의 정보 - 3차원 올라탈 수 있음

// 말들의 정보
for i in 0..<k {
	let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
	horses.append((input[0] - 1, input[1] - 1, input[2]))
	horsesInChess[input[0] - 1][input[1] - 1].append(i)
}

let dx = [0, 0, 0, -1, 1] // →, ←, ↑, ↓
let dy = [0, 1, -1, 0, 0]

var result = 0
outerLoop: for cnt in 1...1000 { // 게임 종료 조건 1000번
	// 모든 말 순서대로 이동
	for i in 0..<k {
		var (x, y, d) = horses[i]
		
		var nx = x + dx[d]
		var ny = y + dy[d]
		
		// 1. 영역 밖이거나 파란색
		if (nx < 0 || nx >= n || ny < 0 || ny >= n) || chess[nx][ny] == 2 {
			if d == 1 || d == 3 { // →(우), ↑(상)
				d += 1 // ←(좌), ↓(하)
			} else { // ←(좌), ↓(하)
				d -= 1 // →(우), ↑(상)
			}
			// 말의 이동 방향을 반대로 하고 한 칸 이동
			nx = x + dx[d]
			ny = y + dy[d]
			horses[i].2 = d
			
			// 방향을 반대로 바꾼 후에 이동하려는 칸이 파란색인 경우
			// 또 다시 영역 밖이거나 파란색
			if (nx < 0 || nx >= n || ny < 0 || ny >= n) || chess[nx][ny] == 2 {
				continue
			}
		}
		
		// 2 + 3. 흰색 + 빨간색
		let idx = horsesInChess[x][y].firstIndex(of: i)!
		var tempHorses = Array(horsesInChess[x][y][idx...]) // 말의 위에 다른 말이 있는 경우, 모두 이동
		
		// 빨간색이면 거꾸로 추가
		if chess[nx][ny] == 1 {
			tempHorses.reverse()
		}
		
		// 흰색이면 그대로 추가
		horsesInChess[nx][ny].append(contentsOf: tempHorses)
		
		// 종료 조건
		if horsesInChess[nx][ny].count >= 4 {
			result = cnt
			break outerLoop
		}
		
		// 이동 + 삭제
		for j in tempHorses {
			horses[j].0 = nx
			horses[j].1 = ny
			horsesInChess[x][y].removeLast()
		}
	}
}

// 출력
print(result == 0 ? -1 : result)
