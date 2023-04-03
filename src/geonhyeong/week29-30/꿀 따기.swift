// 꿀 따기
// Question Link: https://www.acmicpc.net/problem/21758

// 참고함
let n = Int(readLine()!)!
var honey = readLine()!.split(separator: " ").map{Int($0)!}

var left = [Int](repeating: 0, count: n+2)
var right = [Int](repeating: 0, count: n+2)

// 편하게 계산하기 위해
honey = [0] + honey

// 왼쪽에서 오른쪽으로 날아깔때
for i in 1...n {
	left[i] = left[i-1] + honey[i]
}

// 오른쪽에서 왼쪽으로 날아깔때
for i in (1...n).reversed() {
	right[i] = right[i + 1] + honey[i]
}

var answer = 0

// case1. 벌 - 벌 - 꿀통
// 최대한 꿀을 따려면
//	1. 벌 1마리를 가장 왼쪽에
//	2. 양동이를 가장 오른쪽에
for i in 2..<n {
	let first = left[n] - left[1]
	let second = left[n] - left[i]
	let secondBee = honey[i] // 첫번째 친구 기준으로 두번째 벌의 위치의 꿀은 모으면 안됨
	let total = first + second - secondBee
	answer = max(answer, total)
}

// case2. 꿀통 - 벌 - 벌
for i in (2..<n).reversed() {
	let first = right[1] - right[n]
	let second = right[1] - right[i]
	let secondBee = honey[i] // 첫번째 친구 기준으로 두번째 벌의 위치의 꿀은 모으면 안됨
	let total = first + second - secondBee
	answer = max(answer, total)
}

// case3. 벌 - 꿀통 - 벌
// i는 꿀통
// 벌들의 자기 위치를 뺴준다
for i in (2..<n).reversed() {
	let first = left[i] - honey[1]
	let second = right[i] - honey[n]
	let total = first + second
	answer = max(answer, total)
}

print(answer)
