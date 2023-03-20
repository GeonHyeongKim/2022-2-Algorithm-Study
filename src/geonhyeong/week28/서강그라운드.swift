// 서강그라운드
// Question Link: https://www.acmicpc.net/problem/14938

let input = readLine()!.split(separator: " ").compactMap{Int($0)}
let (n, m, r) = (input[0], input[1], input[2]) // 지역의 개수, 수색범위, 길의 개수

let items = readLine()!.split(separator: " ").compactMap{Int($0)} // 각 구역에 있는 아이템의 수
var board = [[Int]](repeating: [Int](repeating: 16, count: n), count: n)

// 자기 자신에게 가는 가중치 0
for i in 0..<n {
	board[i][i] = 0
}

// 입력에 따른 가중치 저장
for _ in 0..<r {
	let data = readLine()!.split(separator: " ").compactMap{Int($0)}
	let (a, b, l) = (data[0]-1, data[1]-1, data[2])
	
	board[a][b] = l
	board[b][a] = l
}

// 플로이드 와샬
for k in 0..<n {
	for i in 0..<n {
		for j in 0..<n {
			if board[i][k] + board[k][j] < board[i][j] {
				board[i][j] = board[i][k] + board[k][j]
			}
		}
	}
}

var answer = 0

for i in 0..<n {
	var sum = 0
	
	for j in 0..<n {
		if board[i][j] <= m {
			sum += items[j]
		}
	}
	
	answer = max(answer, sum)
}

print(answer)
