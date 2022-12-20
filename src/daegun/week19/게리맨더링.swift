import Foundation

// 모든 경우의 수 도출
func getAllCases(_ N: Int) -> [[Int]] {

    var result: [[Int]] = []

    func combination(_ index: Int, _ current: [Int]) {
        
        if index == N {
            result.append(current)
        } else {
            combination(index+1, current + [index])
            combination(index+1, current)
        }
    }
    
    combination(0, [])
    
    result.removeLast()
    result.removeFirst()

    return result
}

let N = Int(readLine()!)!
let populations = readLine()!.split(separator: " ").map { Int(String($0))! }
let wholePopulation = populations.reduce(0, +)  // 전체 인구수 (== 최대 인구차이)

var edges: [[Int]] = []
for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }
    edges.append(Array(input[1...]))
}


// bfs로 그룹 안에서 모두 연결확인
func checkConnected(_ group: [Int]) -> Bool {
    
    var queue: [Int] = [group.first!]
    var queueFront = 0
    var visited = Set(queue)
    
    while queue.count > queueFront {
        
        // Pop
        let current = queue[queueFront]
        queueFront += 1
        
        for nextNode in edges[current] {
            
            if !visited.contains(nextNode) && group.contains(nextNode) {
                visited.insert(nextNode)
                queue.append(nextNode)
            }
        }
    }
    
    return visited.count == group.count
}


let allCases = getAllCases(N)   // 가능한 모든 case

var result = wholePopulation
for group in allCases {
    
    // 두 그룹으로 나누기
    let A = group
    let B = (0...N-1).filter { !A.contains($0) }
    
    // 각 인구수 총합 계산
    var populationA = 0
    for i in group { populationA += populations[i] }
    let populationB = wholePopulation - populationA
    let populationDiff = abs(populationA - populationB)
    
    // 인구수 차이가 result보다 크면 스킵
    guard populationDiff < result else { continue }

    //bfs
    if checkConnected(A) && checkConnected(B) {
        result = populationDiff
    }
    
}

print(result < wholePopulation ? result : -1)
