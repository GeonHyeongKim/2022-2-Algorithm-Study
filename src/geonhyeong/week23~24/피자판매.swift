// 피자판매
// Question Link: https://www.acmicpc.net/problem/2632

import Foundation

let size = Int(readLine()!)!
let AB = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n) = (AB[0], AB[1])

var mList = [Int]()
var nList = [Int]()

for _ in 0..<m {
	mList.append(Int(readLine()!)!)
}

for _ in 0..<n {
	nList.append(Int(readLine()!)!)
}

// 하나의 피자에서 나올 수 있는 모든 경우의 수
func find(pizza: [Int], length: Int) -> [Int:Int] {
	var dic = [Int:Int]()
	
	for i in 0..<length {
		let p = pizza[i...] + pizza[0..<i]
		var pre = 0
		
		for num in p {
			pre += num
			dic[pre, default: 0] += 1
		}
	}
	dic[pizza.reduce(0, +), default: 0] = 1
	return dic
}

let caseA = find(pizza: nList, length: n)
let caseB = find(pizza: mList, length: m)

var res = (caseA[size] ?? 0) + (caseB[size] ?? 0)
