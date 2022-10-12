// 동방 프로젝트.swift
// Question Link: https://www.acmicpc.net/problem/14594
// Primary idea:
//                   1.
//
// 걸린 시간 : 15:00
// Time Complexity : O()
// Space Complexity : O()
// Runtime:  ms
// Memory Usage:  MB

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var room = [Int](repeating: 0, count: n+1)

for _ in 0..<m {
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let (first, last) = (info.first!, info.last!)
    
    for i in first..<last {
        room[i] = 1
    }
}

print(n - room.filter{$0 == 1}.count)
