/*
*  숫자 게임.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/12987?language
*  Primary idea:   정렬
*                   1. 
*
*  걸린 시간 : 10:00
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var a = a.sorted(by: >)
    var b = b.sorted(by: >)
    var answer = 0
    
    var i = 0
    for aNum in a {
        if aNum < b[i] { // b팀이 처음으로 이기기 시작한 시점 부터 b의 인덱스를 증가
            i += 1
            answer += 1
        }
    }
    
    return answer
}
