func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    
    var answer = ""
    var number = 0
    var length = 0
    while length < (t*m)+p {
        
        var newNumber = String(number, radix: n)
        answer += newNumber
        length += newNumber.count
        number += 1
    }
    
    var result: [String] = []
    var answerList = answer.map { String($0) }
    for i in 0..<t {
        result.append(answerList[i*m+p-1])
    }
    
    return result.joined(separator: "").uppercased()
}