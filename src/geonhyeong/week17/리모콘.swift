// 리모컨.swift
// Question Link: https://www.acmicpc.net/problem/1107
// Primary idea:

import Foundation

let target = Int(readLine()!)! 	// 맞춰야하는 채널
let broken = Int(readLine()!)!	// 고장난 버튼 갯수
var brokenBtn = [Bool](repeating: false, count: 10)

// 고장난 버튼
for btn in readLine()!.split(separator: " ").map({Int($0)!}) {
	brokenBtn[btn] = true
}

var answer = abs(100-target) // 현재 채널에서 + 혹은 -만 사용하여 이동하는 경우

for num in 0...500_000*2 {
	let strNum = String(num)
	
	for (j, str) in strNum.enumerated() {
		let n = str.wholeNumberValue!
		
		if brokenBtn[n] { // 각 숫자가 고장났는지 확인 후, 고장 났으면 break
			break
		} else if j == strNum.count - 1 {
			// 고장난 숫자 없이 마지막 자리까지 왔다면 answer 비교 후 업데이트
			answer = min(answer, abs(num - target) + strNum.count)
		}
	}
}

print(answer)
