// 좋다.swift
// Question Link: https://www.acmicpc.net/problem/1253

import Foundation

let n = Int(readLine()!)!
var list = readLine()!.split(separator: " ").map{Int($0)!}
var answer = 0

list.sort()

for i in 0..<n {
	let temp = Array(list[0..<i] + list[i+1..<n])
	var (left, right) = (0, temp.count - 1)
	
	while left < right {
		let sum = temp[left] + temp[right]
		
		if sum < list[i] {
			left += 1
		} else if sum > list[i] {
			right -= 1
		} else {
			answer += 1
			break
		}
	}
}

print(answer)
