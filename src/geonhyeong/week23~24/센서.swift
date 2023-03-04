// 센서
// Question Link: https://www.acmicpc.net/problem/2212

let n = Int(readLine()!)!
let center = Int(readLine()!)!
var sensor = readLine()!.split(separator: " ").map { Int($0)! }

if center >= n {
	print(0)
} else {
	sensor.sort() // 인접한 센서들 간의 거리의 차를 구할 것이기 때문에 -> ex) 1, 3, 6, 6, 7, 9

	var answer = [Int]()
	for i in 0..<n-1 {
		answer.append(sensor[i+1] - sensor[i]) // 인접한 센서들 간의 거리 차이 -> ex) 2, 3, 0, 1, 2 -> 2, (3), (0, 1, 2) -> 3이 기준이 된다.
	}

	answer.sort() // ex) 0, 1, 2, 2, 3
	print(answer[0..<n-center].reduce(0, +)) // 앞에서부터 n-k개를 더해준다는 것 == 센서 간의 거리의 차가 가장 큰 값을 k-1개 빼주는 것
}

