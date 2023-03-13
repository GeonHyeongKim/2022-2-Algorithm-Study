import Foundation

func timeToMin(_ time: String) -> Int {
    let num = time.split(separator: ":").map { Int(String($0))! }
    return num[0] * 60 + num[1]
}

func solution(_ book_time:[[String]]) -> Int {
    
    let minutes = book_time.map { [timeToMin($0[0]), timeToMin($0[1]) + 10] }
    let points = minutes.flatMap { $0 }
    
    var result = 0
    for point in points {
        
        var count = 0
        for minute in minutes {
            if minute[0] <= point && point < minute[1] { count += 1 }
        }

        result = max(result, count)
    }
        
    return result
}
