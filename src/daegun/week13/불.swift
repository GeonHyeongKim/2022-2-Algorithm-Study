import Foundation

typealias Position = (row: Int, column: Int)

func solution() -> String {
    // 첫째 줄에는 빌딩 지도의 너비와 높이 w와 h가 주어진다
    let size = readLine()!.split(separator: " ").map { Int(String($0))! }
    let width = size[0]
    let height = size[1]
    
    // 상근이가 움직인 좌표 Queue
    var S: [Position] = []
    var SFront = 0

    // 불이 나는 곳 좌표 Queue
    var F: [Position] = []
    var FFront = 0
    
    // 다음 h개 줄에는 w개의 문자, 빌딩의 지도가 주어진다.
    var map: [[String]] = []    // 지도
    for r in 0..<height {
        let row = readLine()!.map { String($0) }
        map.append(row)
        
        // 상근이/불 위치 저장
        for (c, value) in row.enumerated() {
            if value == "@" {
                S.append((r, c))
            } else if value == "*" {
                F.append((r, c))
            }
        }
        
        
    }
    map[S[0].row][S[0].column] = "."
    
    // bfs
    let offsets = [(1,0), (-1,0), (0,1), (0,-1)]
    var time = 0

    while S.count > SFront {
        
        time += 1
        
        // 불의 번짐
        if FFront < F.count {
            
            for _ in FFront..<F.count {
                
                let current = F[FFront]
                FFront += 1
                
                // 상하좌우 체크
                for offset in offsets {
                    
                    let r = current.0 + offset.0
                    let c = current.1 + offset.1
                    
                    // 새로운 위치가 미로를 벗어나지 않는다면
                    if (0..<height).contains(r) && (0..<width).contains(c) {
                        if map[r][c] != "#" && map[r][c] != "*" {
                            map[r][c] = "*"
                            F.append((r, c))
                        }
                    }
                    
                }
            }
        }

        // 상근 이동
        for _ in SFront..<S.count {
            
            let current = S[SFront]
            SFront += 1
            
            // 상하좌우 체크
            for offset in offsets {
                
                let r = current.0 + offset.0
                let c = current.1 + offset.1
                
                // 새로운 위치가 미로를 벗어나지 않는다면
                if (0..<height).contains(r) && (0..<width).contains(c) {
                    if map[r][c] == "." {
                        map[r][c] = "@"
                        S.append((r, c))
                    }
                } else {
                    return String(time)
                }
                
            }
            
        }
        
        
    }
    
    return "IMPOSSIBLE"
    
}

for _ in 0..<Int(readLine()!)! {
    print(solution())
}


