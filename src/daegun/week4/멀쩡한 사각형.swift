// https://school.programmers.co.kr/questions/19279

import Foundation

func solution(_ w:Int, _ h:Int) -> Int64 {
    
    // 정사각형의 경우 한 변의 길이가 정답
    if w == h { return Int64(w*h) - Int64(w) }

    var count: Int64 = 0     // 지금까지 잘린 사각형 수
    var lastY: Int64 = 0     // 이전 Y좌표
    
    for x in 1...w {
        
        let Y = Double(x)*Double(h)/Double(w)
        count += Int64((h * x + w - 1) / w) - lastY

        lastY = Int64(Y)
    }
    
    return Int64(Int64(w*h) - count)
}
