/*
*  실패율.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/42889?language=swift
*  Primary idea:   구현
*                   1. len : 스테이지에 도달한 플레이어 수
*                   2. filter를 통해 '스테이지에 도달했으나 아직 클리어하지 못한 플레이어의 수' 구하기
*
*  문제 이해/풀이 : 05:29, 17:11
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

import Foundation

//MARK: - 오래된 버전 - 지금은 filter때문에 시간초과
func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var len = stages.count
    var res = [(Int, Double)]() // 스테이지, 실패율
    
    for i in 1...N {
        let cnt = stages.filter{$0 == i}.count
        
        let fail = len == 0 ? 0.0 : Double(cnt) / Double(len)
        res.append((i, fail))
        len -= cnt
    }
    
    return res.sorted(by: {$0.1 > $1.1}).map{$0.0}
}

//MARK: - 통과 버전
import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var len = stages.count
    var res = [(Int, Double)]() // 스테이지, 실패율
    var stageCnt = [Int:Int]() // 스테이지, 도달 유저
    
    // 초기화
    for i in 1...N {
        stageCnt[i] = 0
    }
    
    // 갯수 세기
    for i in 0..<stages.count {
        stageCnt[stages[i], default: 0] += 1
    }
    
    for i in 1...N {
        let cnt = stageCnt[i]!
        let fail = len == 0 ? 0.0 : Double(cnt) / Double(len)
        res.append((i, fail))
        len -= cnt
    }
    
    return res.sorted(by: {$0.1 > $1.1}).map{$0.0}
}

