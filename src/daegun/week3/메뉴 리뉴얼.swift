import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    
    let orderList = orders.map { $0.map { String($0) } }
    var index: [Int:Int] = [:]
    var combinations: [[Set<String>: Int]] = []
    for (idx, value) in course.enumerated() {
        index[value] = idx
        combinations.append([:])
    }
    
    func getCombination(_ original: [String], _ left: Int, _ base: Set<String>) {
        
        // course의 최댓값보다 커질 경우 종료
        if  base.count > course.last! { return }
        
        if course.contains(base.count) {
            
            let i = index[base.count]!
            if let existing = combinations[i][base] {
                combinations[i][base] = existing + 1
            } else {
                combinations[i][base] = 1
            }
            
        }
        
        for i in left..<original.count {
            var newBase = base
            newBase.insert(original[i])
            getCombination(original, i+1, newBase)
        }
    }
    
    for customer in orderList {
        getCombination(customer, 0, [])
    }
    
    var result: [String] = []
    for list in combinations {
        
        if list.isEmpty { continue }
        
        var maxCount = 2
        var maxCombinations: [Set<String>] = []
        
        for (key, value) in list {
            if value > maxCount {
                maxCount = value
                maxCombinations = [key]
            } else if value == maxCount {
                maxCombinations.append(key)
            }
        }
        
        for combination in maxCombinations {
            result.append(Array(combination).sorted(by: <).joined(separator:""))
        }
    }
    
    return result.sorted(by: <)
}
