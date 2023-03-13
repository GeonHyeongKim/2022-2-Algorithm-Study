// 탈출
// Question Link: https://www.acmicpc.net/problem/3055

let input = readLine()!.split(separator: " ").map{Int($0)!}
let row = input.first!
let col = input.last!
var map = [[Character]](repeating: [Character](repeating: Character("."), count: col), count: row)
var hedgehog = [Point]() // 고슴도치 위치
var water = [Point]() // 물 위치
var endPoint: Point

for i in 0..<row {
	let str = readLine()!
	for (j, c) in str.enumerated() {
		if c == "S" { // 시작지점
			hedgehog.append(Point(i, j))
		} else if c == "*" { // 물의 위치
			water.append(Point(i, j))
		} else if c == "D" { // 도착지점
			endPoint = Point(i, j)
		}
		map[i][j] = c
	}
}

let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]

var answer = 0

while true {
	answer += 1
	if hedgehog.count == 0 {
		print("KAKTUS")
		break
	}
	
	extendWater()
	if extendHedgehog() {
		print(answer)
		break
	}
}

// 고슴도치 확장 경로 계산
func extendHedgehog() -> Bool {
	let size = hedgehog.count
	
	for _ in 0..<size {
		let h = hedgehog.removeFirst()
		
		// 고슴도치 이동
		for i in 0..<4 {
			let x = h.x + dx[i]
			let y = h.y + dy[i]
			
			if x < 0 || x >= row || y < 0 || y >= col { continue } // 경계선
			
			if map[x][y] == "." {
				map[x][y] = "S"
				hedgehog.append(Point(x, y))
			} else if map[x][y] == "D" {
				return true
			}
		}
	}
	return false
}

// 물이 확장되는 경로 계산
func extendWater() {
	let size = water.count
	
	for _ in 0..<size {
		let w = water.removeFirst()
		
		for i in 0..<4 {
			let x = w.x + dx[i]
			let y = w.y + dy[i]
			
			if x < 0 || x >= row || y < 0 || y >= col { continue } // 경계선
			
			if map[x][y] == "." {
				map[x][y] = "*"
				water.append(Point(x, y))
			}
		}
	}
}

struct Point {
	var x: Int
	var y: Int
	
	init(_ x: Int, _ y: Int) {
		self.x = x
		self.y = y
	}
}
