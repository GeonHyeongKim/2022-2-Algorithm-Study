/*
*  행렬 테두리 회전하기.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/77485?language=swift
*  Primary idea:   구현
*                   1. 회전은 직접 index를 계산해야한다.
*
*  문제 이해/풀이 : 02:15, 37:19
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var answer = [Int]()
    var board = [[Int]](repeating: [Int](repeating: 0, count: columns), count: rows)
    var num = 1
    
    // init
    for i in 0..<rows {
        for j in 0..<columns {
            board[i][j] = num
            num += 1
        }
    }
    
    // rotation
    for query in queries {
        var (x, y, xx, yy) = (query[0]-1, query[1]-1, query[2]-1, query[3]-1)
        var temp = board[x][y]
        var minValue = temp
        
        // ▶
        for j in y+1...yy {
            (minValue, temp, board[x][j]) = (min(minValue, board[x][j]), board[x][j], temp)
        }

        // ▼
        for i in x+1...xx {
            (minValue, temp, board[i][yy]) = (min(minValue, board[i][yy]), board[i][yy], temp)
        }
        
        // ◀
        for j in (y..<yy).reversed() {
            (minValue, temp, board[xx][j]) = (min(minValue, board[xx][j]), board[xx][j], temp)
        }
        
        // ▲
        for i in (x..<xx).reversed() {
            (minValue, temp, board[i][y]) = (min(minValue, board[i][y]), board[i][y], temp)
        }
        
        answer.append(minValue)
    }

    return answer
}
