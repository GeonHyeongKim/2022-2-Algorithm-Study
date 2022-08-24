func solution(want: [String], number: [Int], discount: [String]) -> Int {
    
    // 원하는 제품과 수량
    var wants: [String: Int] = [:]
    for (product, count) in zip(want, number) {
        wants[product] = count
    }
    
    var result = 0
    for n in (0...discount.count-10) {
        
        var match = wants
        for i in (n..<n+10) {
            
            if want.contains(discount[i]) {
                let oldValue = match[discount[i]]!
                if oldValue > 0 {
                    match[discount[i]] = oldValue - 1
                }
            }
        }
        
        var isOk = true
        for element in match {
            if element.value != 0 {
                isOk = false
                break
            }
        }
        
        if isOk { result += 1 }
        
    }
    
    
    return result
}

print(solution(want: ["banana", "apple", "rice", "pork", "pot"], number: [3, 2, 2, 2, 1], discount: ["chicken", "apple", "apple", "banana", "rice", "apple", "pork", "banana", "pork", "rice", "pot", "banana", "apple", "banana"]))
print(solution(want: ["apple"], number: [10], discount: ["banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana"]))
