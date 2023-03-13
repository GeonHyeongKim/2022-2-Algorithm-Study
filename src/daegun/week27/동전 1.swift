/*
 런타임 에러
 */

import Foundation

let NK = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NK[0]   // 동전의 종류
let K = NK[1]   // 목표 가치

var costs = [Int]()
for _ in 0..<N {
    costs.append(Int(String(readLine()!))!)
}
costs.sort()

let maxN = K % costs[0] == 0 ? K/costs[0] : K/costs[0] + 1
var dp = [Int].init(repeating: 0, count: maxN+1)

dp[0] = 1

for i in 1..<N {
    for j in costs[i]...K {
        dp[j] += dp[j - costs[i]]
    }
}

print(dp.reduce(0, { $0 + $1 }))
