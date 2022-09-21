/*
11번 시간 초과
*/

import Foundation

struct Point: Hashable {
    let row: Int
    let column: Int
    
    init (_ row: Int, _ column: Int) {
        self.row = row
        self.column = column
    }
}

func getOffsetIndex(_ point: Point) -> Int {
    switch point {
        case Point(-1, 0):  return 0
        case Point(1, 0):   return 1
        case Point(0, -1):  return 2
        case Point(0, 1):   return 3

        default: return 0
    }
}

func solution(_ board:[[Int]]) -> Int {
    
    let offsets = [Point(-1,0), Point(1,0), Point(0,-1), Point(0,1),]
    let N = board.count
    
    var result = N * N * 5
    var costTable = [[[Int]]].init(repeating: [[Int]].init(repeating: [result, result, result, result], count: N), count: N)
    
    func dfs(_ visited: Set<Point>, _ position: Point, _ cost: Int, _ direction: Point) {

        let offsetIndex = getOffsetIndex(direction)
        if cost >= result || costTable[position.row][position.column][offsetIndex] < cost { 
            return 
        } else {
            costTable[position.row][position.column][offsetIndex] = cost
        }


        // 도착
        if position == Point(N-1, N-1) {
            result = min(cost, result)

        // 진행중
        } else {
            
            for offset in offsets {
                
                let newPoint = Point(position.row+offset.row, position.column+offset.column)

                // 새 좌표가 부지 안에 위치 && 방문하지 않음 && 벽이 아님
                if (!visited.contains(newPoint)) &&
                    (newPoint.row < N && newPoint.row >= 0) &&
                    (newPoint.column < N && newPoint.column >= 0) {
                        
                        var newVisited = visited
                        newVisited.insert(newPoint)
                        
                        var newCost = cost + ((position == Point(0, 0) || direction == offset) ? 1 : 6)
                        dfs(newVisited, newPoint, newCost, offset)
                }
                
            }
            
        }
        
    }
    
    var initVisited = Set<Point>()
    initVisited.insert(Point(0, 0))
    
    for r in 0..<N {
        for c in 0..<N {
            if board[r][c] == 1 {
                initVisited.insert(Point(r, c))
            }
        }
    }
    dfs(initVisited, Point(0, 0), 0, Point(0, 0))
    
    
    
    return result * 100
}