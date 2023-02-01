import Foundation

let NMLK = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NMLK[0] // 구역 가로
let M = NMLK[1] // 구역 세로
let L = NMLK[2] // 트램펄린 한변
let K = NMLK[3] // 별동별 개수

var falls = [[Int]]()
for _ in 0..<K {
    falls.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var checkX = [Int](Set(falls.map { $0[0] })).sorted()
var checkY = [Int](Set(falls.map { $0[1] })).sorted()

var result = 1
for y in checkY {

    for x in checkX {

        var count = 0

        for current in falls {
            if (x <= current[0] && current[0] <= x + L) && (y <= current[1] && current[1] <= y + L) {
                count += 1
            }
        }

        result = count > result ? count : result
    }
}

print(K - result)
