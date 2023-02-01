import Foundation

let NTG = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NTG[0]  // 시작 숫자
let T = NTG[1]  // 버튼 최대 입력수
let G = NTG[2]  // 목표 숫자

var visited = [Int].init(repeating: T+1, count: 100000)
var queue = [(N, 0)]
var queueFront = 0
var result = T+1

while queueFront < queue.count {
    
    // Pop
    let n = queue[queueFront].0
    let count = queue[queueFront].1
    queueFront += 1
    
    // 종료 조건
    if n == G {
        result = min(result, count)
        continue
    }
    
    // 사전 탈출 조건
    guard n <= 99999 else { continue }          // N이 99,999를 넘어가는 순간 탈출에 실패
    guard count <= result else { continue }     // 현재가 최소 성공값보다 크면 취소
    guard visited[n] > count else { continue }  // visited 체크
    visited[n] = count
    
    // A) N += 1
    queue.append((n + 1, count + 1))
    
    // B) N*2 한뒤 [0이 아닌 가장 높은자리수] -1
    if n == 0 {
        queue.append((n, count + 1))
    } else if n*2 <= 99999 {
        var stringN = String(n*2).map { String($0) }
        stringN[0] = String(Int(stringN[0])! - 1)
        queue.append((Int(stringN.joined(separator: ""))!, count + 1))
    }
    
}

print(result == T + 1  ? "ANG" : result)

