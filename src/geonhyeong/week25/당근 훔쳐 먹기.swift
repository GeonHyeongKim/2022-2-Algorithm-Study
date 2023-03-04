// 당근 훔쳐 먹기
// Question Link: https://www.acmicpc.net/problem/18234
// point. "당근을 먹지 않을 수도 있다" 와 "항상 w<=p" 이다

let input = readLine()!.split(separator: " ").map{Int($0)!}
var (n, t) = (input[0], input[1]) // N 종류, T일 동안 재배

var carrots = [(Int, Int)]()

for _ in 0..<n {
	let input = readLine()!.split(separator: " ").map{Int($0)!}
	let (w, p) = (input[0], input[1])
	carrots.append((w, p)) // 정렬 우선순위 p
}

carrots.sort(by: {$0.1 > $1.1}) // p가 높은 순으로 내림차순 정렬 = p가 클수록 나중에 먹는 것이 이득
var rabbit = 0

for (w, p) in carrots {
	if t == 0 { break }
	
	rabbit += p * (t - 1) + w // 시간이 1씩 지날수록 P만큼 맛 + 초기값(w)
	
	t -= 1
}

print(rabbit)
