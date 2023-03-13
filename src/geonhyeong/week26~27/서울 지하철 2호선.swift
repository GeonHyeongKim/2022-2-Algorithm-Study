// 서울 지하철 2호선
// Question Link: https://www.acmicpc.net/problem/16947

import Foundation

var n = Int(readLine()!)!
var station = [[Int]](repeating: [Int](repeating: 0, count: n), count: n) // 역과 역을 연결하는 구간의 정보
var cycle = [Bool](repeating: false, count: n) // 순환역을 표시하는 전체역
var visited = [Bool](repeating: false, count: n)
var dist = [Int](repeating: 0, count: n)

// 역 구간 정보 입력
for _ in 0..<n {
	let info = readLine()!.split(separator: " ").map{Int($0)!}
	let (start, end) = (info[0] - 1, info[1] - 1)
	station[start].append(end)
	station[end].append(start)
}

// 순환선 확인
for i in 0..<n {
	visited = [Bool](repeating: false, count: n) // 초기화
	dfs(i, i, 0)
}

// 역 거리 확인
for i in 0..<n {
	if !cycle[i] {
		dist[i] = bfs(i)
	} else {
		dist[i] = 0
	}
}

print(dist.map{String($0)}.joined(separator: " "))


// 순환선 확인 dfs 함수
func dfs(_ start: Int, _ cur: Int, _ depth: Int) {
	if cur == start && depth >= 2 { // 현재 역이 시작 역으로 돌아오고, 방문한 역이 2곳 이상이면
		print(cur, cycle)
		cycle[cur] = true			// 순환선으로 표시
		return
	}
	
	visited[cur] = true
	
	for next in station[cur] {
		if !visited[next] { // 아직 방문하지 않은 역이라면
			dfs(start, next, depth+1)
		} else if next == start && depth >= 2  { // 이미 방문한 역이고, 방문한 역이 2곳 이상이라면
			dfs(start, next, depth)  // 방문하는 역을 그대로 재귀
		}
	}
}

// 역과 순환역 사이의 거리를 확인하는 bfs 함수
func bfs(_ cur: Int) -> Int {
	visited = [Bool](repeating: false, count: n) // 초기화
	var queue = [(Int, Int)]() // 역, 거리
	queue.append((cur, 0))
	
	while !queue.isEmpty {
		let first = queue.removeFirst()
		
		if cycle[first.0] {
			return first.1
		}
		
		for i in station[first.0] {
			if !visited[i] {
				visited[i] = true
				queue.append((i, first.1 + 1))
			}
		}
	}
	return 0
}

///////////////////////////
//let n = Int(readLine()!)!
//var graph = Array(repeating: [Int](), count: n+1)
//var visited = Array(repeating: false, count: n+1)
//var cycle = Array(repeating: false, count: n + 1)
//var dist = Array(repeating: 0, count: n + 1)
//
//// 순환선?
//func dfs(depth: Int, startIdx: Int, currentIdx: Int) {
//	if currentIdx == startIdx && depth >= 2 {
//		cycle[currentIdx] = true
//		return
//	}
//	visited[currentIdx] = true
//
//	for i in graph[currentIdx] {
//		if !visited[i] {
//			dfs(depth: depth+1, startIdx: startIdx, currentIdx: i)
//		} else { //이미 방문한 역이라면
//			if depth >= 2, startIdx == i {
//				dfs(depth: depth, startIdx: startIdx, currentIdx: i)
//			}
//		}
//	}
//}
//
//// 순환선 아닌애들 dfs돌려서 dist 찾아줘
//func bfs(x: Int) -> Int {
//	var bfsVisited = Array(repeating: false, count: 3001)
//	var queue = [[Int]]()
//	queue.append([x, 0])
//	while !queue.isEmpty {
//		let pop = queue.removeFirst()
//		if cycle[pop[0]] {  // 사이클에 포함 -> 사이클에 도달한거임
//			return pop[1]
//		}
//		for i in graph[pop[0]] {
//			if !bfsVisited[i] {
//				queue.append([i, pop[1] + 1])
//				bfsVisited[i] = true
//			}
//		}
//	}
//	return 0
//}
//
//for _ in 0..<n {
//	let a = readLine()!.split(separator: " ").map{ Int(String($0))! }
//	graph[a[0]].append(a[1])
//	graph[a[1]].append(a[0])
//	graph[a[0]].sort()
//	graph[a[1]].sort()
//}
//
//// dfs함수 실행
//for i in 1...n {
//	visited = Array(repeating: false, count: 3001)
//	dfs(depth: 0, startIdx: i, currentIdx: i)
//}
//
//print(cycle)
//// cycle 안에있으면 거리 0 아니면 bfs적용
//for i in 1...n {
//	if !cycle[i] {
//		dist[i] = bfs(x: i)
//	} else {
//		dist[i] = 0
//	}
//}
//
//dist.removeFirst()
//print(dist.map{ String($0) }.joined(separator: " "))
//
