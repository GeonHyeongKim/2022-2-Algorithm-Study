import Foundation

// 입출력
let HW = readLine()!.split(separator: " ").map { Int(String($0))! }
let H = HW[0]
let W = HW[1]

let height = readLine()!.split(separator: " ").map { Int(String($0))! }

// grid[row][height] = 0: 빈칸, 1: 블록이 있는 칸
var grid = [[Int]].init(repeating: [Int].init(repeating: 0, count: W), count: H)
for h in 0..<H {
    for w in 0..<W {
        if height[w] > h { grid[h][w] = 1 }
    }
}

// 바닥 추가
grid = [[Int].init(repeating: 1, count: W)] + grid

var result = 0

// 가장 아래쪽은 바닥이기 때문에 1부터
for h in 1...H {
    
    var current: [Int] = []

    for w in 1..<W {

        // 빈칸
        if grid[h][w] == 0 {
            
            // 아래쪽이 막혀있지 않으면 무시
            guard grid[h-1][w] == 1 else { continue }
            
            
            // 왼쪽이 막혀있으면 시작지점
            // 왼쪽이 안막혀있어도 candidate가 비어있지 않으면 중간지점
            if grid[h][w-1] == 1 || !current.isEmpty {
                current.append(w)
            }
            
        // 안 빈칸
        } else {
            
            if !current.isEmpty {
                for w in current {
                    grid[h][w] = 1
                    result += 1
                }
                current = []
            }
        }
        
    }
    
}

print(result)

