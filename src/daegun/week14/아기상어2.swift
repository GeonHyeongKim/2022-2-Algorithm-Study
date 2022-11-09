import Foundation

let RC = readLine()!.split(separator: " ").map { Int($0)! }
let R = RC[0]
let C = RC[1]

var grid: [[Int]] = []
var sharks: [(Int, Int)] = []
for r in 0..<R {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    grid.append(row)
    for c in 0..<C {
        if row[c] == 1 {
            sharks.append((r, c))
        }
    }
}

func distance(_ r1: Int, _ c1: Int, r2: Int, c2: Int) -> Int {
    let rOffset = Int(abs(r2 - r1))
    let cOffset = Int(abs(c2 - c1))
    
    // 일직선으로 이동하는 경우
    if rOffset * cOffset == 0 {
        return rOffset + cOffset
        
    // 대간선으로도 이동하는 경우
    } else {
        let diagonal = Int(abs(rOffset - cOffset))
        let straight = max(rOffset, cOffset) - diagonal
        
        return diagonal + straight
    }
}

func safeDistance(_ r: Int, _ c: Int) -> Int {
    var result = Int.max
    
    for shark in sharks {
        let dist = distance(r, c, r2: shark.0, c2: shark.1)
        
        if result > dist {
            result = dist
        }
    }
    
    return result
}

var result = 0
for r in 0..<R {
    for c in 0..<C {
        
        if grid[r][c] == 0 {
            let dist = safeDistance(r, c)
            
            if result < dist {
                result = dist
            }
        }
        
    }
}

print(result)
