import Foundation

typealias Point = (r: Int, c: Int)

func solution(_ board:[String]) -> Int {
    
    let board = board.map { $0.map { String($0) } }
    
    func move(_ current: Point, _ offset: Point) -> Point{

        var current = current
        while true {

            let next: Point = (current.r + offset.r, current.c + offset.c)
            
            // 벽이나 장애물에 부딛힐 경우
            if (next.r < 0 || next.r >= board.count)
                || (next.c < 0 || next.c >= board[0].count)
                || (board[next.r][next.c] == "D") {
                    return current
                    
            // 계속 이동
            } else {
                current = next
            }
        }

    }//: move
    
    var visited = [[Int]].init(repeating: [Int].init(repeating: Int.max, count: board[0].count), count: board.count)
    var result = Int.max
    let offsets: [Point] = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    
    func dfs(_ current: Point, _ cost: Int) {
        
        if board[current.r][current.c] == "G" {
            result = min(result, cost)
        }
        
        guard visited[current.r][current.c] > cost else { return }
        visited[current.r][current.c] = cost

        for offset in offsets {
            let next = move(current, offset)
            if next != current {
                dfs(next, cost + 1)
            }
        }
    }//: dfs
    
    // 시작지점 찾기
    var start: Point = (-1, -1)
    for r in 0..<board.count {
        guard start == (-1, -1) else { break }
        for c in 0..<board[0].count {
            if board[r][c] == "R" {
                start = (r, c)
                break
            }
        }
    }
    
    dfs(start, 0)
    
    return result < Int.max ? result : -1
}

