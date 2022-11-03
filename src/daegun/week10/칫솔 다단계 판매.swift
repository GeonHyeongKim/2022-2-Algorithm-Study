import Foundation

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    
    var enrollNum: [String: Int] = [:]
    for (num, name) in enroll.enumerated() {
        enrollNum[name] = num
    }
    
    var result = [Int].init(repeating: 0, count: enroll.count)

    for (name, amount) in zip(seller, amount) {
        
        var profit = amount*100
        var current = name
        
        while current != "-" && profit > 0 {
            let sendAmount = Int(Double(profit) * 0.1)
            
            result[enrollNum[current]!] += (profit - sendAmount)
            
            profit = sendAmount
            current = referral[enrollNum[current]!]
        }
    }
    
    
    return result
}
