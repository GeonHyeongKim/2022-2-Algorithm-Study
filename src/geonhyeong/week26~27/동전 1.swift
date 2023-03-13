// 동전 1
// Question Link: https://www.acmicpc.net/problem/2293
// 참고 https://sapjilkingios.tistory.com/m/entry/SwiftDP-%EB%B0%B1%EC%A4%80-2293%EB%B2%88-%EB%8F%99%EC%A0%841

import Foundation

var input = readLine()!.split(separator: " ")
var n = Int(input[0])!
var k = Int(input[1])!
var coins = [Int]()
var dp = [Int](repeating: 0, count: k + 1) // 코인을 만들수 있는 조합의 갯수

for _ in 1...n {
	let coin = Int(readLine()!)!
	coins.append(coin)
}

dp[0] = 1 // 0을 만들수 있는 조합 0 (아무것도 선택안함)
for coin in coins {
	for target in stride(from: coin, through: k, by: 1) {
		if dp[target] + dp[target - coin] >= Int(pow(2.0, 31.0)) {
			dp[target] = 0
		} else {
			dp[target] += dp[target - coin]
		}
	}
}

print(dp[k])
