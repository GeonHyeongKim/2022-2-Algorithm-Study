import Foundation

let N = Int(readLine()!)!   // 센서 개수
let K = Int(readLine()!)!   // 집중국 개수
let sensors = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()  // 센서 좌표

if N > K {
    var offsets = [Int]()
    for i in 0..<sensors.count-1 {
        offsets.append(sensors[i+1]-sensors[i])
    }
    offsets = offsets.sorted(by: >)

    var result = 0
    for i in (K-1)..<offsets.count {
        result += offsets[i]
    }

    print(result)
} else {
    print(0)
}
