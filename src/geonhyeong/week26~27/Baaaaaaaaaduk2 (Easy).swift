// Baaaaaaaaaduk2 (Easy)
// Question Link: https://www.acmicpc.net/problem/16988

// 앞의 1~3문단은 문제와 관련없다 = 저항군들이 Baduk2라는 바둑으로 AI를 이겨보려고한다.
// Rule 1: 돌을 2개씩 놓는다.
// Rule 2: 바둑처럼 둘러 쌓이면 죽는다.
// Rule 3: 2개씩 놓기 때문에 역으로 잡는 상황이 발생 = 마지막 이미지 참고
// 결론: 현재 바둑판에서 돌 2개만 두어서 죽일 수 있는 상대 돌의 최대 갯수를 구해달라
// 1이 나의 돌!, 2가 상대방, 0은 공백

let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (input[0], input[1])    	// 세로크기, 가로크기
var board = [[Int]]()
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
var empty = [(Int, Int)]()				// 빈 바둑돌 위치
var AI = [(Int, Int)]()					// AI 바둑돌 위치

// board input
for i in 0..<n {
	let row = readLine()!.split(separator: " ").map{Int($0)!}
	board.append(row)
	
	for j in 0..<row.count {
		if row[j] == 0 {
			empty.append((i, j))		// 상대 바둑돌 위치 저장
		} else if row[j] == 2 {
			AI.append((i, j))
		}
	}
}

var combi = [[(Int, Int)]]()

// 빈 공간에서 2개씩 뽑는 경우
func combination(_ start: Int, _ sub: [(Int, Int)]) {
	if sub.count == 2 {
		combi.append(sub)
		return
	}
	
	for i in start..<empty.count {
		combination(i+1, sub + [(empty[i])])
	}
}

combination(0, [])

func bfs(_ cBoard: [[Int]], _ emptyList: [(Int, Int)]) -> Int {
	var total = 0
	var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n) // 2(AI)를 기준으로 방문처리
	var board = cBoard

	// 빈 공간에 바둑알 놓기
	for empty in emptyList {
		board[empty.0][empty.1] = 1
	}
	
	for posAI in AI {
		if visited[posAI.0][posAI.1] { continue } // 계산한적(방문한적)이 있는 AI 위치 인가?
		
		var queue: [(Int, Int)] = [posAI]
		visited[posAI.0][posAI.1] = true
		var flag = false						  // 계산할 필요없음
		var cnt = 1
		
		while !queue.isEmpty {					  // 여기에 !flag 조건을 주려고하면 틀렸다고 한다..왜지?
			let q = queue.removeFirst()
			let (x, y) = (q.0, q.1)
			
			for dir in 0..<4 {
				let nx = x + dx[dir]
				let ny = y + dy[dir]
				
				if 0 <= nx && nx < n && 0 <= ny && ny < m && !visited[nx][ny] {
					if board[nx][ny] == 0 {
						flag = true
					} else if board[nx][ny] == 2 {
						visited[nx][ny] = true
						cnt += 1
						queue.append((nx, ny))
					}
				}
			}
		}
		
		if !flag {
			total += cnt
		}
	}
	
	return total
}

var answer = 0
for c in combi {
	answer = max(answer, bfs(board, c))
}
print(answer)

