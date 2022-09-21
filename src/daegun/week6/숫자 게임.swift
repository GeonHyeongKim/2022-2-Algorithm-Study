import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    
    let B = b.sorted(by: >)
    
    var result = 0
    for a in a.sorted(by: >) {
        result += B[result] > a ? 1 : 0
    }
    
    return result
}