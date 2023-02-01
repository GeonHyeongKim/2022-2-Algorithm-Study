// 탈출
// Question Link: https://www.acmicpc.net/problem/16397

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0] // LED로 표현된 수
let T = input[1] // 버튼을 누를 수 있는 최대 횟수
let G = input[2] // 탈출을 위해 똑같이 만들어야 하는 수

var visited = [Bool](repeating: false, count: 1_000_001)
let rule = [1, 2] // +1, *2

func bfs() -> Int{
	var cnt = 0
	var equeue = [Int]()
	var dqueue = [Int]()
	equeue.append(N)
	visited[N] = true
	
	while !equeue.isEmpty {
		cnt += 1
		dqueue = equeue.reversed()
		equeue.removeAll()
		
		for _ in 1...dqueue.count {
			let curr = dqueue.removeLast()
			
			for i in 0...1 {
				// 규칙 1
				var next = curr + rule[i]
				
				if i == 1 {
					// 규칙 2
					next = curr * rule[i]
					
					// 규칙 3 탈출 실패
					if next > 99999 {
						continue
					}
					
					// 규칙 4
					if next / 10000 >= 1 {
						next -= 10000
					} else if next / 1000 >= 1 {
						next -= 1000
					} else if next / 100 >= 1 {
						next -= 100
					} else if next / 10 >= 1 {
						next -= 10
					} else if next > 0 {
						next -= 1
					} else {
						next = 0
					}
				}
				
				if next > 99999 { continue } 	// 규칙3 탈출 실패
				if next == G { return cnt } 	// 탈출
				
				if visited[next] == false {
					visited[next] = true
					equeue.append(next)
				}
			}
		}
	}
	return -1
}

let res = bfs()

if N == G {
	print(0)
} else if res == -1 || res > T {
	print("ANG")
} else {
	print(res)
}
