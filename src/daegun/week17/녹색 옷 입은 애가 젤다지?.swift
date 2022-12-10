/* 시간 초과 */

import Foundation

let offsets = [[-1,0], [1,0], [0,-1], [0,1]]
var caseNumber = 1

while true {
    
    guard let input = readLine() else { break }
    guard let N = Int(input) else { break }
    
    if N == 0 { break }
    
    var grid: [[Int]] = []
    for _ in 0..<N {
        grid.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    
    var lost = [[Int]].init(repeating: [Int].init(repeating: 125 * 125 * 9, count: N), count: N)
    var queue = [(0, 0, 0)]
    var queueFront = 0
    
    while queue.count > queueFront {
        
        // queue에서 pop
        let current = queue[queueFront]
        queueFront += 1
        let r = current.0
        let c = current.1
        let newLost = current.2 + grid[r][c]
        
        // visited와 비교v
        if newLost < lost[r][c] {
            lost[r][c] = newLost
            
            for offset in offsets {
                let newR = r + offset[0]
                let newC = c + offset[1]
                
                if (newR >= 0 && newR < N) && (newC >= 0 && newC < N) {
                    queue.append((newR, newC, newLost))
                }
            }
        }

        
    }

    print("Problem \(caseNumber): \(lost[N-1][N-1])")
    caseNumber += 1
        
}

