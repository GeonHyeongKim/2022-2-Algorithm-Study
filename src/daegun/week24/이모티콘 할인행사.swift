import Foundation

// 비율을 기준 할인율에 맞게 맞춰줌
func convertPercent(_ percent: Int) -> Int {
    if percent%10 == 0 {
        return percent
    } else {
        return (percent/10 + 1)*10
    }
}

// 할인 정보 모든 경우의 수 도출
func combination(_ percents: [Int], _ length: Int) -> [[Int]] {
    
    var result = [[Int]]()
    
    func combi(_ current: [Int] = []) {
        
        if current.count == length {
            result.append(current)
            
        } else {
            for percent in percents {
                combi(current + [percent])
            }
        }
    }
    
    combi()
    
    return result
}

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    
    let users = users.map { (percent: $0[0], price: $0[1]) }
    var result = [0, 0]
    
    let percents = Array(Set(users.map { convertPercent($0.percent) })).sorted(by: <)
    let allCases = combination(percents, emoticons.count)

    for saleCase in allCases {
        
        var currentResult = [0, 0]
        for user in users {
            var buyPrice = 0
            var isSubscribed = false
            for (percent, emoticon) in zip(saleCase, emoticons) {
                
                if percent >= user.percent {
                    buyPrice += emoticon * (100-percent)/100
                }
                
                if buyPrice >= user.price {
                    currentResult[0] += 1
                    isSubscribed = true
                    break
                }
            }
            
            if !isSubscribed { currentResult[1] += buyPrice }
        }
        
        if (currentResult[0] > result[0]) || (currentResult[0] == result[0] && currentResult[1] > result[1]) {
            result = currentResult
        }
        
    }
    
    return result
}
