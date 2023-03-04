// 사탕가게
// Question Link: https://www.acmicpc.net/problem/4781
// 가장 높은 칼로리를 얻을 수 있도록 사탕을 구매하기!

while true {
	let input = readLine()!
	if input == "0 0.00" {
		break
	}
	
	let info = input.split(separator: " ")
	// 참고: 0.5 를 더해준다음 Integer형으로 바꿔 소수점 이하의 자리를 버리기!
	let (n, money) = (Int(info[0])!, Int(Double(info[1])! * 100 + 0.5)) // 사탕의 종류, 상근이의 돈
	
	var candies = [(Int, Int)]()
	
	for _ in 0..<n {
		let input = readLine()!.split(separator: " ")
		let (calory, pay) = (Int(input[0])!, Int(Double(input[1])! * 100 + 0.5)) // 칼로리, 가격
		candies.append((calory, pay))
	}
		
	// 돈이 i일때, 사탕 중 가장 높은 칼로리
	var dp = [Int](repeating: 0, count: 10_001) // 상근이의 돈 Max

	for i in 1...money {
		for j in 0..<n {
			let curCalory = candies[j].0		// 캔디 칼로리
			let curPay = candies[j].1			// 캔디 가격
			
			if i < curPay { continue }
			
			dp[i] = max(dp[i], dp[i-curPay] + curCalory)
		}
	}

	print(dp[money])
}
