// 민서의 응급 수술
// Question Link: https://www.acmicpc.net/problem/20955

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (input[0], input[1])
var tree = Array(0...n+1)
var answer = 0

func find(_ x: Int) -> Int {
	if tree[x] != x {
		return find(tree[x])
	}
	return x
}

func union(_ a: Int, _ b: Int) {
	let a = find(a)
	let b = find(b)
	
	if a < b {
		tree[b] = a
	} else {
		tree[a] = b
	}
}

for _ in 0..<m {
	let input = readLine()!.split(separator: " ").map{Int($0)!}
	let (a, b) = (input[0], input[1])
	if find(a) == find(b) {
		answer += 1
	}

	union(a, b) 	// 연결
}

for x in 1..<n {
	if find(x) != find(x+1) {
		union(x, x+1)
		answer += 1
	}
}

print(answer)

