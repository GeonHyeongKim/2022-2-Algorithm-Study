import Foundation

func solution(_ n:Int) -> [Int] {
    
    var triangle: [[Int]] = []
    (1...n).forEach { triangle.append([Int].init(repeating: 0, count: $0)) }

    let max = n%2 == 0 ? (n+1)*(n/2) : (n+1)*(n/2)+(n/2)+1
    
    let offsets = [ (0,1), (1,0), (-1,-1) ] // 아래, 오른쪽, 위
    var offset = offsets[0] // 현재 방향의 offset
    var index = (0,0)       // 현재 index
    
    var number = 1         // 현재 숫자
    while number <= max {
        
        triangle[index.1][index.0] = number
        
        var newIndex = index
        newIndex.0 += offset.0
        newIndex.1 += offset.1
        
        if offset == offsets[0] {
            
            if newIndex.1 >= n || triangle[newIndex.1][newIndex.0] != 0 {
                offset = offsets[1]
                newIndex = index
                newIndex.0 += offset.0
                newIndex.1 += offset.1
            }
            
        } else if offset == offsets[1] {
            
            if newIndex.0 >= n || triangle[newIndex.1][newIndex.0] != 0 {
                offset = offsets[2]
                newIndex = index
                newIndex.0 += offset.0
                newIndex.1 += offset.1
            }
            
        } else if offset == offsets[2] {
            
            if newIndex.1 < 0 || triangle[newIndex.1][newIndex.0] != 0 {
                offset = offsets[0]
                newIndex = index
                newIndex.0 += offset.0
                newIndex.1 += offset.1
            }
        }
        
        number += 1
        index = newIndex
    }
    
    
    return triangle.flatMap { $0 }
}
