/*
 틀렸습니다
 */
import Foundation

let NS = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NS[0]   // 뉴런 수
let S = NS[1]   // 시냅스 수

var connect = [[Int]].init(repeating: [], count: N)
for _ in 0..<S {
    let s = readLine()!.split(separator: " ").map { Int(String($0))! }
    let a = s[0] - 1
    let b = s[1] - 1
    
    connect[a].append(b)
    connect[b].append(a)
}

var branchs = [Set<Int>]()
var connects = [Int]()
var visited = Set<Int>()

for n in 0..<N where !visited.contains(n) {
    
    var branch = Set<Int>()
    var conneted = 0
    var queue = [n]
    var queueFront = 0
    
    while queue.count > queueFront {
        
        let current = queue[queueFront]
        queueFront += 1
        
        visited.insert(current)
        branch.insert(current)
        
        for next in connect[current] {
            conneted += 1
            
            if !visited.contains(next) {
                queue.append(next)
            }
        }
        
    }
    
    if !branch.isEmpty {
        branchs.append(branch)
        connects.append(conneted/2)
    }
    
}

var result = branchs.count - 1

// cycle 체크
for (index, branch) in branchs.enumerated() {
    if connects[index] >= branch.count {
        result -= 1
    }
}

print(result)
