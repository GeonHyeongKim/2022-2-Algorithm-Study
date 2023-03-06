// 호텔 대실
// Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/155651

import Foundation

func convertMinToSec(_ time: String) -> Int {
	let info = time.split(separator: ":").map{Int($0)!}
	let (hour, minute) = (info[0], info[1])
	return hour * 60 + minute
}

func solution(_ book_time:[[String]]) -> Int {
	let sorted = book_time.sorted {
		return $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0]
	}
	
	var room = [Int]()
	
	for book in sorted {
		let start = convertMinToSec(book[0])
		
		if let index = room.firstIndex {$0 <= start} {
			room[index] = convertMinToSec(book[1]) + 10
		} else { // 시작 시간과 같거나 작은 값이 없는 경우
			// 종료시간 변경
			room.append(convertMinToSec(book[1]) + 10) // 종료시작 + 10분
		}
	}
	
	return room.count
}
