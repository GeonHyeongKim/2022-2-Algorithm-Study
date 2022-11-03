import Foundation

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]   // 벨트 길이
let K = NK[1]   // 종료 기준

var belt = readLine()!.split(separator: " ").map { Int($0)! }
var robots = [Bool].init(repeating: false, count: N)

var result = 0

while true {
    
    result += 1
    // 벨트 회전
    let lastBelt = belt.removeLast()
    belt = [lastBelt] + belt
    robots.removeLast()
    robots = [false] + robots
    if robots.last! {
        robots[N-1] = false
    }
    
    // 로봇 이동
    for i in (0..<N-1).reversed() {
        if robots[i] && !robots[i+1] && belt[i+1] > 0{
            robots[i] = false
            robots[i+1] = true
            belt[i+1] -= 1
        }
    }
    if robots.last! {
        robots[N-1] = false
    }
    
    // 로봇 올리기
    if belt[0] > 0 {
        robots[0] = true
        belt[0] -= 1
    }
    
    // 종료 체크
    var count = 0
    for belt in belt {
        if belt <= 0 {
            count += 1
        }
    }
    if count >= K {
        break
    }
}

print(result)
