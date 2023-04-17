// 플래닛 3
// Question Link:






let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]

func getFlower(_ board: inout [[Int]], _ start: (Int, Int), _ road: Int) -> Int {
	if road == 0 {
		return 1
	}
	
	for i in 0..<4 {
		let nx = start.0 + dx[i]
		let ny = start.1 + dy[i]
		
		if 0 <= nx && nx < board.count && 0 <= ny && ny < board.count {
			if board[nx][ny] == 1 { // 길이라서 꽃 심기 가능
				board[nx][ny] = 2
				
				if getFlower(&board, (nx, ny), road - 1) == 1 {
					 return 1
				} else {
					board[nx][ny] = 1
				}
			}
		}
	}
	
	return 0
}

func solution(boards: [[String]]) -> [Int] {
	var answer = [Int]()

	for _board in boards {
		let board = _board.map{Array($0).map{$0.wholeNumberValue!}}
		
		let len = board.count
		var newBoard = board
		var start = (0, 0)	// 캐릭터 시작위치
		var road = 0	// 길의 수
		
		for i in 0..<len {
			for j in 0..<len {
				if board[i][j] == 2 {
					start = (i, j)
				} else if board[i][j] == 1 {
					road += 1
				}
			}
		}
		
		answer.append(getFlower(&newBoard, start, road))
	}
	
	return answer
}

print(solution(boards: [["00011", "01111", "21001", "11001", "01111"], ["00011", "00011", "11111", "12101", "11111"]])) // [1, 1]
print(solution(boards: [["1111", "1121", "1001", "1111"], ["0000", "0000", "0000", "0002"], ["0000", "0100", "0000", "0002"], ["0000", "0010", "0121", "0010"]])) // [1, 1, 0, 0]
