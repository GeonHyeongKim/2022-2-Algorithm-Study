func solution(number: [Int]) -> Int {
    
    var result = 0
    
    for a in (0..<number.count) {
        for b in (a+1..<number.count) {
            for c in (b+1..<number.count) {
                if number[a]+number[b]+number[c] == 0 {
                    result += 1
                }
            }
        }
    }
    
    return result
}
