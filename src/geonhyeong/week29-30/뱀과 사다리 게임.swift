// 뱀과 사다리 게임
// Question Link: https://www.acmicpc.net/problem/16928

let info = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (info[0], info[1]) // 사다리의 수, 뱀의 수
var board = Array(0...101)
var dist = [Int](repeating: 0, count: 100+1)

// 사다리의 정보
for _ in 0..<n {
	let info = readLine()!.split(separator: " ").map{Int($0)!}
	let (x, y) = (info[0], info[1])
	board[x] = y
}

// 뱀의 정보
for _ in 0..<m {
	let info = readLine()!.split(separator: " ").map{Int($0)!}
	let (x, y) = (info[0], info[1])
	board[x] = y
}

func bfs(start:Int) -> Int {
	var queue = [start]
	dist[start] = 0
	
	while !queue.isEmpty {
		let x = queue.removeFirst()
		
		if x == 100 {
			return dist[100]
		}
		
		for dir in x+1..<x+7 where dir <= 100 {
			let nx = board[dir]
			
			if dist[nx] == 0 {
				dist[nx] = dist[x] + 1
				queue.append(nx)
			}
			
		}
	}
	return -1
}

print(bfs(start: 1))
