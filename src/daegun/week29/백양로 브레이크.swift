/*
 시간 초과
 */

import Foundation

let BR = readLine()!.split(separator: " ").map { Int(String($0))! }
let B = BR[0]   // 건물 수
let R = BR[1]   // 길 수

// 0: 길 없음, 1: 갈 수 있음, -1: 올 수 있음
var graph = [[Int]].init(repeating: [Int].init(repeating: 0, count: B + 1), count: B + 1)
for _ in 0..<R {
    let uvb = readLine()!.split(separator: " ").map { Int(String($0))! }
    let u = uvb[0]
    let v = uvb[1]
    let b = uvb[2]
    
    graph[u][v] = 1
    graph[v][u] = (b == 1) ? 1 : -1
}

var questions = [[Int]]()
for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    questions.append(input)
}

for question in questions {
    let S = question[0]
    let E = question[1]
    
    // dfs
    var visited = [Int].init(repeating: R, count: B+1)

    func dfs(_ b: Int, _ cost: Int) {

        guard visited[b] > cost else { return }
        visited[b] = cost

        for i in 1...B where graph[b][i] != 0 {
            let newCost = (graph[b][i] == 1) ? cost : cost + 1
            dfs(i, newCost)
        }
    }

    dfs(S, 0)

    print(visited[E])
}
