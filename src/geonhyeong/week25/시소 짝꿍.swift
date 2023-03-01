// 시소 짝꿍
// Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/152996

import Foundation

func solution(_ weights:[Int]) -> Int64 {
	var positions = [[1, 1], [2, 3], [2, 4], [3, 2], [3, 4], [4, 2], [4, 3]]
	var answer: Int64 = 0
	var dict = [Int:Int]() // 무게 : 인원수

	for weight in weights {
		for pos in positions {
			var n = weight * pos[0]
			
			if n % pos[1] != 0 { continue }
			
			n /= pos[1]
			
			if let value = dict[n] {
				answer += Int64(value)
			}
		}

		dict[weight, default: 0] += 1
	}

	return answer
}
