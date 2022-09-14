import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    
    // 그래프 생성
    var INF = 900000
    var prices = [[Int]].init(repeating: [Int].init(repeating: INF, count: n), count: n)
    
    for number in 0..<n {
        prices[number][number] = 0
    }
    for fare in fares {
        prices[fare[0]-1][fare[1]-1] = fare[2]
        prices[fare[1]-1][fare[0]-1] = fare[2]
    }
    
    // 플로이드 와샬
    for k in 0..<n {
        for from in 0..<n {
            for to in 0..<n {
                prices[from][to] = min(prices[from][to], prices[from][k] + prices[k][to])
            }
        }
    }
    
    var result = Int.max
    for k in 0..<n {
        result = min(result, prices[s-1][k] + prices[k][a-1] + prices[k][b-1])
    }
    
    return result
}
