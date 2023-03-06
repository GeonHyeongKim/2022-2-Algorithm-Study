// 0 만들기
// Question Link: https://www.acmicpc.net/problem/7490

var testCase = Int(readLine()!)!

while testCase > 0 {
	testCase -= 1
	
	let n = Int(readLine()!)!
	
	// sign : 부호, 빈칸일때는 이전 부호를 그대로 씀
	// sum	: 누적함
	// next : 다음에 연산될 숫자
	// index: 어떤 숫자가 계신되고 있는지
	// sub  : 현재 표현식
	func dfs(_ sign: Int, _ sum: Int, _ next: Int, _ index: Int, _ sub: String) {
		if index == n {
			if sum + (sign * next) == 0 {
				print(sub)
			}
			return
		}
		
		dfs(sign, sum			   , (next * 10) + index + 1, index + 1, sub + " " + "\(index + 1)")
		dfs(1 	, sum + sign * next,               index + 1, index + 1, sub + "+" + "\(index + 1)")
		dfs(-1	, sum + sign * next,               index + 1, index + 1, sub + "-" + "\(index + 1)")
	}
	
	dfs(1, 0, 1, 1, "1")
	print()
}
