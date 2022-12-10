// 귤 고르기.swift
// Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/138476?language=swift

import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
	var dic = [Int:Int]() // 종류:갯수
	var answer = 0
	
	for t in tangerine {
		dic[t, default: 0] += 1
	}
	
	var sum = 0
	for (_, cnt) in dic.sorted(by: {$0.value > $1.value}) {
		answer += 1
		sum += cnt
		
		if sum >= k {
			return answer
		}
	}
	
	return answer
}

print(solution(6, [1, 3, 2, 5, 4, 5, 2, 3]	)) // 3
print(solution(4, [1, 3, 2, 5, 4, 5, 2, 3]	)) // 2
print(solution(2, [1, 1, 1, 1, 2, 2, 2, 3]	)) // 1
