import Foundation

typealias Plan = (name: String, start: Int, playtime: Int)

func solution(_ plans:[[String]]) -> [String] {

    var plans: [Plan] = plans.map {
        let times = $0[1].split(separator: ":").map { Int(String($0))! }
        return ($0[0], (times[0] * 60) + times[1], Int($0[2])!)
    }.sorted {
        $0.start < $1.start
    }
    
    var result = [String]()
    var remain = [Plan]()
    
    for i in 0..<plans.count-1 {
        
        let currentEnd = plans[i].start + plans[i].playtime     // 현재 과제가 끝나는 시간
        let next = plans[i+1].start                             // 다음 과제 시작시간
        
        // 다음 과제 전까지 현재 과제 완료 가능
        if currentEnd <= next {
            result.append(plans[i].name)
            
            var spare = next - currentEnd
            while (spare > 0 && !remain.isEmpty) {
                
                let index = remain.count - 1
                
                if spare >= remain[index].playtime {
                    spare -= remain[index].playtime
                    result.append(remain.removeLast().name)
                    
                } else {
                    var newPlan = remain[index]
                    newPlan.playtime -= spare
                    remain[index] = newPlan
                    spare = 0
                }
            }
        // 현재 과제 완료 전 다음 과제 시작
        } else {
            let elapsedTime = plans[i+1].start - plans[i].start
            var newPlan = plans[i]
            newPlan.playtime -= elapsedTime
            remain.append(newPlan)
        }
        
    }
    
    
    result.append(plans.last!.name)
    remain.reversed().forEach { result.append($0.name) }
    
    
    return result
}
