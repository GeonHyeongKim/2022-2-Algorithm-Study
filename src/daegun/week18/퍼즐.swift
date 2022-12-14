/* 시간초과 */

import Foundation

var input = ""
for _ in 0..<3 {
    input += readLine()!.split(separator: " ").map { String($0) }.joined()
}

var result = -1
func bfs () {
    
    // visited[grid상태] = 해당 상태의 최소 cost
    let start = Int(input)!
    var visited: [String: Int] = [:]
    visited[input] = 0

    // bfs를 위한 queue
    typealias Try = (grid: String, cost: Int)
    var queue: [Try] = [(input, 0)]
    var queueFront = 0

    let offsets = [-3, +3, -1, +1]    // 상 하 좌 우
    
    while queue.count > queueFront {
        
        let current = queue[queueFront]
        queueFront += 1

        // 현재 빈칸의 위치
        let gridArray = current.grid.map { Int(String($0))! }
        let index = gridArray.firstIndex(of: 0)!
        
        for offset in offsets {
            
            // 해당 방향으로 이동 가능한지 체크
            if offset == -3 && index/3 == 0 { continue }
            if offset == 3 && index/3 == 2 { continue }
            if offset == -1 && index%3 == 0 { continue }
            if offset == 1 && index%3 == 2 { continue }
            
            let newIndex = index + offset   // 0과 swap될 칸의 index
            var newGridArray = gridArray    // swap할 array
            newGridArray.swapAt(index, newIndex)
            let newGrid = newGridArray.map { String($0) }.joined()
            
            // swap 후 결과가 정리된 상태일 경우
            if newGrid == "123456780" {
                result = current.cost + 1
                return
            }
                    
            // visited에 있는 값보다 새로운 cost가 작을 경우에만 진행
            if let visitedCost = visited[newGrid] {
                if visitedCost < current.cost + 1 {
                    continue
                }
            }
            
            queue.append((newGrid, current.cost + 1))
            visited[newGrid] = current.cost + 1
        }
        
    }

}

bfs()
print(result)
