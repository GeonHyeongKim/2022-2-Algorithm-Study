// 하늘에서 별똥별이 빗발친다.
// Question Link: https://www.acmicpc.net/problem/14658

let input = readLine()!.split(separator: " " ).map{Int(String($0))!}
let N = input[0] // 별똥별이 떨어지는 구역의 가로길이
let M = input[1] // 세로길이
let L = input[2] // 트램펄린의 한 변의 길이
let K = input[3] // 별똥별의 수

var list = [(x: Int, y:Int)]()

// 입력
for _ in 0..<K {
	let q = readLine()!.split(separator: " " ).map{Int(String($0))!}
	list.append((x: q[0], y: q[1]))
}

var answer = 0

// 위치 계산
func calc(x: Int, y: Int) {
	var cnt = 0
	
	for i in 0..<K { // 두 점을 모서리에 걸쳐서 트램펄린을 배치
		if (x <= list[i].x && list[i].x <= x + L) {
			if (y <= list[i].y && list[i].y <= y + L) {
				cnt += 1
			}
		}
		
		answer = max(answer, cnt)
	}
}

for i in 0..<K {
	for j in 0..<K {
		calc(x: list[i].x, y: list[j].y)
	}
}

print(K-answer)
