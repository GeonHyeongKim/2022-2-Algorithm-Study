/*
 시간 초과
 */

import Foundation

func solution(_ weights:[Int]) -> Int64 {
    
    let distances = [2, 3, 4]
    
    var possibleWeight = [Int:Set<Int>]()
    
    var result: Int64 = 0
    for (index, weight) in weights.enumerated() {
        var pair = Set<Int>()
        for distance in distances {
            
            let multiplied = distance * weight
            
            if let existingSet = possibleWeight[multiplied] {
                var newSet = existingSet
                newSet.insert(index)
                possibleWeight[multiplied] = newSet
                
                for item in newSet where item != index {
                    pair.insert(item)
                }
                
            } else {
                possibleWeight[multiplied] = [index]
            }
        }
        result += Int64(pair.count)
    }
    
    return result
}
