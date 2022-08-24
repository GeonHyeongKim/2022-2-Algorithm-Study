func solution(n: Int, roads: [[Int]], sources: [Int], destination: Int) -> [Int] {
    
    let INF = 10000000
    
    // 간선 그래프
    var graph: [[Int]] = []
    for i in 0..<n {
        graph.append([Int].init(repeating: INF, count: n))
        graph[i][i] = 0
    }
    for road in roads {
        graph[road[0]-1][road[1]-1] = 1
        graph[road[1]-1][road[0]-1] = 1
    }
    
    // 최단거리 계산
    var result: [Int] = []
    for source in sources {
        
        let from = source - 1
        
        var cost = graph[from]
        for pass in 0..<n {
            
            if pass == from { continue }
            
            for point in 0..<n {
                cost[point] = min(cost[point], graph[from][pass]+graph[pass][point])
            }
        }
        
        let shortest = cost[destination-1]

        result.append(shortest < INF ? shortest : -1)
    }
    
    
    
    return result
}

print(solution(n: 3, roads: [[1, 2], [2, 3]], sources: [2, 3], destination: 1))
print(solution(n: 5, roads: [[1, 2], [1, 4], [2, 4], [2, 5], [4, 5]], sources: [1, 3, 5], destination: 5))
