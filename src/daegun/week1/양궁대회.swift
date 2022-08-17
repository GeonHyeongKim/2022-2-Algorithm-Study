import Foundation

// a: loseResult, b: winResult
func compare(_ a: ([Int], Int, (Int, Int)), _  b: ([Int], Int, (Int, Int))) -> ([Int], Int, (Int, Int)) {
    
    if a.1 != b.1 {
        return a.1 > b.1 ? a : b
    
    // 점수차이가 같을 경우
    } else {
        // 맞힌 가장 낮은 점수로 비교
        if a.2.0 != b.2.0 {
            return a.2.0 < b.2.0 ? a : b
            
        // 맞힌 가장 낮은 횟수로 비교
        } else {
            return a.2.1 > b.2.1 ? a : b
        }
    }
}

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    
    // hit: 라이언의 info, trun: 현재 처리중인 점수, arrows: 남은 화살 수
    // return: 라이언의 info, 점수차 (라이언-어피치), (가장 낮은 맞힌 점수, 맞힌 수)
    func getScore(_ hit: [Int], _ turn: Int, _ arrows: Int,
                  _ offset: Int) -> ([Int], Int, (Int, Int)) {

        /* 종료 */
        // 화살 소진 or 마지막 시도
        if arrows == 0 || turn == 10 {
            
            if turn == 10 {
                var newHit = hit
                newHit[10] += arrows
                
                var lowest = (0, 0)
                for (index, value) in newHit.reversed().enumerated() {
                    if value != 0 {
                        lowest = (index, value)
                        break
                    }
                }
                
                return (newHit, offset, lowest)
            } else {
                let loseOffset = info[turn] > 0 ? (10-turn) : 0
                return getScore(hit, turn+1, arrows, offset - loseOffset)
            }
        }

        /* 진행 */
        // 이번 점수를 어피치가 획득하는 경우
        let loseOffset = info[turn] > 0 ? (10-turn) : 0
        let loseResult = getScore(hit, turn+1, arrows, offset - loseOffset)

        // 라이언이 이번 점수 획득 불가능
        if arrows <= info[turn] { return loseResult }

        // 이번 점수를 라이언이 획득하는 경우
        var newHit = hit
        newHit[turn] = info[turn] + 1
        let winResult = getScore(newHit, turn+1, arrows - (info[turn] + 1), offset + (10-turn))
        
        return compare(loseResult, winResult)
    }
    
    let result = getScore(Array(repeating: 0, count: 11), 0, n, 0)
    
    return result.1 <= 0 ? [-1] : result.0
}
