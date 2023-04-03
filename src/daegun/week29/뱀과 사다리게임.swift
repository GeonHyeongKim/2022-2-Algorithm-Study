import Foundation

let LS = readLine()!.split(separator: " ").map { Int(String($0))! }
let L = LS[0]   // 사다리 수
let S = LS[1]   // 뱀 수

// 출발지 -> 목적지
var ladder = [Int:Int]()
var snake = [Int:Int]()

for _ in 0..<L {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    ladder[input[0]] = input[1]
}

for _ in 0..<S {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    snake[input[0]] = input[1]
}

// BFS
typealias Turn = (num: Int, cost: Int)
var queue: [Turn] = [(1, 0)]
var front = 0
var visited = [Int].init(repeating: 100, count: 100+1)

var result = 100
while queue.count > front {
    
    // Queue pop
    let current = queue[front]
    front += 1
    
    // visited
    guard visited[current.num] > current.cost else { continue }
    visited[current.num] = current.cost
    
    for dice in 1...6 {
        var nextNum = current.num + dice
        
        guard nextNum <= 100 else { continue }
        
        if let ladderNum = ladder[nextNum] {
            nextNum = ladderNum
        } else if let snakeNum = snake[nextNum] {
            nextNum = snakeNum
        }
        
        queue.append((nextNum, current.cost + 1))
    }
    
}

print(visited[100])
