// 효율성 통과 실패

import Foundation

func solution(_ gems:[String]) -> [Int] {
    
    // 보석의 종류 계산
    var gemType: Set<String> = []
    for gem in gems {
        gemType.insert(gem)
    }
    let totalGems = gemType.count
    
    var gemCount: [String: Int] = [:]
 
    // start...last
    var start = 0
    var last = 0
    
    var result = [0, gems.count-1]
    
    while start < gems.count{
        
        // 결과 비교
        if gemCount.count == totalGems {
            if result[1]-result[0] > last-start {
                
                if last-start == totalGems-1 {
                    return [start, last]
                } else {
                    result = [start, last]
                }
                
            }
            
        } else {
            
            // 한칸 진행
            if last < gems.count-1 {
                
                let added = gems[last+1]
                gemCount[added] = gemCount[added] == nil ? 1 : gemCount[added]!+1
                last += 1
            
            // 맨 앞으로 되돌아감
            } else {

                gemCount = [:]
                start += 1
                last = start
            }
            
        }
    }
    
    return result.map { $0 + 1 }
}
