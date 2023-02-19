import Foundation

let N = Int(readLine()!)!   // 톱니바퀴 개수
var gears = [[Int]]()       // 톱니바퀴 상태
for _ in 0..<N {
    gears.append(readLine()!.map { Int(String($0))! })
}

let K = Int(readLine()!)!   // 회전 횟수
var rotations = [[Int]]()   // 회전 방법
for _ in 0..<K {
    rotations.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var first = [Int].init(repeating: 0, count: N)

func rotateLeft(_ current: Int, _ offset: Int){

    guard current >= 1 else { return }
    
    var rotateTill = current
    
    for i in (1...current).reversed() {
        let left = gears[i][(first[i] + 6) % 8]
        let right = gears[i-1][(first[i-1] + 2) % 8]
        
        if left != right  {
            rotateTill -= 1

        } else {
            break
        }
    }
    
    var lastRotation = offset * (-1)
    for i in (rotateTill..<current).reversed() {
        first[i] = (first[i] + lastRotation + 8) % 8
        lastRotation *= -1
    }
}

func rotateRight(_ current: Int, _ offset: Int){

    guard current < N-1 else {
        first[current] = (first[current] + offset + 8) % 8
        return
    }

    var rotateTill = current

    for i in current..<N-1 {
        let right = gears[i][(first[i] + 2) % 8]
        let left = gears[i+1][(first[i+1] + 6) % 8]

        if left != right  {
            rotateTill += 1
        } else {
            break
        }
    }
    
    var lastRotation = offset
    for i in (current...rotateTill) {
        first[i] = (first[i] + lastRotation + 8) % 8
        lastRotation *= -1
    }
}

for rotation in rotations {

    let current = rotation[0] - 1
    let offset = -1 * rotation[1]

    rotateLeft(current, offset)
    rotateRight(current, offset)

}

var result = 0
for (idx, value) in first.enumerated() {
    if gears[idx][value] == 1 {
        result += 1
    }
}

print(result)

