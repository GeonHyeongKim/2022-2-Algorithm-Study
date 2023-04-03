import Foundation

let N  = Int(readLine()!)!
let honey = readLine()!.split(separator: " ").map { Int(String($0))! }
let sum = honey.reduce(0, +)

var result = 0

// 벌 - 벌 - 꿀통
var left = sum - honey[0]
var right = sum - honey[0]
for i in 1..<N {
    right -= honey[i]
    result = max(result, left - honey[i] + right)
}

// 벌 - 꿀통 - 벌
result = max(result, sum - honey[0] - honey[N-1] + honey.max()!)

// 꿀통 - 벌 - 벌
left = sum - honey[N-1]
right = sum - honey[N-1]
for i in (1..<N-1).reversed() {
    left -= honey[i]
    result = max(result, right - honey[i] + left)
    print(i, right - honey[i] + left)
}

print(result)
