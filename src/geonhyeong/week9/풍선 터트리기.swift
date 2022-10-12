// 풍선 터트리기.swift
// Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/68646
// Primary idea:
//                   1. 앞에서 시작할때 큰수여서 0(false)로 들어가더라도 뒤에서 올때 작다면 풍선을 남길수 있기 때문에 1(true)
//
// 걸린 시간 : 15:00
// Time Complexity : O()
// Space Complexity : O()
// Runtime:  ms
// Memory Usage:  MB

import Foundation

func solution(_ a:[Int]) -> Int {
    let len = a.count
    var arr = [Int](repeating: 0, count: len)
    var (start, end) = (Int.max, Int.max)
    
    for (i, num) in a.enumerated() {
        if num < start {
            start = a[i]
            arr[i] = 1
        }
        
        if a[len - i - 1] < end {
            end = a[len - i - 1]
            arr[len - i - 1] = 1
        }
    }
    
    return arr.reduce(0, +)
}
