import Foundation

// 문자열 자르기
func slice(_ s: String, _ size: Int) -> [String] {
    
    var result: [String] = []
    
    var current: String = ""
    for letter in s {
        current += String(letter)
        if current.count == size {
            result.append(current)
            current = ""
        }
    }
    
    result.append(current)
    
    return result
}

// 압축한 길이
func compress(_ sliced: [String]) -> Int {
    
    var result = ""
    var prev = ""
    var count = 0
    
    for chunk in sliced {
        
        // 이전 글자 없음
        if prev == "" {
            prev = chunk
            count += 1
            
        // 이전 글자와 중복
        } else if prev == chunk {
            count += 1
        
        // 이전 글자와 다름 -> 압축 내용 추가
        } else {
            
            result += count > 1 ? "\(count)\(prev)" : prev
            prev = chunk
            count = 1
        }
        
    }
    
    // 처리되지 않은 값 추가
    result += count > 1 ? "\(count)\(prev)" : prev
    
    return result.count
}



func solution(_ s:String) -> Int {
    
    if s.count < 3 { return s.count }
    
    var shortest = s.count
    
    for size in 1...s.count/2 {
        let sliced = slice(s, size)
        let compressed = compress(sliced)

        if compressed < shortest {
            shortest = compressed
        }
    }
    
    
    return shortest
}
