import Foundation

func solution(_ name:String) -> Int {
    
    var result = 0
    
    // 알파벳 조작 수 계산
    for letter in name {
        let code = Int(UnicodeScalar(String(letter))!.value)
        result += min(code-65, 91-code)
    }
    
    // 커서 이동 조작 수 계산
    var visited = name.map { $0 == "A"}
    
    func getCursorMoves(_ currentVisit: [Bool], _ cursor: Int, _ count: Int) -> Int {
        
        // 현재 커서 방문처리
        var visited = currentVisit
        visited[cursor] = true
        
        // 마지막 노드일 경우 종료
        if !visited.contains(false) { return count }
        
        var first = visited.firstIndex(of: false)!   // 오른쪽으로 이동 목표
        var last = visited.lastIndex(of: false)!     // 왼쪽으로 이동 목표
        
        // 커서가 수정할 위치의 왼쪽에 위치
        if cursor < first {
            
            return min(
                getCursorMoves(visited, first, count + first - cursor),
                getCursorMoves(visited, last, count + visited.count - last + cursor)
            )

        // 커서가 수정할 위치의 오른쪽에 위치
        } else {
            
            return min(
                getCursorMoves(visited, first, count + visited.count - cursor + first),
                getCursorMoves(visited, last, count + cursor - last)
            )
        }
    }
    
    result += getCursorMoves(visited, 0, 0)
    
    return result
}


