
/*
 시간초과
 */

import Foundation

let target = Int(readLine()!)!   // 원하는 피자크기
let MN = readLine()!.split(separator: " ").map { Int(String($0))! }
let M = MN[0]   // A 조각 수
let N = MN[1]   // B 조각 수

var result = 0

func allCase(_ count: Int) -> [Int:Int] {
    
    var sizes = [Int]() // 조각 크기
    for _ in 0..<count {
        let size = Int(readLine()!)!
        sizes.append(size)
        if size == target { result += 1}
    }
    
    var possibleSizes = sizes
    for i in 2...count {
        
        var add = [Int]()
        for j in 0..<count {
            
            var size = 0
            for k in 0..<i {
                let index = (j + k)%count
                size += sizes[index]
            }
            if size == target {
                result += 1
            } else if size < target {
                add.append(size)
            }
        }
        possibleSizes.append(contentsOf: add)
    }
    
    var dict = [Int:Int]()
    for possibleSize in possibleSizes {
        if let exist = dict[possibleSize] {
            dict[possibleSize] = exist + 1
        } else {
            dict[possibleSize] = 1
        }
    }
    
    return dict
}

let ACount = allCase(M)
let BCount = allCase(N)

let AList = ACount.map { $0.key }.sorted()
let BList = BCount.map { $0.key }.sorted()

for a in AList {
    for b in BList {
        if a + b == target {
            result += ACount[a]! * BCount[b]!
            
        } else if a + b > target {
            break
        }
    }
}

print(result)
