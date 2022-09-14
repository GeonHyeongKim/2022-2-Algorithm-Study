/*
*  합승 택시 요금.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/72413
*  Primary idea:   플로이드 와샬 or 다익스트라
*                   1. 
*
*  걸린 시간 : 05:00, 53:00
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var answer = Int.max
    let maxFare = 200 * 100000 // 최대 요금 (지점 * 간선)
    var graph = [[Int]](repeating: [Int](repeating: maxFare, count: n + 1), count: n + 1)

    // graph 입력 - 양방향
    for fare in fares {
        let from = fare[0]
        let to = fare[1]
        let cost = fare[2]
        
        // 양방향 그래프
        graph[from][to] = cost
        graph[to][from] = cost
    }
    
    // 자기 자신까지의 요금(0) 계산 - 대각선
    for node in 1...n {
        graph[node][node] = 0
    }

    // 플로이드 와샬 - k 지점을 거쳐가는 경우가 요금이 싸다면, 갱신
    for k in 1...n { // 거쳐가는 node
        for i in 1...n {
            for j in 1...n {
                graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])  // i -> j vs i -> k -> j(k를 거쳐가는 비용을 비교)
            }
        }
    }
    
    // 중간지점을 하나씩 설정하여 최솟값을 구함
    for mid in 1...n {
        answer = min(answer, graph[s][mid] + graph[mid][a] + graph[mid][b])
    }

    return answer
}

print(solution(6, 4, 6, 2, [[4, 1, 10], [3, 5, 24], [5, 6, 2], [3, 1, 41], [5, 1, 24], [4, 6, 50], [2, 4, 66], [2, 3, 22], [1, 6, 25]])) // 82
