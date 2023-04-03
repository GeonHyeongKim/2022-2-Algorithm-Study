/*
 시간 초과
 */

import Foundation

func solution(_ n:Int, _ weak:[Int], _ dist:[Int]) -> Int {
    
    var allFriends: [[Int]] = []
    let visited: [Bool] = [Bool](repeating: false, count: dist.count)

    // 친구 순서 모든 경우의 수
    func permutation(depth: Int, visited: [Bool], arr: [Int]) {
        if depth == dist.count {
            allFriends.append(arr)
        }
        var visited = visited
        for i in 0..<dist.count {
            if visited[i] {
                continue
            }
            
            visited[i] = true
            permutation(depth: depth+1, visited: visited, arr: arr+[dist[i]])
            visited[i] = false
        }
    }
    permutation(depth: 0, visited: visited, arr: [])
    
    // 배치 시작 위치 모든 경우의 수
    var orders = [weak]
    for _ in 0..<weak.count-1 {
        var last = orders.last!
        let first = last.removeFirst()
        last.append(first + n)
        orders.append(last)
    }
    
    var result = dist.count + 1
    func check(_ order: [Int], _ friends: [Int]) {
        
        var count = 0
        var start = 0
        
        for end in 1..<order.count {
            
            guard start < end else { continue }
            
            if order[end] - order[start] < friends[count] {
                continue
                
            } else if order[end] - order[start] == friends[count] {
                continue
                
            } else {
                count += 1
                start = end + 1
            }
        }
        
        if start < order.count { count += 1 }
        
        result = min(result, count)
    }
    
    for order in orders {
        for friends in allFriends {
            
            check(order, friends)
        }
    }
    
    return (dist.count + 1 > result ? result : -1)
}

