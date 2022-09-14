import Foundation

let empty = -1

// 이진트리 끝부분에 위치한 늑대들 삭제 -> 새로운 (info, edges)
func removeLastWolves(_ info:[Int], _ edges:[[Int]]) -> ([Int], [[Int]]){
    
    var wolves = 0
    for value in info {
        if value == 1 { wolves += 1 }
    }
    
    var nodes = info
    var graph = edges
    
    while true {
        
        var removed: [Int] = []
        for index in 0..<nodes.count {
            if graph[index].isEmpty && nodes[index] == 1 {
                nodes[index] = empty
                graph[index] = []
                wolves -= 1
                
                removed.append(index)
            }
        }
        
        if removed.isEmpty {
            break
        } else {
            graph = graph.map {
                $0.filter { !removed.contains($0) }
            }
        }

    }
    
    return (nodes, graph)
}

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    
    var nodes = info
    var graph = [[Int]].init(repeating: [], count: nodes.count)
    for edge in edges {
        graph[edge[0]].append(edge[1])
    }

    let removed = removeLastWolves(nodes, graph)
    nodes = removed.0
    graph = removed.1

    var result = 1
    
    func dfs(_ nextNodes: [Int], _ sheep: Int, _ wolf: Int) {
        for index in nextNodes {
            
            let newSheep = sheep + (nodes[index] == 0 ? 1 : 0)
            let newWolf = wolf + (nodes[index] == 1 ? 1 : 0)

            if newSheep > newWolf {
                result = max(result, newSheep)
                var newNextNodes = nextNodes
                newNextNodes.remove(at: newNextNodes.firstIndex(of: index)!)
                dfs(newNextNodes+graph[index], newSheep, newWolf)
            }
        }
    }

    dfs(graph[0], 1, 0)
    
    return result
}
