import Foundation

let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nk[0]
let k = nk[1]

var queue: [(Int, Int)] = []
var visited = Array(repeating: false, count: 100001)

queue.append((n, 0))

while !queue.isEmpty{
    let first = queue.removeFirst()
    let location = first.0
    let time = first.1
    
    if location == k {
        print(time)
        break
        
    } else {
        if location * 2 < 100001 && !visited[location * 2]{
            visited[location * 2] = true
            queue.append((location * 2, time))
        }

        if location - 1 >= 0 && !visited[location - 1]{
            visited[location - 1] = true
            queue.append((location - 1, time + 1))
        }

        if location + 1 < 100001 && !visited[location + 1]{
            visited[location + 1] = true
            queue.append((location + 1, time + 1))
        }
    }
    


}
