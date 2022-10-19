// 여왕벌.swift
// Question Link: https://www.acmicpc.net/problem/10836
// Primary idea:
//                   1.
//
// 걸린 시간 : 15:00
// Time Complexity : O()
// Space Complexity : O()
// Runtime:  ms
// Memory Usage:  MB

let input = readLine()!.split(separator: " ").map{Int($0)!}
let (m, n) = (input[0], input[1])
var honeycomb = [Int](repeating: 1, count: 2*m+1) // 벌집, 맨왼쪽 + 맨위

// 날짜(n)에 따른 애벌레 성장
for _ in 0..<n {
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let (zero, one, two) = (info.first!, info[1], info.last!)
    
	// 애벌레 크기 1만큼 증가
    for i in zero..<zero+one {
		honeycomb[i] += 1
    }
	
	// 애벌레 크기 2만큼 증가
	for i in zero+one..<zero+one+two {
		honeycomb[i] += 2
	}
}

for i in range(m) {
	for j in range(m) {
		if j == 0 {
			print(honeycomb[m - (i + 1)], terminator: " ")
		} else {
			print(honeycomb[m + j - 1)], terminator: " ")
		}
	}
}
print()
