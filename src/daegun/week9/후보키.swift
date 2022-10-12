/*
 컴파일 에러
 */

import Foundation

func combinations(_ size: Int, _ targetNum: Int) -> [[Int]] {
    var result = [[Int]]()
    let nums = Array(0..<size)
    
    func combination(_ index: Int, _ nowCombi: [Int]) {
        if nowCombi.count == targetNum {
            result.append(nowCombi)
            return
        }
        for i in index..<nums.count {
            combination(i + 1, nowCombi + [nums[i]])
        }
    }
    
    combination(0, [])
    
    return result
}

func isMinimumKey(_ history: Set<String>, _ str: String) -> Bool {
    
    for key in history {
        
        var count = 0
        for attribute in key {
            if str.contains(attribute) {
                count += 1
            }
        }
        
        if count == key.count {
            return false
        }
        
    }
    
    return true
}

func isUniqueKey(_ relation: [[String]], _ columns: [Int]) -> Bool {
    var history = Set<String>()
        
    for i in 0..<relation.first!.count {
        
        var str = ""
        for j in columns {
            str += relation[j][i]
        }
        
        if history.contains(str) {
            return false
        } else {
            history.insert(str)
        }
    }
    
    return true
}

func solution(_ relation:[[String]]) -> Int {
    
    // attribute 끼리 모아준다
    var attributes = [[String]].init(repeating: [], count: relation.last!.count)
    for tuple in relation {
        for i in 0..<tuple.count {
            attributes[i].append(tuple[i])
        }
    }
    
    // primary key 찾기
    var isUnique = [Bool].init(repeating: true, count: relation.last!.count)
    for i in 0..<attributes.count {
        
        var history = Set<String>()

        for attribute in attributes[i] {
            
            if history.contains(attribute) {
                isUnique[i] = false
            } else {
                history.insert(attribute)
            }
        }
        
    }
    
    // Primary Key 제외 후 개수를 result에 증가
    var result = 0
    for i in (0..<isUnique.count).reversed() {
        if isUnique[i] {
            result += 1
            attributes.remove(at: i)
        }
    }
    
    // 나머지 attributes로 가능한 모든 조합
    var allCombination: [[Int]] = []
    for i in 2...attributes.count {
        allCombination.append(contentsOf: combinations(attributes.count, i))
    }
    
    var candidateKeys = Set<String>()
    for combination in allCombination {
        
        let str = combination.map { String($0) }.joined(separator: "")
        
        // 최소성 검사
        let isMinimum = isMinimumKey(candidateKeys, str)
        
        guard isMinimum else { continue }
        
        // 유일성 검사
        var newKey: [[String]] = []

        for i in combination {
            newKey.append(attributes[i])
        }
        
        if isMinimum && isUniqueKey(attributes, combination) {
            candidateKeys.insert(str)
        }
    }
    
    return result + candidateKeys.count
}
