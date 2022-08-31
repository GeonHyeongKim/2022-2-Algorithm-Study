// 시간 계산
func getDuration(_ from: String, _ to: String) -> Int{
    
    let a = from.split(separator: ":").map { Int($0)! }
    let b = to.split(separator: ":").map { Int($0)! }

    return (b[0]-a[0])*60 + (b[1]-a[1])
}

// String을 멜로디 array로 변환
func toNoteArray(_ note: String) -> [String] {
    
    let arr = note.map { String($0) }
    var result: [String] = []
    
    for i in 0..<arr.count {
        
        if arr[i] == "#" {
            continue
        } else if i+1<arr.count && arr[i+1] == "#" {
            result.append([arr[i], arr[i+1]].joined(separator:""))
        } else {
            result.append(arr[i])
        }
    }
    
    return result
}

// 곡이 맞는지 체크
func check(_ heard: [String], _ note: [String]) -> Bool {
    
    for start in 0..<note.count {
        
        var isContains = true
        var index = start
        for i in 0..<heard.count {
            
            if index >= note.count { index = 0 }
            
            if heard[i] != note[index] {
                isContains = false
                break
            }
            
            index += 1
        }
        
        if isContains { return true }
        
    }
    
    return false
}

func solution(_ m:String, _ musicinfos:[String]) -> String {
    
    var heard = toNoteArray(m)
    
    var notes: [String: [String]] = [:]     // 재생된 총 멜로디
    var length: [String: Int] = [:]         // 재싱된 총 시간
    var played: [String: Int] = [:]         // 입력 순서
    
    var playCount = 1
    for input in musicinfos {
        let info = input.split(separator: ",").map { String($0)}
        
        let duration = getDuration(info[0], info[1])
        let name = info[2]
        let base = toNoteArray(info[3])
        
        // 시간 내에 방송된 모든 멜로디
        var full: [String] = []
        var index = 0
        for _ in 0..<duration {
            
            if index >= base.count { index = 0 }
            
            full.append(base[index])
            
            index += 1
        }
        
        notes[name] = full
        length[name] = duration
        played[name] = playCount
        playCount += 1
    }
    
    var result = "(None)"
    
    for (key, value) in notes {

        if check(heard, value) {
            
            if result == "(None)" {
                result = key
    
            // 재생 시간이 긴 음악 우선
            } else if length[result]! < length[key]! {
                result = key

            // 먼저 입력된 음악 우선
            } else if length[result]! == length[key]! && played[result]! > played[key]!{
                result = key
            }
        }
    }
    
    return result
}
