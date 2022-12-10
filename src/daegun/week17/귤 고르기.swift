import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    
    var counts: [Int: Int] = [:]    // counts[크기] = 개수
    for size in tangerine {
        
        if let existing = counts[size] {
            counts[size] = existing + 1
        } else {
            counts[size] = 1
        }
    }
    
    // counts를 value(개수) 내림차순으로 정렬
    let sorted = counts.sorted {
        $0.value > $1.value
    }.map { $0.value }
    
    var result = 0
    var sum = 0
    // 개수가 많은 것 부터 상자에 넣어 몇 종류가 들어갔는지 확인
    for n in sorted {
        sum += n
        
        if sum <= k {
            result += 1
        } else if sum - n < k {
            result += 1
            break

        } else {
            break
        }
    }

    
    return result
}
