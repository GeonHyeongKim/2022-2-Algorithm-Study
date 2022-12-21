
/*
 
 메모리 초과
 
 */

import Foundation

let TW = readLine()!.split(separator: " ").map { Int(String($0))! }
let T = TW[0]   // 떨어지는 시간
let W = TW[1]   // 자두 최대 움직이는 횟수

var fall: [Int] = []
for _ in 0..<T {
    fall.append(Int(readLine()!)!)
}


// visited[현재시간] = [0(빈값), 1번일때 받은최대, 2번일때 받은최대]
let wVisited = [Int].init(repeating: 0, count: W + 1)
var visited = [[[Int]]].init(repeating: [[], wVisited, wVisited], count: T)

// t: 현재시간, under: 현재위치, w: 움직인 횟수, get: 받은 자두 수
typealias State = (t: Int, under: Int, w: Int, get: Int)
var queue: [State] = [(0, 1, 0, 0)]
var queueFront = 0

var result = 0
while queue.count > queueFront {

    // pop
    let now = queue[queueFront]
    queueFront += 1
    
    // 시간 종료
    if now.t == T {
        result = result < now.get ? now.get : result
        continue
    }
    
    let nowFall = fall[now.t]
    
    if visited[now.t][nowFall][now.w] <= now.get {
        visited[now.t][nowFall][now.w] = now.get
    } else {
        continue
    }

    // 안움직여도 자두를 받을 수 있음
    if nowFall == now.under {
        queue.append((now.t + 1, now.under, now.w, now.get + 1))

    // 움직여야 자두를 받을 수 있음
    } else {
        queue.append((now.t + 1, now.under, now.w, now.get))    // 안움직이기
        
        if now.w < W {
            queue.append((now.t + 1, nowFall, now.w + 1, now.get + 1))    // 움직이기
        }
    }
}

print(result)
