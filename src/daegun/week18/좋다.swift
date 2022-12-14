import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)

var result = 0
for i in 0..<A.count {
    
    var front = 0
    var rear = A.count-1

    while true {
        
        // i번째 제외
        if front == i { front += 1 }
        if rear == i { rear -= 1 }
        
        // 종료 조건
        guard front < rear else { break }
        
        // 비교
        let added = A[front] + A[rear]
        if added < A[i] {
            front += 1

        } else if added == A[i] {
            result += 1
            break

        } else {
            rear -= 1
        }

    }
    
}

print(result)

