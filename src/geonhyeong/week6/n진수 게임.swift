/*
*  n진수 게임.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/17687
*  Primary idea:   구현
*
*  걸린 시간 :
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var str = ""
    var answer = ""
    
    // 문자의 최대 길이
    for i in 0..<t*m  {
        str += String(i, radix: n)
    }
    
    // 대문자로 변경
    str = str.uppercased()
    var arrStr = Array(str)
    
    for i in stride(from: p-1, to: t*m, by: m) {
        answer += String(arrStr[i])
    }
    
    return answer
}
