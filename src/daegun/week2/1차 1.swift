
func solution(X: String, Y: String) -> String {
    
    // 오름차순 배열로 변환
    let x = X.map { Int(String($0))! }.sorted(by: >)
    let y = Y.map { Int(String($0))! }.sorted(by: >)
    
    // 각 숫자 개수 저장할 딕셔너리
    var xDigits: [Int: Int] = [:]
    var yDigits: [Int: Int] = [:]
    
    for number in (0...9) {
        xDigits[number] = 0
        yDigits[number] = 0
    }
    
    // 각 숫자 개수 산출
    x.forEach { xDigits[$0]! = xDigits[$0]! + 1 }
    y.forEach { yDigits[$0]! = yDigits[$0]! + 1 }
    
    // 결과 확인
    var result: [String] = []
    for number in (0...9).reversed() {
        
        var count = min(xDigits[number]!, yDigits[number]!)
        if count > 0 {
            
            // 0으로만 이루어질 경우 0 하나만 append
            if number == 0 && result.isEmpty { count = 1 }
            
            // 중복되는 수 만큼 append
            for _ in (0..<count) {
                result.append(String(number))
            }
        }

    }
    
    // 값이 없는 경우
    if result.isEmpty {
        return "-1"
        
    } else {
        return result.joined(separator: "")
    }
    
}
