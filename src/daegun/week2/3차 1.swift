func solution(a: Int, b: Int, n: Int) -> Int {
    
    var left = n
    var result = 0
    
    while left >= a {
        
        let get = left/a*b
        result += get
        left = left%a + get
    }
    
    return result
}
