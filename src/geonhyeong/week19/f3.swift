// f3.swift
// Question Link: https://www.acmicpc.net/problem/1525

func discount(_ price: Int, _ percent: Int) -> Int {
	return Int(Double(price) * (Double(percent) / 100.0))
}

func solution(_ games: [[Int]]) -> Int {
	var answer = 0
	var day = [Int:[(Int, Int, Int)]]() // 할인날짜:[할인금액, 할인가, 정가]
	
	var surplus = [(Int, Int, Int)]()
	
	for game in games {
		let dc = discount(game[0], game[2])
		// 할인금액, 할인가, 정가
		day[game[1], default: []].append((dc, game[0]-dc, game[0]))
	}
	
	for i in 0..<games.count {
		if let d = day[i], !d.isEmpty {
			day[i]!.sort { $0.0 > $1.0 } // 할인금액으로 정렬
			
			let target = day[i]!.removeFirst()
			answer += target.1
			surplus += day[i]!
		}
	}
	
	surplus.sort { $0.2 < $1.2 } // 정가로 정렬

	for info in surplus {
		answer += info.2
	}
	
	return answer
}

print(solution([[66000, 0, 50], [16000, 2, 10], [84500, 3, 20], [5500, 2, 75]])) // 117975
print(solution([[100, 0, 50], [1000, 0, 50], [10000, 0, 50]])) // 5550
print(solution([[100, 2, 50], [100, 2, 50], [1000, 4, 50], [1000, 4, 50], [1000, 4, 50]])) // 2700
print(solution([[100, 0, 50], [100, 0, 50], [100, 0, 50], [10000, 3, 50]])) // 5250
