// 로봇 시뮬레이션.swift
// Question Link: https://www.acmicpc.net/problem/2174
// Primary idea:
//                   1.
//
// 걸린 시간 : 15:00
// Time Complexity : O()
// Space Complexity : O()
// Runtime:  ms
// Memory Usage:  MB

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let (a, b) = (input[0], input[1])
let input2 = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (input2[0], input2[1])

var board = [[Int]](repeating: [Int](repeating: 0, count: a), count: b)
let dirDic: [String:Int] = ["N":0, "E":1, "S":2, "W":3]
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]
var robot: [(Int, Int, Int)] = [(0, 0, 0)]

// 각 로봇의 초기 위치(x, y좌표 순)및 방향
for i in 1...n {
	let input3 = readLine()!.split(separator: " ")
	let (x, y, d) = (Int(input3[0])!-1, Int(input3[1])!, String(input3[2]))
	
	board[b-y][x] = i // 로봇 초기 위치
	robot.append((b-y, x, dirDic[d]!))
}

//  각 명령이 명령을 내리는 순서 입력
var orders = [(Int, String, Int)]()
for _ in 0..<m {
	let input4 = readLine()!.split(separator: " ")
	let (robotType, orderType, repeating) = (Int(input4[0])!, String(input4[1]), Int(input4[2])!)
	orders.append((robotType, orderType, repeating))
}

// 실행
for order in orders {
	let (robotType, orderType, repeating) = (order.0, order.1, order.2)

	switch orderType {
	case "L":
		let _robot = robot[robotType]
		var (x, y, d) = (_robot.0, _robot.1, _robot.2)

		for _ in 0..<repeating {
			d = (d+3) % 4
		}
		robot[robotType] = (x, y, d)
	case "R":
		let _robot = robot[robotType]
		var (x, y, d) = (_robot.0, _robot.1, _robot.2)
		
		for _ in 0..<repeating {
			d = (d+1) % 4
		}
		robot[robotType] = (x, y, d)
	default: // F
		for i in 0..<repeating {
			let _robot = robot[robotType]
			let (x, y, d) = (_robot.0, _robot.1, _robot.2)
			
			let nx = x + dx[d]
			let ny = y + dy[d]
//			print("Robot \(robotType) F: \(i) d: \(d), (\(x), \(y)) -> (\(nx), \(ny))")

			// 벽에 부딪히는 경우
			if 0 > nx || nx >= b || 0 > ny || ny >= a {
				print("Robot \(robotType) crashes into the wall")
				exit(0)
			}
			
			// 서로 충돌
			if board[nx][ny] != 0 {
				print("Robot \(robotType) crashes into robot \(board[nx][ny])")
				exit(0)
			}
			
			board[x][y] = 0
			board[nx][ny] = robotType
			robot[robotType] = (nx, ny, d)

		}
	}
}

print("OK")

func printArr() {
	for i in board {
		print(i)
	}
}
