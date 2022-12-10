import Foundation

let N = Int(readLine()!)!       // 이동하려는 채널
let M = Int(readLine()!)!       // 고장 버튼 수
var available = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]     // 사용가능 버튼 목록
if M > 0 {
    let unavailable = readLine()!.split(separator: " ").map { Int($0)! }
    available = Array(Set(available).subtracting(Set(unavailable)))
}

// 기본값: +/- 버튼만 이용한 경우
var result = abs(N - 100)

let digitLimit = String(N).count+1
let digits = available.map { String($0) }

// 남은 키패드로 누를 수 있는 숫자 경우의 수
func combination(_ n: Int, _ number: String) {
    
    guard n <= digitLimit else { return }
    
    if n > 0 {
        let newResult = abs(Int(number)! - N) + n
        result = newResult < result ? newResult : result
    }
    
    for digit in digits {
        combination(n+1, number+digit)
    }
    
}

// 이미 채널에 도착한 경우가 아니고, 고장난 키가 없는경우
if result != 0 && M == 0 {
    result = min(result, String(N).count)
} else {
    combination(0, "")
}
    
print(result)
