/*
 시간초과
 */


import Foundation

func solution(_ scores:[[Int]]) -> Int {
    
    // 완호가 인센티브를 받지 못하는 경우
    for score in scores {
        if scores[0][0] < score[0] && scores[0][1] < score[1] {
            return -1
        }
    }
    
    // 근무태도 기준으로 오름차순 정렬, 같으면 동료 평가 기준 오름차순 정렬
    let newScores = scores.sorted {
        
        if $0[0] != $1[0] {
            return $0[0] < $1[0]
        } else {
            return $0[1] > $1[1]
        }
        
    }
    var result = 1                                      // 완호보다 앞순위에 해당하는 사원수 + 1
    
    for i in 0..<newScores.count {
        
        // 원호이거나 원호보다 점수가 낮으면 스킵
        guard newScores[i] != scores[0]  else { continue }
        guard (scores[0][0] + scores[0][1] < newScores[i][0] + newScores[i][1]) else { continue }
        
        var isGet = true    // i번 사원이 인센티브를 받을 수있는지 여부
        
        for j in i+1..<newScores.count {
            
            if (newScores[i][0] < newScores[j][0]) && (newScores[i][1] < newScores[j][1]) {
                isGet = false
                break
            }
        }
        
        // 인센티브를 받을수 있으면서 완호보다 점수가 높은 사원만 count
        if isGet { result += 1 }
    }

    
    return result
}
