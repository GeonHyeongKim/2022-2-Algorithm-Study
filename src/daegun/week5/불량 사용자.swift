import Foundation

// 불량 사용자 확인
func check(_ banned: String, _ user: String) -> Bool {
    
    if banned.count != user.count {
        return false
    }
    
    let bannedArray = banned.map { String($0) }
    let userArray = user.map { String($0) }
    
    for index in 0..<bannedArray.count {
        
        if bannedArray[index] != "*" && bannedArray[index] != userArray[index] {
            return false
        }
    }
    
    return true
}

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    
    var match: [Int: [String]] = [:]
    
    for user in user_id {
        
        for (idx, banned) in banned_id.enumerated() {
            if check(banned, user) {
                if var existing = match[idx] {
                    existing.append(user)
                    match[idx] = existing
                } else {
                    match[idx] = [user]
                }
            }
        }
    }

    var bannedList = match.map { $1 }
    print(bannedList)
    // 경우의 수 확인
    var result = 0
    var visited: [[String]] = []
    func getCase(_ users: [String], _ depth: Int) {
        
        if depth == bannedList.count {
            
            if !visited.contains(users) {
                result += 1
                visited.append(users)
            }
        
            return
        }
        
        for banned in bannedList[depth] {
            if users.contains(banned) {
                var newUsers = users
                newUsers.remove(at: users.index(of: banned)!)
                getCase(newUsers, depth+1)
            }
        }
        
    }
    
    getCase(user_id, 0)
    
    
    
    return result
}
