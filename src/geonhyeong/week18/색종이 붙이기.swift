// 색종이 붙이기.swift
// Question Link: https://www.acmicpc.net/problem/17136

var board = [[Int]]()

for _ in 1...10 {
	let row = readLine()!.split(separator: " ").map{Int($0)!}
	board.append(row)
}

var paperType = [Int](repeating: 5, count: 6) // 1~5크기가 5장씩
var answer = Int.max

func canAttach(_ x: Int, _ y: Int, _ size: Int) -> Bool {
	for _x in x..<x+size {
		for _y in y..<y+size {
			if _x < 0 || _x >= 10 || _y < 0 || _y >= 10 || board[_x][_y] == 0 {
				return false
			}
		}
	}
	return true
}

func attach(_ x: Int, _ y: Int, _ size: Int, _ isAttach: Int) {
	for _x in x..<x+size {
		for _y in y..<y+size {
			board[_x][_y] = isAttach
		}
	}
}

func dfs(_ x: Int, _ y: Int, _ cnt: Int) {
	if y >= 10 { // 마지막 지점에 도착했을 때
		answer = min(answer, cnt)
		return
	}
	
	if x >= 10 { // 완탐시 줄바꿈이 필요할 때
		dfs(0, y+1, cnt)
		return
	}
	
	var maxSize = 0
	
	// 탐색하다가 색종이를 붙일 수 있는 지점을 만나면
	if board[x][y] == 1 {
		
		// 붙일 수 있는 가장 큰 색종이의 크기
		for size in (1...5).reversed() {
			if canAttach(x, y, size) {
				maxSize = size
				break
			}
		}
		
		// 가장 큰 사이즈의 색종이부터 붙여보기
		for size in (maxSize...5).reversed() {
			if paperType[size] > 0 {
				attach(x, y, size, 0) 	// 색종이를 붙임
				paperType[size] -= 1	// 횟수 +1
				dfs(x, y, cnt+1)
				attach(x, y, size, 1) 	// 색종이를 땜
				paperType[size] += 1	// 횟수 -1
			}
		}
				
	} else { // board[x][y] == 0
		dfs(x+1, y, cnt) // 색종이를 붙일 수 없는 지점이면 탐색
	}
}

dfs(0, 0, 0)

if answer == Int.max {
	print(-1)
} else {
	print(answer)
}
