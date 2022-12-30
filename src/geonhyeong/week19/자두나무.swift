// 자두나무.swift
// Question Link: https://www.acmicpc.net/problem/2240

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let T = input[0], W = input[1] // 시간, 움직임 횟수
var memo = [[Int]](repeating: [Int](repeating: Int.min, count: W+1), count: T+1) // dp
var ans = 0

memo[0][0] = 0

for i in 1...T {
	let plum = Int(readLine()!)! // 자두
	
	for j in 0...W {
		let cur = j % 2 + 1
		
		if j == 0 { // 1번 나무에서 한 번도 움직이지 않는 경우, 1번 나무에서 자두가 떨어진다면 1, 2번 나무에서 자두가 떨어진다면 0
			memo[i][j] = memo[i-1][0] + (cur == plum ? 1 : 0)
		} else if cur == plum { // 이전 위치로부터 움직여서 받아 먹을 것인지, 현재 위치에서 받아 먹을 것인지를 비교
			memo[i][j] = max(memo[i-1][j], memo[i-1][j-1]) + 1
		} else { // i초에 자두가 떨어지는 나무와 현재 나무의 위치가 다르다면, 움직여서 못 먹는 경우와 움직이지 않아서 못 먹는 경우를 비교
			memo[i][j] = max(memo[i-1][j-1], memo[i-1][j])
		}
	}
}

print(memo[T].max()!)
