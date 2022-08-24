func solution(topping: [Int]) -> Int {
    
    var result = 0
    
    var a: [Int] = []
    var b: [Int] = topping
    
    for split in (0..<topping.count) {
        
        a.append(topping[split])
        b.removeFirst()
        
        if Set(a).count == Set(b).count {
            result += 1
        }
        
    }
    
    return result
}
