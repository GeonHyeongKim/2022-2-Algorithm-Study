import Foundation

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    
    var offsetBoard = [[Int]].init(repeating: [Int].init(repeating: 0, count: board[0].count + 1), count: board.count + 1)
    
    for skill in skill {
        let degree = (skill[0] == 1) ? skill[5]*(-1) : skill[5]
        
        offsetBoard[skill[1]][skill[2]] += degree
        offsetBoard[skill[1]][skill[4] + 1] -= degree
        offsetBoard[skill[3] + 1][skill[2]] -= degree
        offsetBoard[skill[3] + 1][skill[4] + 1] += degree
    }
    
    for c in 0..<offsetBoard[0].count {
        for r in 1..<offsetBoard.count {
            offsetBoard[r][c] += offsetBoard[r-1][c]
        }
    }
    
    for r in 0..<offsetBoard.count {
        for c in 1..<offsetBoard[0].count {
            offsetBoard[r][c] += offsetBoard[r][c-1]
        }
    }
    
    var result = 0
    for r in 0..<board.count {
        for c in 0..<board[0].count {
            
            if board[r][c] + offsetBoard[r][c] > 0 {
                result += 1
            }
        }
    }
    
    return result
}
