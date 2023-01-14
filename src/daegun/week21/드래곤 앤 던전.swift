/*
 틀렸습니다
 */

import Foundation

let NAtk = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NAtk[0]
var atk = NAtk[1]

// [1, 몬스터공격력, 몬스터생명력]
// [2, 용사 공격력 증가수치, 용사 생명력 회복수치]
var rooms: [[Int]] = []
for _ in 0..<N {
    rooms.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var damaged = 0     // 누적 데미지
var maxDamaged = 0  // 한 방에서 받은 최대 데미지

for room in rooms {
    
    // 몬스터방
    if room[0] == 1 {
        let roomDamage = (room[2]-1)/atk * room[1]
        
        damaged += roomDamage
        maxDamaged = max(maxDamaged, damaged, roomDamage)
        
        
    // 포션방
    } else {
        atk += room[1]
        damaged -= room[2]
        
        
    }
    
}

print(max(damaged, maxDamaged) + 1)
