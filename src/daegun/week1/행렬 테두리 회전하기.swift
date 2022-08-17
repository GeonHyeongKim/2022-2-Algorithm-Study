import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    
    var grid: [[Int]] = []
    for row in 1...rows {
        grid.append(Array((columns*(row-1))+1...columns*row))
    }
    
    var result: [Int] = []
               
    for query in queries {
        let existing = grid
        var numbers: [Int] = []
        
        let x1 = query[0]-1, y1 = query[1]-1, x2 = query[2]-1, y2 = query[3]-1
        
        // column만 변화 -> 위, 아랫줄
        for column in (y1...y2-1) {
            grid[x1][column+1] = existing[x1][column]
            numbers.append(existing[x1][column])
        }
        for column in (y1+1...y2) {
            grid[x2][column-1] = existing[x2][column]
            numbers.append(existing[x2][column])
        }
        
        // row만 변화 -> 왼, 오른쪽 줄
        for row in (x1...x2-1) {
            grid[row+1][y2] = existing[row][y2]
            numbers.append(existing[row][y2])
        }
        for row in (x1+1...x2) {
            grid[row-1][y1] = existing[row][y1]
            numbers.append(existing[row][y1])
        }
        
        result.append(numbers.min()!)
    }
    
    return result
}
