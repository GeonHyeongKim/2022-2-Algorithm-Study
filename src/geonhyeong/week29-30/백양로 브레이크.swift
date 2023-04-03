// 백양로 브레이크
// Question Link: https://www.acmicpc.net/problem/11562

let info = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (info[0], info[1]) // 건물의 수, 길의 수
var road = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n) // 뒤집어야 하는 수

for i in 0..<n {
	road[i][i] = 0
}

for _ in 0..<m {
	let info = readLine()!.split(separator: " ").map{Int($0)!}
	let (u, v, b) = (info[0]-1, info[1]-1, info[2]) // start, end, isConnect
	
	if b == 1 {
		road[u][v] = 0
		road[v][u] = 0
	} else {
		road[u][v] = 0
		road[v][u] = 1
	}
}

// 플로이드 와샬
for k in 0..<n {
	for i in 0..<n {
		for j in 0..<n {
			if road[i][k] == Int.max || road[k][j] == Int.max { continue }
			if road[i][k]+road[k][j] < road[i][j] {
				road[i][j] = road[i][k]+road[k][j]
			}
		}
	}
}

// 질문
for _ in 0..<Int(readLine()!)! {
	let info = readLine()!.split(separator: " ").map{Int($0)!}
	let (start, end) = (info[0]-1, info[1]-1)
	print(road[start][end])
}
