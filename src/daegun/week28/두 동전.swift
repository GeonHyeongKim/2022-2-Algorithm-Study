import Foundation

// 입출력
let RC = readLine()!.split(separator: " ").map { Int(String($0))! }
let R = RC[0]
let C = RC[1]

typealias Space = (r: Int, c: Int)
var coin = [Space]()

var board = [[String]]()
for r in 0..<R {
    let row = readLine()!.map { String($0) }
    board.append(row)
    
    for (c, space) in row.enumerated() {
        if space == "o" {
            coin.append((r, c))
        }
    }
}

// Space 함수
func moveCoin(_ coin: Space, _ offset: Space) -> Space {
    
    let newCoin: Space = (coin.r + offset.r, coin.c + offset.c)
    if isOnboard(newCoin) == false {
        return newCoin
    } else {
        return board[newCoin.r][newCoin.c] != "#" ? newCoin : coin
    }
}

func isOnboard(_ space: Space) -> Bool {
    return (space.r >= 0 && space.r < R) && (space.c >= 0 && space.c < C)
}

func encode(_ a: Space, _ b: Space) -> String {
    return "\(a.r)|\(a.c)|\(b.r)|\(b.c)"
}


// BFS
var result = 11

var queue = [(coin1: coin[0], coin2: coin[1], cost: 0)]
var queueFirst = 0

let offsets: [Space] = [(-1, 0), (0, 1), (0, -1), (1, 0)]
var visited: [String:Int] = [:]
visited[encode(coin[0], coin[1])] = 0

while queueFirst < queue.count {

    let current = queue[queueFirst]
    queueFirst += 1
    
    let coin1 = current.coin1
    let coin2 = current.coin2
    let cost = current.cost
    
    guard result > cost else { continue }
    
    for offset in offsets {
        
        let newCoin1 = moveCoin(coin1, offset)
        let newCoin2 = moveCoin(coin2, offset)
        let newCost = cost + 1
        
        let isCoin1OnBoard = isOnboard(newCoin1)
        let isCoin2OnBoard = isOnboard(newCoin2)
        
        // 둘 모두 안떨어진 경우
        if isCoin1OnBoard && isCoin2OnBoard {
            
            if let existing = visited[encode(newCoin1, newCoin2)] {
                if existing <= newCost {
                    continue
                }
            }
            queue.append((newCoin1, newCoin2, newCost))
            visited[encode(newCoin1, newCoin2)] = newCost
            
        // 하나만 떨어진 경우
        } else if isCoin1OnBoard || isCoin2OnBoard {
            result = min(result, newCost)
        }
    }
    
}

print(result)
print(result < 11 ? result : -1)

