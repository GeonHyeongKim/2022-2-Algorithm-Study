/*
 틀렸습니다
*/

import Foundation

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0]   // 세로크기
let M = NM[1]   // 가로크기

var robot = readLine()!.split(separator: " ").map { Int(String($0))! }

// 1: 벽, 0: 청소 안된 공간, 2: 청소된 공간
var grid: [[Int]] = []
for _ in 0..<N {
    grid.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

let offsets = [[-1,0], [0,-1], [1,0], [0,1]]   // 위, 왼, 아래, 오

var result = 0

while true {
    
    // 1. 현재 위치를 청소한다.
    if grid[robot[0]][robot[1]] == 0 {
        result += 1
        grid[robot[0]][robot[1]]  = 2
    }
    
    // 2. 현재 위치에서 현재 방향을 기준으로 왼쪽방향부터 차례대로 탐색을 진행한다.
    
    // 왼쪽으로 회전하면서 탐색
    print((robot))
    var isChanged = false
    for i in 1...4 {
        let newDir = (robot[2] + i) % 4
        let offset = offsets[newDir]
        print(newDir)
        // 왼쪽 방향에 아직 청소하지 않은 공간이 존재
        if grid[robot[0]+offset[0]][robot[1]+offset[1]] == 0 {
        print("next: \(newDir)")
            isChanged = true
            
            // 회전 후 한칸 전진
            robot[2] = newDir
            robot[0] += offset[0]
            robot[1] += offset[1]
            break
        }
    }
    
    
    // 네 방향 모두 청소가 이미 되어있거나 벽인 경우
    if !isChanged {
        
        let offset = [offsets[robot[2]][0]*(-1), offsets[robot[2]][1]*(-1)]
        
        if grid[robot[0]+offset[0]][robot[1]+offset[1]] != 1 {
            // 바라보는 방향을 유지한 채로 한 칸 후진
            robot[0] += offset[0]
            robot[1] += offset[1]
        
        // 뒤쪽 방향이 벽이라 후진도 할 수 없는 경우
        } else {
            break
        }
    }

}

grid.forEach {
    print($0)
}
print(result)


/*
 
 6 6
 2 1 3
 1 1 1 1 1 1
 1 0 0 0 0 1
 1 0 1 1 1 1
 1 0 1 1 1 1
 1 0 1 1 1 1
 1 1 1 1 1 1
 
 7 7
 4 2 1
 1 1 1 1 1 1 1
 1 0 0 0 1 0 1
 1 0 1 1 0 0 1
 1 0 0 0 0 1 1
 1 0 2 1 2 2 1
 1 0 2 2 2 2 1
 1 1 1 1 1 1 1

 9 7
 6 2 1
 1 1 1 1 1 1 1
 1 0 1 0 1 0 1
 1 0 1 0 0 0 1
 1 0 1 0 1 0 1
 1 0 1 1 1 1 1
 1 0 0 0 0 0 1
 1 0 0 1 1 0 1
 1 0 0 0 0 0 1
 1 1 1 1 1 1 1
 */
