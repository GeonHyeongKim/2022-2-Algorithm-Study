/*
*  양궁대회.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/92342
*  Primary idea:   완전탐색
*                   1. len : 스테이지에 도달한 플레이어 수
*                   2. filter를 통해 '스테이지에 도달했으나 아직 클리어하지 못한 플레이어의 수' 구하기
*
*  문제 이해/풀이 : 09:13, 01:20:34
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

import Foundation

func calculation(_ apeach: [Int], _ lion: [Int]) -> Int {
    var (aScore, lScore) = (0, 0)
    for k in 0..<11 {
        if (apeach[k] == lion[k]) && (apeach[k] == 0) { // 라이언과 어피치 모두 k점에 단 하나의 화살도 맞히지 못한 경우
            continue
        }
        if apeach[k] >= lion[k] {
            aScore += k
        } else {
            lScore += k
        }
    }
    return lScore - aScore
}

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var answer = [-1]
    var point = 0
    
    // 현재 쏘는 과녁 id, 여분의 화살 개수, 어피치 점수, 라이언 점수
    func dfs(_ id: Int, _ extra: Int, _ apeach: [Int], _ lion: inout [Int]) {
        if extra < 0 { return }
        
        // 최종 점수 계산
        if id > 10 {
            let diff = calculation(apeach, lion)
            if diff <= 0 { return } // 어피치의 점수보다 낮거나 같으면, 우승은 어피치
            if diff > point {
                point = diff
                answer = lion.reversed()
                answer[10] += extra
            }
            return
        }
        
        // 어피치가 쏜 점수보다 높이 쏘기
        lion[id] = apeach[id] + 1
        dfs(id + 1, extra - lion[id], apeach, &lion)
        
        // 복구
        lion[id] = 0
        dfs(id + 1, extra, apeach, &lion)
    }
    
    var lion = [Int](repeating: 0, count: 11)
    dfs(0, n, info.reversed(), &lion)
    
    return answer
}
