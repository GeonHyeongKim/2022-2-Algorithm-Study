/*
*  메뉴 리뉴얼.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/72411
*  Primary idea:   <key-value>
*                   1. 
*
*  걸린 시간 : 05:10, 34:11
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var result = [String]()
    var dic = [String:Int]() // 조합별:갯수
    
    // dfs
    func dfs(_ base: String, _ depth: Int, _ start: Int, _ subStr: String) {
        if subStr.count == depth {
            dic[subStr, default: 0] += 1
        }
        
        for i in start..<base.count {
            let index = base.index(base.startIndex, offsetBy: i)
            dfs(base, depth, i + 1, subStr + String(base[index]))
        }
    }
    
    // 모든 조합 갯수 세기
    for o in orders {
        for c in course {
            dfs(String(o.sorted()), c, 0, "")
        }
    }
    
    // 조건에 맞는 정답 찾기
    for c in course {
        let combiList = dic.filter{$0.key.count == c}
        let maxValue = combiList.values.max()
        
        for combi in combiList {
          if combi.value == maxValue && combi.value >= 2 {
            result.append(combi.key)
          }
        }
    }
    
    return result.sorted()
}
