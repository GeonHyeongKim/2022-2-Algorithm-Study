// 인사고과
// Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/152995

import Foundation

func solution(_ scores:[[Int]]) -> Int {
	var answer = 1
	let wanho = scores[0]					// 원호의 점수
	let wanhoSum = wanho[0] + wanho[1]		// 원호의 총합

	var scores = scores
	// 1. 근무태도로 내림차순
	// 2. 근무태도가 같은 경우 동료 평가 점수로 오름차순
	scores.sort {
		if $0[0] == $1[0] {
			return $0[1] < $1[1]
		} else {
			return $0[0] > $1[0]
		}
	}

	var maxScore = 0
	
	for score in scores {
		if score[1] < maxScore { 				// 현재 사원의 동료평가 점수가 앞 사원들의 제일 높은 동료평가 점수보다 낮을 경우
			if score == wanho { 				// 완호라면 인센티브를 받지 못함
				return -1
			}
		} else {
			maxScore = score[1]					// 현재, 앞 사원들의 동료평가 점수 중 제일 높은 점수
			if wanhoSum < score[0] + score[1] { // 현재 사원이 완호의 점수합 보다 높을 경우 완호의 석차 증가
				answer += 1
			}
		}
	}
	return answer
}

print(solution([[2,2],[1,4],[3,2],[3,2],[2,1]]))
