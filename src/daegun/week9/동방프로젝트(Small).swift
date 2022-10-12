import Foundation

let N = Int(readLine()!)!
var rooms = [Bool].init(repeating: true, count: N)

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { Int($0)!-1 }
    
    let range = input[0]+1...input[1]
    rooms.replaceSubrange(range, with: repeatElement(false, count: range.count))
}

var result = 0
for room in rooms {
    if room {
        result += 1
    }
}

print(result)
