import Foundation

while true {
    let NM = readLine()!.split(separator: " ").map { Double(String($0))! }
    let N = Int(NM[0])   // 사탕 종류
    let M = Int(NM[1] * 100 + 0.5)   // 돈
    
    if N == 0 && M == 0 { break }
    
    var candies = [(calorie: Int, price: Int)]()
    for _ in 0..<N {
        let input = readLine()!.split(separator: " ").map { Double(String($0))! }
        candies.append((Int(input[0]), Int(input[1] * 100 + 0.5)))
    }
    
    var dp = [Int].init(repeating: 0, count: M+1)
    
    for price in 0...M {
        
        for candy in candies {
            if price >= candy.price {
                dp[price] = max(dp[price], dp[price-candy.price] + candy.calorie)
            }
        }
    }
    
    print(dp.last!)
}
