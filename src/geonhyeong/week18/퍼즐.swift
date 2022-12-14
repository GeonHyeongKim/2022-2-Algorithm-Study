// 퍼즐.swift
// Question Link: https://www.acmicpc.net/problem/1525

var board = [[Int]]()
var start = [Int]()

for _ in 1...3 {
	let row = readLine()!.split(separator: " ").map{Int($0)!}
	board.append(row)
}

var boardDist = [[[Int]]:Int]()
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
var index = 0 // 시간초과 방지

func bfs() -> Bool {
	var queue = [[[Int]]]()
	boardDist[board] = 0

	queue.append(board)

	while index < queue.count {
		var info = queue[index]
		index += 1

		// 종료 조건
		if info == [[1,2,3],[4,5,6],[7,8,0]] {
			print(boardDist[info]!)
			return false
		}
		var x = 0, y = 0
		
		// 0의 위치 찾기
		for i in 0..<3 {
			for j in 0..<3 {
				if info[i][j] == 0 {
					x = i
					y = j
				}
			}
		}
		
		for i in 0..<4 {
			let nx = x + dx[i]
			let ny = y + dy[i]
			
			// out of boundary
			if nx < 0 || nx > 2 || ny < 0 || ny > 2 { continue }
			
			var tempInfo = info
			
			// switch
			let tmp = tempInfo[nx][ny]
			tempInfo[nx][ny] = tempInfo[x][y]
			tempInfo[x][y] = tmp
			
			if boardDist[tempInfo] == nil {
				boardDist[tempInfo] = boardDist[info]! + 1
				queue.append(tempInfo)
			}
			
		}
	}
	return true
}

if bfs() {
	print(-1)
}
