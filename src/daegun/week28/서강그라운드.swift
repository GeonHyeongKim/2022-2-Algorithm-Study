import Foundation

let NMR = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NMR[0]  // 지역 수
let M = NMR[1]  // 수색 범위
let R = NMR[2]  // 길의 수

let INF = 16

var items = readLine()!.split(separator: " ").map { Int(String($0))! }
var roads = [[Int]].init(repeating: [Int].init(repeating: INF, count: N), count: N)
for _ in 0..<R {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let a = input[0] - 1
    let b = input[1] - 1
    let cost = input[2]
    
    roads[a][b] = cost
    roads[b][a] = cost
}

typealias Search = (location: Int, cost: Int)
var result = 0

for start in 0..<N {

    var sum = 0

    var queue: [Search] = [(start, 0)]
    var queueFirst = 0
    var visited = Set<Int>()

    while queue.count > queueFirst {
        let current = queue[queueFirst]
        queueFirst += 1
        
        if !visited.contains(current.location) {
            visited.insert(current.location)
            sum += items[current.location]
        }

        for (next, cost) in roads[current.location].enumerated() {
            
            if cost < INF && cost + current.cost <= M {
                queue.append((next, cost + current.cost))
            }
        }
    }
    
    result = max(result, sum)
}

print(result)
