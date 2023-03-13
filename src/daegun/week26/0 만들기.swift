/*
 컴파일 에러
 NSExpression을 백준에서 인식하지 못함
 warning: 'NSExpression' is deprecated: NSExpression is not available in swift-corelibs-foundation
 */

import Foundation

var result = [String]()
let operators: [String] = ["+", "-", " "].sorted()

func dfs(current: String = "1", value: Int = 2, limit: Int) {
    
    // 수식 추가
    if limit >= value {
        for op in operators {
            dfs(current: current + op + String(value), value: value + 1, limit: limit)
        }
    
    // 수식 확인 후 종료
    } else {
        let trimed = current.replacingOccurrences(of: " ", with: "")
        let expression = NSExpression(format: trimed)
        if expression.expressionValue(with: nil, context: nil) as! Int == 0 {
            result.append(current)
        }
    }
    
    
    
}

for _ in 0..<Int(readLine()!)! {
    let N = Int(readLine()!)!
    
    // 한줄 띄우기
    if !result.isEmpty { result.append("") }
    dfs(limit: N)
}

for value in result {
    print(value)
}
