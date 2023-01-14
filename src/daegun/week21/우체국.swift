/*
 틀렸습니다
 */

import Foundation

let N = Int(String(readLine()!))!

var population = [Int].init(repeating: 0, count: N+1)
for i in 1...N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    population[i] = input[1]
}

var left = 0
var right = 0

var lOffset = 0
var rOffset = 0

for i in 2...N {
    right += population[i] * (i-1)
    rOffset += population[i]
}

var result = 1
var minSum = right + left

for i in 2...N {
    lOffset += population[i-1]
    left += lOffset
    
    right -= rOffset
    rOffset -= population[i]
    
    if left + right < minSum {
        result = i
        minSum = left + right
        
    }
}

print(result)

