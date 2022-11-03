import Foundation

typealias Point = (row: Int, column: Int)

// Tuple Array를 위한 Contains
func containsTuple(_ array: [(Int, Int)], _ tuple:(Int,Int)) -> Bool {
    let (x, y) = tuple
    for (i, j) in array {
        if i == x && j == y {
            return true
        }
    }
    return false
}

// 입력
var puyos = [[String]].init(repeating: [], count: 6)

for _ in 0..<12 {
    let input = readLine()!.map { String($0) }
    
    // 최상단에 빈 열은 무시
    if puyos.first!.isEmpty && input == [".", ".", ".", ".", ".", "."] {
        continue
    } else {
        for i in 0..<6 {
            // 세로로 저장
            puyos[i].append(input[i])
        }
    }
}

let height = puyos.first!.count // 빈 row가 생략된 새로운 height

// 인접한 좌표 array
var candidate: [Point] = []
func dfs(_ current: Point, _ color: String) {
    
    guard (current.row >= 0 && current.row < 6)
            && (current.column >= 0 && current.column < puyos.first!.count)
            && !containsTuple(candidate, current) else { return }
    
    if puyos[current.row][current.column] == color {
        candidate.append(current)
        
        dfs((current.row + 1, current.column), color)
        dfs((current.row - 1, current.column), color)
        dfs((current.row, current.column + 1), color)
        dfs((current.row, current.column - 1), color)
    }
}

var removeList: [Point] = []
var result = -1
repeat {

    // 폭발 카운트
    result += 1
    
    // 폭발할 puyo 좌표 확인
    removeList = []
    for r in 0..<6 {
        for c in 0..<height {
            
            if !containsTuple(removeList, (r,c)) && puyos[r][c] != "." {
                dfs((r, c), puyos[r][c])
                
                // 4개 이상 인접할 경우 폭발 처리
                if candidate.count >= 4 {
                    removeList.append(contentsOf: candidate)
                }
                candidate = []
            }
        }
    }
    
    // puyo 리스트에서 삭제
    for target in removeList {
        
        var newList = puyos[target.row]
        newList.remove(at: target.column)
        newList.insert(".", at: target.column)
        puyos[target.row] = newList
    }
    
    // 중력 적용
    for i in 0..<6 {
        let newList = puyos[i].filter { $0 != "." }
        let addList = [String].init(repeating: ".", count: height-newList.count)
        puyos[i] = addList + newList
    }

} while !removeList.isEmpty


print(result)
