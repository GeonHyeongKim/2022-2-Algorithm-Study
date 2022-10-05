/*
*  튜플.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/64065
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

func solution(_ s:String) -> [Int] {
    var result = [Int]()
    let tuples = s.components(separatedBy: ["{","}"]).filter({$0 != "" && $0 != ","})
    let sortedTuples = tuples.sorted{$0.count < $1.count} // 갯수로 오름차순

    for tuple in sortedTuples {
        let removeComma = tuple.split(separator: ",").map{Int($0)!}
        
        for element in removeComma {
            if !result.contains(element) {
                result.append(element)
            }
        }
    }
    
    return result
}
