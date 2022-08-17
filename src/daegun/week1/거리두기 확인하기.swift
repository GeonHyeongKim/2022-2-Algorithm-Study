import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    // 각 스테이지별 실패율을 저장하는 변수
    var failures: [Int:Float] = [:]
    (1...N).forEach { failures[$0] = 0 }
    
    // stages 내림차순 정렬
    var sortedStages = stages.sorted(by: >)
    
    var prev = -1           // 이전 element 값 (현재 값과 같은지 비교)
    var currentCount = 0    // 중복되는 숫자 개수 카운팅
    for (index, stage) in sortedStages.enumerated() {
        
        // 중복 끝남
        if prev != stage {
            
            if currentCount > 0 && prev <= N {
                failures[prev] = Float(currentCount)/Float(index)
            }
            
            // prev, currentCount 초기화
            currentCount = 1
            prev = stage

        } else {
            currentCount += 1
        }
    }
    
    // 마지막 결과 가지고 한번 더 연산
    if currentCount > 0 && prev <= N {
        failures[prev] = Float(currentCount)/Float(sortedStages.count)
    }
    
    print(failures)

    // 결과 정렬 후 key 추출
    let result = failures.sorted {
        if $0.value == $01.value {
            return $0.key < $1.key
        } else {
            return $0.value > $1.value
        }
    }.map { $0.key }
    
    return result
}
