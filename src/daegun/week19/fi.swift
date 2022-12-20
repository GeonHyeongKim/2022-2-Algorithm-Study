
// 테스트 케이스 3번 틀림

import Foundation

func solution(_ games: [[Int]]) -> Int {
    
    // 할인받을 수 있는 금액이 높은 순으로 정렬
    let sortedGames = games.sorted {
        ($0[0] * $0[2] / 100) < ($1[0] * $1[2] / 100)
    }
    
    let yesDiscount = Set(games.map { $0[1] })                     // 할인 품목이 있는 날 목록
    let noDiscount = yesDiscount.max()! - yesDiscount.count + 1    // 정가 구매를 진행하는 날 수
    
    var result = 0
    for (i, game) in sortedGames.enumerated() {
        
        // 정가 구매
        if i < noDiscount {
            result += game[0]
            
        // 할인 구매
        } else {
            result += game[0] - (game[0] * game[2] / 100)
            
        }
    }
    

    return result
}

print(solution([[66000, 0, 50], [16000, 2, 10], [84500, 3, 20], [5500, 2, 75]]))
print(solution([[100, 0, 50], [1000, 0, 50], [10000, 0, 50]]))
print(solution([[100, 2, 50], [100, 2, 50], [1000, 4, 50], [1000, 4, 50], [1000, 4, 50]]))
print(solution([[100, 0, 50], [100, 0, 50], [100, 0, 50], [10000, 3, 50], ]))
