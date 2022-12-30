// 녹색 옷 입은 애가 젤다지?.swift
// Question Link: https://www.acmicpc.net/problem/4485

import Foundation

var problem = 1
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]

func bfs(caveSize: Int, cave: [[Int]]) -> Int {
	var queue = [(0, 0, cave[0][0])]
	var distance = [[Int]](repeating: [Int](repeating: Int.max, count: caveSize), count: caveSize)
	distance[0][0] = 0
	
	while !queue.isEmpty {
		let first = queue.removeFirst()
		let (x, y, cost) = (first.0, first.1, first.2)
		
		if x == caveSize - 1 && y == caveSize - 1 {
			return distance[x][y]
		}
		
		for dir in 0..<4 {
			let nx = x + dx[dir]
			let ny = y + dy[dir]
			
			if 0 <= nx && nx < caveSize && 0 <= ny && ny < caveSize {
				let newCost = cost + cave[nx][ny]
				
				if newCost < distance[nx][ny] {
					distance[nx][ny] = newCost
					queue.append((nx, ny, newCost))
					queue.sort {
						return $0.2 < $1.2
					}
				}
			}
		}
	}
	
	return distance[caveSize-1][caveSize-1]
}

while true {
	let n = Int(readLine()!)! 	// 동굴의 크기
	if n == 0 { break }
	var cave = [[Int]]()
	var cost = 0
	
	for _ in 0..<n {
		let row = readLine()!.split(separator: " ").map{Int($0)!}
		cave.append(row)
	}
	
	cost = bfs(caveSize: n, cave: cave)
	
	print("Problem \(problem): \(cost)")
	problem += 1
}
