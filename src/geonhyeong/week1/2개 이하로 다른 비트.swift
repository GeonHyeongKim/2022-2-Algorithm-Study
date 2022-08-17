/*
*  2개 이하로 다른 비트.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/77885#
*  Primary idea:   <비트마스크>
*                   1. x가 짝수일경우, 1개만 달라도 정답이니 +1을 더한 값이 f(x)
*                   2. x가 홀수일 경우, (2개 까지 변경 가능)
*                     1) 가장 오른쪽에 있는 0의 위치 찾기 -> +1을 하면 가장 오른쪽의 0이 1로 변경
*                     2) 0의 위치에서 그 오른쪽에 있는 수를 0으로 변경
*
*  걸린 시간 : 43분 38초
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    var res = [Int64]()
    
    for number in numbers {
        if number % 2 == 0 { // 짝수
            res.append(number + 1)
        } else { // 홀수
            let lastZero = (number + 1) & ~number
            let leftNum = ~(lastZero >> 1)
            res.append((number | lastZero) & leftNum)
        }
    }
    return res
}

