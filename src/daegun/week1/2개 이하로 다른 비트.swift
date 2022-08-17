import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    
    var result: [Int64] = []
    
    for x in numbers {
        
        // 짝수일경우 무조건 f == x+1
        if x%2 == 0 {
            result.append(x+1)
        } else {
            
            // 이진수로 변환
            var binaryX = String(x, radix: 2).map { String($0) }
            
            // 1로만 이루어진 홀수일 경우 -> 가장 큰 이진 자리수에 +1
            if Int64(pow(2, Float(binaryX.count)))-1 == x {
                result.append(x+Int64(pow(2, Float(binaryX.count-1))))
                
            // 1, 0 으로 이루어진 홀수 -> 가장 작은 자리수의 01 -> 10
            } else {
                
                let index = Float(binaryX.reversed().firstIndex(of: "0")!)
                result.append(x+Int64(pow(2, index-1)))
            }
            
        }
        
    }
    
    return result
}
