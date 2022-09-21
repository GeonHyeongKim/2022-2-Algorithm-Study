import Foundation

func duration(_ inOut: [String]) -> Int {
    
    let from = inOut[0].split(separator: ":").map { Int(String($0))! }
    let to = inOut[1].split(separator: ":").map { Int(String($0))! }
    
    return (to[0] - from[0]) * 60 + (to[1] - from[1])
}

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    
    
    var inOut: [Int: [String]] = [:]    // 번호: [입차시각, 출차시각]
    var timeSum: [Int: Int] = [:]       // 번호: 누적주차시간(분)
    for record in records {
        var input = record.split(separator: " ").map { String($0) }
        
        let number = Int(input[1])!
        let time = input[0]
        
        if var existing = inOut[number] {
            inOut[number] = nil
            existing[1] = time
            
            if var count = timeSum[number] {
                timeSum[number] = count + duration(existing)
            } else {
                timeSum[number] = duration(existing)
            }
            
        } else {
            inOut[number] = [time, "23:59"]
        }
    }
    for time in inOut {
        if var count = timeSum[time.key] {
            timeSum[time.key] = count + duration(time.value)
        } else {
            timeSum[time.key] = duration(time.value)
        }
    }
    
    var prices: [Int:Int] = [:]
    for info in timeSum {
        
        var price = fees[1]
        if info.value > fees[0] {
            price += Int(ceil(Float(info.value-fees[0])/Float(fees[2]))) * fees[3]
        }
        
        prices[info.key] = price
    }
    
    return prices.sorted { $0.key < $1.key }.map { $0.value }
}