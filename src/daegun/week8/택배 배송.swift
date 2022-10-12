// 메모리 초과

import Foundation

let INF = 1001

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]   // 노드 수
let M = NM[1]   // 간선 수

var graph = [[Int]].init(repeating: [Int].init(repeating: INF, count: N), count: N)
for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    graph[input[0]-1][input[1]-1] = min(input[2], graph[input[0]-1][input[1]-1])
    graph[input[1]-1][input[0]-1] = min(input[2], graph[input[0]-1][input[1]-1])
}

for pass in 1..<N {
    
    for to in 1..<N {
        guard pass != to else { continue }
        graph[0][to] = min(graph[0][to], graph[0][pass] + graph[pass][to])
    }
}

print(graph[0][N-1])

/*
Input
6 8
4 5 3
2 4 0
4 1 4
2 1 1
5 6 1
3 6 2
3 2 6
3 4 4

Output
5
*/

