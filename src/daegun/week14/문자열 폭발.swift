import Foundation

var base = String(readLine()!)
let explosive = String(readLine()!)

var stack: [Character] = []

for s in base {
    stack.append(s)

    if s == explosive.last! {
        let count = stack.count

        if count >= explosive.count && String(stack[(count-explosive.count)...]) == explosive {
            
            for _ in 0..<explosive.count {
                stack.removeLast()
            }
        }
    }

}

print(stack.isEmpty ? "FRULA" : String(stack))
