// 두 동전
// Question Link: https://www.acmicpc.net/problem/16197

let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (input[0], input[1])
var board = [[String]]()
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
var coinList = [(Int, Int)]()

for i in 0..<n {
	let row = Array(readLine()!)
	board.append(row.map{String($0)})
	
	for (j, r) in row.enumerated() {
		if r == "o" {		// 2개의 동전 위치 저장
			coinList.append((i, j))
		}
	}
}
	
func bfs(_ firstCoin: (Int, Int), _ lastCoin: (Int, Int)) -> Int {
	var queue = [(Int, Int, Int, Int)]()
	var visited = [[[[Int]]]](repeating: [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: m), count: n), count: m), count: n)
	
	queue.append((firstCoin.0, firstCoin.1, lastCoin.0, lastCoin.1))
	visited[firstCoin.0][firstCoin.1][lastCoin.0][lastCoin.1] = 0 // 방문확인용 & 방문횟수
	
	while !queue.isEmpty {
		let first = queue.removeFirst()
		let (firstR, firstC, lastR, lastC) = (first.0, first.1, first.2, first.3)
		
		// 10번보다 많이 눌러야 할때,
		if visited[firstR][firstC][lastR][lastC] >= 10 {
			break
		}
		
		for dir in 0..<4 {
			var nx = firstR + dx[dir]
			var ny = firstC + dy[dir]
			var nnx = lastR + dx[dir]
			var nny = lastC + dy[dir]
			
			// 두개의 동전이 밖으로 떨어질떄
			if (nx < 0 || nx >= n || ny < 0 || ny >= m) && (nnx < 0 || nnx >= n || nny < 0 || nny >= m ) { continue }
			
			// 둘중 하나만 밖으로 떨어지면
			if (nx < 0 || nx >= n || ny < 0 || ny >= m)  {
				return visited[firstR][firstC][lastR][lastC] + 1
			}
			if (nnx < 0 || nnx >= n || nny < 0 || nny >= m) {
				return visited[firstR][firstC][lastR][lastC] + 1
			}
			
			// 이동할 곳이 벽이면 이동 X
			if board[nx][ny] == "#" {
				nx -= dx[dir]
				ny -= dy[dir]
			}
			if board[nnx][nny] == "#" {
				nnx -= dx[dir]
				nny -= dy[dir]
			}
			
			// 이동 횟수 + 1 & 이동
			if visited[nx][ny][nnx][nny] == -1 {
				visited[nx][ny][nnx][nny] = visited[firstR][firstC][lastR][lastC] + 1
				queue.append((nx, ny, nnx, nny))
			}
		}
	}
	
	return -1
}
	
print(bfs((coinList.first!.0, coinList.first!.1), (coinList.last!.0, coinList.last!.1)))
