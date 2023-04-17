// 과제 진행하기
// Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/176962

import Foundation

func convertMin(_ time: String) -> Int {
	let info = time.components(separatedBy: ":").map{Int($0)!}
	let (hour, minute) = (info[0], info[1])
	return hour * 60 + minute
}

func solution(_ plans:[[String]]) -> [String] {
	var stack = [(String, Int, Int)]() // 과제명, 시작시간, 걸린시간
	var answer = [String]()
	
	// 시작시간 기준 오름차순 정렬
	var plans = plans.sorted{$0[1] < $1[1]}
		
	for plan in plans {
		let (subject, start, time) = (plan[0], convertMin(plan[1]), Int(plan[2])!)
		
		if !stack.isEmpty {
			var last = stack.removeLast()
			var (preSubject, preStart, preTime) = (last.0, last.1, last.2)
			var diff = start - preStart
			
			if diff < preTime {
				// 과제가 아직 안끝났을 경우, 다시 넣어줌
				stack.append((preSubject, preStart, preTime-diff))
			} else {
				answer.append(preSubject)
				diff -= preTime
				
				while !stack.isEmpty && diff > 0 {
					last = stack.removeLast()
					(preSubject, preStart, preTime) = (last.0, last.1, last.2)
					
					if diff < preTime {
						// 과제가 아직 안끝났을 경우, 다시 넣어줌
						stack.append((preSubject, preStart, preTime-diff))
						break
					} else {
						answer.append(preSubject)
						diff -= preTime
					}
				}
			}
		}
		
		stack.append((subject, start, time))
	}
	
	return answer + stack.reversed().map{$0.0}
}
