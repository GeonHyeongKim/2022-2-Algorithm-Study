import Foundation

// dp[W][H]
var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: 31), count: 31)

// W만 사용하는 경우는 항상 1가지
for i in 0..<31 {
    dp[i][0] = 1
}

// dp[3][1] = (dp[3][0] + 'H') + (dp[2][1] + 'W')
// dp[w][h] = dp[w - 1][h] + d[w][h - 1]
for w in 1..<31 {
    for h in 1..<31 {
        
        // W보다 H가 항상 많아야 한다
        guard h <= w else { continue }
        
        // 점화식
        dp[w][h] = dp[w - 1][h] + dp[w][h - 1];
    }
}

while true {
    
    let N = Int(readLine()!)!
    guard N != 0 else { break }
    
    print(dp[N][N])
}
