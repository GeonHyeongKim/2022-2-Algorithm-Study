// 효율성 통과 실패

import Foundation

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    
    var chart = Array(0..<n)                                // 현재 표 상태 (초기 행 번호 저장)
    var cursor = k  // 현재 선택된 행
    
    var stack: [(Int, Int)] = []       // 삭제정보 (초기 위치, 삭제시 위치)
    
    for c in cmd {
        
        let command = c.split(separator: " ")
        
        // 위로 이동
        if command[0] == "U" {
            
            cursor = max(0, cursor-Int(command[1])!)
            
        // 아래로 이동
        } else if command[0] == "D" {
            
            cursor = min(chart.count-1, cursor+Int(command[1])!)
            
        // 삭제
        } else if command[0] == "C" {
            
            stack.append((chart[cursor], cursor))
            chart.remove(at: cursor)
            
            cursor = min(cursor, chart.count-1)
            
        // 복구
        } else if command[0] == "Z" {
            
            let undo = stack.last!
            chart.insert(undo.0, at: min(chart.count, undo.1))
            stack.removeLast()
            
            if undo.1 <= cursor {
                cursor += 1
            }
            
        }
        
        
    }
    
    var result = [String].init(repeating: "X", count: n)    // 삭제 여부
    for n in chart {
        result[n] = "O"
    }
    
    return result.joined(separator: "")
}
