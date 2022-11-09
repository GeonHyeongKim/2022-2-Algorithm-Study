// 불.swift
// Question Link: https://www.acmicpc.net/problem/5427
// Primary idea:
//                   1.
//
// 걸린 시간 : 15:00
// Time Complexity : O()
// Space Complexity : O()
// Runtime:  ms
// Memory Usage:  MB

import Foundation

let testCase = Int(readLine()!)!
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]

for _ in 0..<testCase {
	let input = readLine()!.split(separator: " ").map{Int($0)!}
	let w = input[0] // 너비
	let h = input[1] // 높이
	var building = [[String]]()
	var start = (0,0)
	var fireList = [(Int,Int)]()
	var queue = [(Int,Int)]()
	var visited = [[Int]](repeating: [Int](repeating: 0, count: w), count: h)
	var answer = "" // 정답
	
	for i in 0..<h {
		let row = readLine()!.map{String($0)}
		
		// 정보 추출 - 출발, 불
		for (j, c) in row.enumerated() {
			if c == "@" {
				start = (i, j)
			} else if c == "*" {
				fireList.append((i, j))
			}
		}
		
		building.append(Array(row))
	}
	
	func fire() {
		for _ in 0..<fireList.count {
			let info = fireList.removeFirst()
			let (x, y) = (info.0, info.1)
			
			for dir in 0..<4 {
				let nx = x + dx[dir]
				let ny = y + dy[dir]
				
				if (0 <= nx && nx < h) && (0 <= ny && ny < w) {
					if building[nx][ny] != "#" && building[nx][ny] != "*" {
						building[nx][ny] = "*"
						fireList.append((nx, ny))
					}
				}
			}
		}
	}
	
	// 상근이 움직이기
	func move() -> String {
		var flag = false
		
		for _ in 0..<queue.count {
			let info = queue.removeFirst()
			let (x, y) = (info.0, info.1)
			
			for dir in 0..<4 {
				let nx = x + dx[dir]
				let ny = y + dy[dir]
				
				if (0 <= nx && nx < h) && (0 <= ny && ny < w) {
					if visited[nx][ny] == 0 && building[nx][ny] != "#" && building[nx][ny] != "*" {
						flag = true
						visited[nx][ny] = visited[x][y] + 1
						queue.append((nx, ny))
					}
				} else { // 탈출
					return String(visited[x][y])
				}
			}
		}
		
		if !flag { return "IMPOSSIBLE" }
		return ""
	}
	
	func printArr() {
		for b in building {
			print(b.joined())
		}
	}
	
	queue.append((start.0, start.1)) // bfs 초기
	visited[start.0][start.1] = 1
	
	while true {
		fire() // 불먼저
		answer = move() // 사람(상근) 움직임
		if answer != "" { break }
	}
	print(answer)
}

