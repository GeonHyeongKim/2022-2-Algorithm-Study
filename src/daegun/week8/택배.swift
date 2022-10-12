import Foundation

let NC = readLine()!.split(separator: " ").map { Int($0)! }
let N = NC[0]   // 마을 수
let C = NC[1]   // 용량

typealias Task = (from: Int, to: Int, amount: Int)
var tasks: [Task] = []  // (보내는곳, 받는곳, 박스수)

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    tasks.append((input[0], input[1], input[2]))
}
tasks.sort {
    $0.to < $1.to
}

var result = 0
var inCar = [Int].init(repeating: 0, count: N+1)  // task[받는곳] = 박스 수

for task in tasks {
    
    let max = inCar[task.from...task.to].max()!
    if max < C {
        let add = task.amount + max > C ? C - max : task.amount
        result += add
        
        for j in task.from..<task.to {
            inCar[j] += add
        }
    }
}

print(result)
