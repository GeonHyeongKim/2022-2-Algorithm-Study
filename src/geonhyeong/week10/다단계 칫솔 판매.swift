// 다단계 칫솔 판매.swift
// Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/77486
// Primary idea:
//                   1.
//
// 걸린 시간 : 15:00
// Time Complexity : O()
// Space Complexity : O()
// Runtime:  ms
// Memory Usage:  MB

import Foundation

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
	var money = [Int](repeating: 0, count: enroll.count) // 돈담는 arr - 정답
	var dict = [String:Int]() // 이름:인덱스
	
	// 조직이름:index
	for (i, name) in enroll.enumerated() {
		dict[name, default: 0] = i
	}
	
	// 판매자(s), 판매액(a)
	for (s, a) in zip(seller, amount) {
		var m = a * 100 // 이익
		var s = s
		
		while s != "-" && m > 0 {
			let index = dict[s]!
			money[index] += (m - m/10)
			m /= 10
			s = referral[index]
		}
	}
	
	return money
}
