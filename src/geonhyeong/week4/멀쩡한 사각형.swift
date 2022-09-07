/*
*  멀쩡한 사각형.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/62048
*  Primary idea:   <최대, 최소>
*                   1. 
*
*  걸린 시간 : 05:00, 53:00
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    let gcd = GCD(min(w,h), max(w,h))
    let block = gcd == 1 ? (w+h)-1 : (w+h)-gcd
    return Int64((w*h) - block)
}

// 최대 공약수
func GCD(_ min: Int, _ max: Int) -> Int {
    let remain = min % max
    return remain == 0 ? max : GCD(max, remain)
}

// 최소 공배수
func LCD(_ base:Int, _ other:Int) -> Int {
    return base * other / GCD(base, other)
}
