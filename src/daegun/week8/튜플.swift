import Foundation

// String을 2차원 Array로 변형
func stringToArrays(_ s: String) -> [[Int]] {
    
    let sliced = String(s[s.index(s.startIndex, offsetBy: 2)..<s.index(s.startIndex, offsetBy: s.count-2)])
    let seperated = sliced.components(separatedBy: "},{")
    let result = seperated.map { $0.split(separator: ",").map { Int(String($0))! } }

    return result
}

func solution(_ s:String) -> [Int] {

    var expressions = stringToArrays(s).sorted { $0.count < $1.count }
    
    var tuple: [Int] = []

    for expression in expressions {
        tuple.append(Set(expression).subtracting(Set(tuple)).first!)
    }
    
    
    return tuple
}
