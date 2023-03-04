// 마법의 엘리베이터
// Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/148653

import Foundation

func solution(_ storey:Int) -> Int {
	var cnt = 0
	var storey = storey
	
	while storey > 0 {
		let remain = storey % 10
		
		if remain < 5 {				// 0 ~ 4
			cnt += remain
		} else if remain > 5 {		// 6 ~ 9
			cnt += (10 - remain)
			storey += 10
		} else {					// 5
			if (storey / 10) % 10 > 4 {
				storey += 10
			}
			cnt += remain
		}
		storey /= 10
	}
	
	return cnt
}
