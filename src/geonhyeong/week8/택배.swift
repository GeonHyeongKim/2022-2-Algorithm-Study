/*
*  택배.swift
*  Question Link: https://www.acmicpc.net/problem/8980
*  Primary idea:   정렬
*                   1. 
*
*  걸린 시간 : 15:00
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, capacity) = (input[0], input[1])    // 마을 개수, 트럭 용량
let m = Int(readLine()!)!                   // 주문량
var orderList = [[Int]]()                   // [출발 마을, 도착 마을, 택배 개수]

for _ in 0..<m {
    let input2 = readLine()!.split(separator: " ").map{Int($0)!}
    let (from, to, box) = (input2[0], input2[1], input2[2])
    orderList.append([from, to, box])
}

// Point. 받는 마을의 번호를 기준으로 '오름차순' 정렬하는 것
// 1. 받는 마을의 번호를 기준으로 orderList 배열을 정렬
// 2. 받는 마을의 번호이 같을 경우, 보내는 마을으로 정렬
orderList.sort {
    if $0[1] == $1[1] {
        return $0[0] < $1[0]
    } else {
        return $0[1] < $1[1]
    }
}

var answer = 0                                  // 최대 박스 갯수
var boxByTown = [Int](repeating: 0, count: n+1) // 마을 별 적재중인 택배 개수

for i in 0..<m {
    let (from, to, curBox) = (orderList[i][0], orderList[i][1], orderList[i][2])
    let max = boxByTown[from..<to].max()!
    
    if max < capacity {
        var add: Int
        
        if curBox + max > capacity {
            add = capacity - max
        } else {
            add = curBox
        }
        answer += add // 더해지는 택배 개수를 answer에 추가
        
        // 현재 택배가 지나가는 마을들에 add만큼의 택배 개수를 추가
        for j in from..<to {
            boxByTown[j] += add
        }
    }
}

print(answer)

