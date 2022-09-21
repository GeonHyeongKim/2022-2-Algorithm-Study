import Foundation

// 연산자 우선순위 순열 
func getPriority(_ operators: [String]) -> [[String]] {
    
    var result: [[String]] = []
    let size = operators.count
    
    var visited = [Bool](repeating: false, count: size)
    
    func permutation(_ current: [String]) {
        if current.count == size {
            result.append(current)
            return
        }
        for i in 0..<size {
            if !visited[i] {
                visited[i] = true
                permutation(current + [operators[i]])
                visited[i] = false
            }
        }
    }
    permutation([])
    
    return result
}

// 우선순위에 따른 결과 계산
func compute(_ expressions: [String], _ priority: [String]) -> Int64 {
    
    var expression = expressions
    
    for op in priority {
        
        var i = 0
        while i < expression.count {
            
            if expression[i] == op {
                
                let a = Int64(expression[i-1])!
                let b = Int64(expression[i+1])!
                
                var computed = ""
                if op == "+" {
                    computed = String(a+b)
                } else if op == "-" {
                    computed = String(a-b)
                // op == "*"
                } else {
                    computed = String(a*b)
                }
                
                expression.remove(at: i)
                expression.remove(at: i)
                expression[i-1] = computed
                
            } else {
                i += 1
            }
            
        }
        
    }
    
    return Int64(expression.first!)!
}

func solution(_ expression:String) -> Int64 {

    var expressions: [String] = []
    var operators = Set<String>()
    
    // 표기식에서 숫자와 연산자 분리
    var mem = ""
    for input in expression {
        
        if Int(String(input)) != nil {
            mem += String(input)
        } else {
            expressions.append(mem)
            mem = ""
            expressions.append(String(input))
            operators.insert(String(input))
        }
    }
    expressions.append(mem)
    
    // 연산자 우선순위 순열
    let priorities = getPriority(Array(operators))
    
    // 우선순위에 따라 계산시 최댓값 & 최솟값 산출
    var max: Int64 = 0
    var min: Int64 = 0
    for priority in priorities {
        let result = compute(expressions, priority)
        max = max < result ? result : max
        min = result < min ? result : min
    }
    
    min *= -1
    
    return max > min ? max : min
}