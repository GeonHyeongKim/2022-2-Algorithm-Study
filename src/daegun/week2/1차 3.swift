func solution(order: [Int]) -> Int {
    
    var stack: [Int] = []
    var result = 0
    
    // 새로운 상자 처리
    for input in (1...order.count) {
        
        if !stack.isEmpty {
            if stack.last == order[result] {
                result += 1
                stack.removeLast()
            }
        }
        
        if order[result] == input {
            result += 1
        } else {
            stack.append(input)
        }
    }
    
    // stack에 남아있는 상자 처리
    while !stack.isEmpty {
        if stack.last == order[result] {
            result += 1
            stack.removeLast()
        } else {
            break
        }
    }
    
    
    
    return result
}

print(solution(order: [4, 3, 1, 2, 5]))
print(solution(order: [5, 4, 3, 2, 1]))
