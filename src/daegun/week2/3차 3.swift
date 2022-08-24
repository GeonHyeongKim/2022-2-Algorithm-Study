func solution(distance: Int, scope: [[Int]], times: [[Int]]) -> Int {
    
    var reach = 0   // 도달한 거리
    let routine = times.map { [Bool].init(repeating: true, count: $0[0]) + [Bool].init(repeating: false, count: $0[1]) }
    
    while distance-1 > reach {
        
        // 첫번째 경비에게 발각
        if routine[0][reach%routine[0].count] && (scope[0][0]...scope[0][1]).contains(reach+1) {
            break
            
        }
        
        // 두번째 경비에게 발각
        if routine[1][reach%routine[1].count] && (scope[1][0]...scope[1][1]).contains(reach+1){
            break
        }
        
        reach += 1
    }
    
    return reach + 1
}
