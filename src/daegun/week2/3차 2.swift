func solution(ingredient: [Int]) -> Int {
    
    var result = 0
    var tower = ingredient
    
    while tower.count >= 4 {
        
        var isOver = true
        
        for i in 0..<tower.count-3 {
            
            // 조건 만족
            if tower[i] == 1 && tower[i+1] == 2 && tower[i+2] == 3 && tower[i+3] == 1 {

                result += 1
                tower.removeSubrange(i...i+3)   // 삥 포장 -> 쌓인 재료에서 제거
                isOver = false
                break
            }
        }
        
        // 쌓인 재료에서 햄버거가 없다
        if isOver { break }

    }
    
    return result
}
