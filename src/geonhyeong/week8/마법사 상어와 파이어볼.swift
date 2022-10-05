/*
*  마법사 상어와 파이어볼.swift
*  Question Link: https://www.acmicpc.net/problem/20056
*  Primary idea:   튜플
*                   1. 
*
*  걸린 시간 : 15:00
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m, k) = (input[0], input[1], input[2])
var fireballs = [[Int]]()

for _ in 0..<m {
    let input2 = readLine()!.split(separator: " ").map{Int($0)!}
    let (ri, ci, mi, si, di) = (input2[0]-1, input2[1]-1, input2[2], input2[3], input2[4]) // r행 c열, 질량, 속력, 방향
    
    fireballs.append([ri, ci, mi, si, di])
}

let dx = [-1, -1, 0, 1, 1, 1, 0, -1] // 방향 - 12시부터 시계 방향으로 0~7
let dy = [0, 1, 1, 1, 0, -1, -1, -1]
var board = [[[[Int]]]](repeating: [[[Int]]](repeating: [[Int]](), count: n), count: n)

for _ in 0..<k {
    // 파이어볼 이동
    while !fireballs.isEmpty {
        let fireball = fireballs.removeFirst()
        let (ri, ci, mi, si, di) = (fireball[0], fireball[1], fireball[2], fireball[3], fireball[4])
        let _r = (ri + si * dx[di]) < 0 ? n + (ri + si * dx[di]) : (ri + si * dx[di]) % n // 1번-N번 행 연결되어있기 때문
        let _c = (ci + si * dy[di]) < 0 ? n + (ci + si * dy[di]) : (ci + si * dy[di]) % n
        board[_r][_c].append([mi, si, di])
    }
    
    // 2개 이상 합쳐져 있는지 체크
    for r in 0..<n {
        for c in 0..<n {
            if board[r][c].count > 1 { // 2개 이상인 경우 -> 4개의 파이어볼로 쪼개기
                var (sumM, sumS, odd, even) = (0, 0, 0, 0)
                let cnt = board[r][c].count
                
                // 조건을 위한 계산
                while !board[r][c].isEmpty {
                    let data = board[r][c].removeFirst()
                    let (mi, si, di) = (data[0], data[1], data[2])
                    sumM += mi
                    sumS += si
                    if di % 2 == 0 { // 짝수
                        even += 1
                    } else {         // 홀수
                        odd += 1
                    }
                }
                
                let dir: [Int]
                if odd == cnt || even == cnt { // 모두 홀수이거나 모두 짝수인 경우
                    dir = [0, 2, 4, 6]
                } else {
                    dir = [1, 3, 5, 7]
                }
                
                if sumM / 5 != 0 {
                    for d in dir {
                        fireballs.append([r, c, sumM/5, sumS/cnt, d])
                    }
                }
            } else if board[r][c].count == 1 {
                fireballs.append([r, c] + board[r][c].removeFirst())
            }
        }
    }
}


var sumM = 0
for fireball in fireballs {
    sumM += fireball[2]
}

print(sumM)
