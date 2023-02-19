// 이모티콘 할인행사
// Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/150368

import Foundation

var percentArr: [[Int]] = []

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
	let users = users.sorted{ $0[0] > $1[0] } // sale을 기준으로 내림차순
	let sales = [10, 20, 30, 40].filter({ $0 >= users.last![0] })

	// 이모티콘의 할인가격 조합 구하기
	dfs(0, [], emoticons.count, sales)
	
	var finalEmotiPlusCnt = 0	// 이모티콘 플러스 서비스 가입 수
	var finalSum = 0			// 이모티콘 매출액

	for percent in Set(percentArr) {
		var emotiplusCnt = 0	// 현재 할인 비율에서 이모티콘 플러스 서비스 가입 수
		var sum = 0				// 현재 할인 비율에서 이모티콘 매출액

		for user in users {
			var userSum = 0

			for (index, p) in percent.enumerated() {
				// 유저의 기준비율에 맞는 이모티콘만 선별하기
				if p >= user[0] {
					userSum += calDiscountPrice(emoticons[index], p)
				}
			}

			// 유저의 기준가격(user[1])을 넘긴다면 이모티콘 플러스 가입
			if userSum >= user[1] {
				emotiplusCnt += 1 // 가입
			} else {
				sum += userSum
			}
		}

		// 현재 할인 비율 모음이 최대 이모티콘 플러스 가입자를 이끌어내는지 확인
		if emotiplusCnt > finalEmotiPlusCnt {
			finalEmotiPlusCnt = emotiplusCnt
			finalSum = sum
		} else if emotiplusCnt == finalEmotiPlusCnt {
			finalSum = max(finalSum, sum)
		}
	}

	return [finalEmotiPlusCnt, finalSum]
}

func dfs(_ index: Int, _ arr: [Int], _ max: Int, _ sales: [Int]) {
	if index == max {
		percentArr.append(arr)
		return
	}

	for sale in sales {
		dfs(index + 1, arr + [sale], max, sales)
	}
}

// 이모티콘 할인 가격 계산
func calDiscountPrice(_ origin: Int, _ percent: Int) -> Int {
	return origin - ((origin / 100) * percent)
}
