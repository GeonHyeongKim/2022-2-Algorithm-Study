/*
효율성 실패
*/


import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    
    var applicants: [Set<String>] = [] 
    var score: [Int] = []
    
    for input in info {
        var data = input.split(separator: " ").map { String($0) }
        
        var applicant = Set<String>()
        for i in 0..<data.count-1 {
            applicant.insert(data[i])
        }
        
        applicants.append(applicant)
        score.append(Int(data[4])!)
        
    }

    var result: [Int] = []
    for input in query {
        var data = input.split(separator: " ").map { String($0) }
        var targetScore = Int(data[7])!
        
        var querySet = Set<String>()
        for value in [data[0], data[2], data[4], data[6]] {
            if value != "-" {
                querySet.insert(value)
            }
        }
        
        var count = 0
        for i in 0..<applicants.count {
            if applicants[i].intersection(querySet) == querySet && targetScore <= score[i] {
                count += 1
            }
        }
        
        result.append(count)
    }
    
    return result
}