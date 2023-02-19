import Foundation

func solution(_ storey:Int) -> Int {
        
    var result = 0
    var current = storey
    
    while current != 0 {
        
        let one = current%10
        
        // 10의자리 이동 후 1의자리 차이만큼 이동
        if one > 5 {
            result += (10 - one)
            current += 10
            
        // 다음에 움직일 경우에 따라서 선택
        } else if one == 5 {
            result += 5
            
            let ten = (current/10)%10
            current += ten >= 5 ? 10 : 0
            
        // 1의 자리만 이동
        } else {
            result += one
        }
        
        current /= 10
    }
    
    
    
    return result
}
