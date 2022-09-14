import Foundation

// 90도 회전
func turnKey(_ key: [[Int]]) -> [[Int]] {
    var newKey: [[Int]] = []
    for c in 0..<key.first!.count {
        newKey.append([])
        for r in (0..<key.count).reversed() {
            newKey[c].append(key[r][c])
        }
    }
    
    return newKey
}

func check(_ key: [[Int]], _ lock: [[Int]], _ pos: (Int, Int)) -> Bool {
    
    var result = true
    var lockGrid = lock

    for r in 0..<lock.count {
        
        if r < pos.0 {
            continue
        } else if r > pos.0+key.count-1 {
            break
        }
        
        for c in 0..<lock.first!.count {
            
            if c < pos.1 {
                continue
            } else if c > pos.1+key.count-1 {
                break
            }

            let keyState = key[r-pos.0][c-pos.1]
            let lockState = lock[r][c]
            
            if keyState == lockState {
                return false
                
            } else if keyState == 1 && lockState == 0 {
                lockGrid[r][c] = 1
            }
        }
        
    }
    
    for row in lockGrid {
        if row.contains(0) { return false }
    }
    
    return true
}

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    
    let M = key.count
    let N = lock.count
    
    var keys: [[[Int]]] = [key]
    for _ in 1..<4 {
        keys.append(turnKey(keys.last!))
    }
    
    // 열리는지 확인
    // (r,c) -> key의 좌상단 좌표
    for r in -M+1..<N {
        for c in -M+1..<N {
            for k in keys {
                if check(k, lock, (r,c)) {
                    return true
                }
            }
        }
    }

    
    return false
}
