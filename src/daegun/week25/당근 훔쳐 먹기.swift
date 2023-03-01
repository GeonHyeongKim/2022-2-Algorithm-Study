import Foundation

let NT = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NT[0]   // 당근 수
let T = NT[1]   // 영양제 수

var carrots = [(taste: Int, med: Int)]()
for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    carrots.append((input[0], input[1]))
}
carrots.sort { $0.med < $1.med }

var result = 0
let startDay = T - N
for (index, carrot) in carrots.enumerated() {
    result += carrot.taste + carrot.med * (startDay + index)
}

print(result)
