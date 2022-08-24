func solution(n: Int, lighthouse: [[Int]]) -> Int {
    
    var graph: [[Bool]] = []
    for i in 0..<n {
        graph.append([Bool].init(repeating: false, count: n))
        graph[i][i] = true
    }
    
    for line in lighthouse {
        graph[line[0]-1][line[1]-1] = true
        graph[line[1]-1][line[0]-1] = true
    }
    
    var visited = [Bool].init(repeating: false, count: n)
    
    var result = 0
    
    while true {
        
        var connected: [Int] = []
        for list in graph {
            var count = 0
            for i in 0..<list.count {
                if list[i] && !visited[i] {
                    count += 1
                }
            }
            connected.append(count)
        }
        
        let on = connected.firstIndex(of: connected.max()!)!
    
        visited[on] = true
        for i in 0..<n {
            if graph[on][i] && !visited[i]{
                visited[i] = true
            }
        }
        
        result += 1
        
        if !visited.contains(false) { break }
    }
    
    

    return result
}
