import Foundation

var inputGrid: [[Int]] = []
for _ in 0..<10 {
    inputGrid.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

// grid[r][c] 지점이 좌상단일때 n크기 색종이 가능한지 판별
func paperAvailable(_ R: Int, _ C: Int, _ N: Int, _ grid: [[Int]]) -> Bool {
    
    // 칸을 넘어가는지 체크
    guard R + N - 1 < 10 && C + N - 1 < 10 else { return false }
    
    for r in R..<R+N {
        for c in C..<C+N {
            if grid[r][c] != 1 { return false }
        }
    }
    
    return true
}

// grid[r][c] 지점이 색종이의 좌상단이 되게끔 색종이 붙이기
func paperAttach(_ R: Int, _ C: Int, _ N: Int, _ grid: [[Int]]) -> [[Int]] {
    
    var result = grid
    
    for r in R..<R+N {
        for c in C..<C+N {
            result[r][c] = 0
        }
    }
    
    return result
}

var result = 26
func dfs(_ R: Int, _ C: Int, _ grid: [[Int]], _ paper: [Int], _ count: Int) {
    
    // 조기 종료
    guard count < result else { return }

    var r = R
    var c = C
    
    while r < 10 {
        
        if grid[r][c] == 1 {
            
            for n in 1...5 {
                
                // 남은 N 크기 색종이가 없다면 다음으로
                guard paper[n] > 0 else { continue }
                
                // N크기 색종이가 못들어가면 N보다 큰것도 못들어간다
                guard paperAvailable(r, c, n, grid) else { break }

                let newGrid = paperAttach(r, c, n, grid)
                var newPaper = paper
                newPaper[n] -= 1

                if c < 9 {
                    dfs(r, c+1, newGrid, newPaper, count+1)
                } else {
                    dfs(r+1, 0, newGrid, newPaper, count+1)
                }
                
            }
            return
        }
        
        // 다음 좌표로 이동
        c += 1
        if c == 10 {
            r += 1
            c = 0
        }
        
    }
    
    result = result > count ? count : result
}

dfs(0, 0, inputGrid, [0, 5, 5, 5, 5, 5], 0)

print(result != 26 ? result : -1)
