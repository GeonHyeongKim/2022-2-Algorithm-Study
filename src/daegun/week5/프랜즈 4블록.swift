import Foundation

struct Point: Hashable {
    var row: Int
    var column: Int
    
    init (_ location: (Int, Int)) {
        self.row = location.0
        self.column = location.1
    }
}

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    
    var grid = board.map { $0.map { String($0) } }
    let empty = "0" // 빈 슬롯
    let offset = [(0, 1), (1, 1), (1, 0)]
    
    // 특정 좌표에서 4블록을 만족하는지 도출
    func check(_ r: Int, _ c: Int) -> Bool {
        
        for diff in offset {
            
            // 좌표가 판을 벗어나지 않는다면
            if (r+diff.0 >= 0 && r+diff.0 < m) {
                
                // 다른 블록 발견됨
                if grid[r+diff.0][c+diff.1] != grid[r][c] { return false }
               
            } else {
                return false
            }

        }
        
        return true
    }
    
    // 블럭 지우기 후 빈간 채우기
    func fill(_ deleted: Set<Point>) {
        
        for pos in deleted {
            grid[pos.row][pos.column] = empty
        }
        
        for c in 0..<n {
            for r in 1..<m {
                
                if grid[r][c] == empty {
                    for i in (0...r-1) {
                        grid[r-i][c] = grid[r-i-1][c]
                    }
                    grid[0][c] = empty
                }
                
            }
        }
        
    }

    var result = 0
    while true {
        
        var deleted = Set<Point>()
                
        for r in 0..<m-1 {
            for c in 0..<n-1 {
                if grid[r][c] != empty {
                    if check(r, c) {

                        deleted.insert(Point((r, c)))
                        for diff in offset {
                            deleted.insert(Point((r+diff.0, c+diff.1)))
                        }
                    }
                }
            }
        }

          
        if !deleted.isEmpty {
            
            result += deleted.count
            fill(deleted)
             
        } else {
            return result
        }
        
    }
    
    
    return result
}
