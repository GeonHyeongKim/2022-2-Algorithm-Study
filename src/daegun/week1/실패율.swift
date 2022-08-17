import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    
    var result: [String] = []
    
    // 키패드 번호 위치 좌표
    let location: [String: (Int, Int)] = [
        "1": (0,0), "2": (1,0), "3": (2,0),
        "4": (0,1), "5": (1,1), "6": (2,1),
        "7": (0,2), "8": (1,2), "9": (2,2),
        "*": (0,3), "0": (1,3), "#": (2,3),
    ]
    var leftHand = location["*"]!    // 왼손 위치
    var rightHand = location["#"]!   // 오른손 위치
    
    for number in numbers {
        
        // 눌러야할 키패드 좌표
        let target = location[String(number)]!
        
        // 무조건 왼손
        if target.0 == 0 {
            result.append("L")
            leftHand = target
        
        // 무조건 오른손
        } else if target.0 == 2 {
            result.append("R")
            rightHand = target
            
        // 거리에 따라 결정
        } else {
            
            let fromLeft = abs(leftHand.0 - target.0) + abs(leftHand.1 - target.1)
            let fromRight = abs(rightHand.0 - target.0) + abs(rightHand.1 - target.1)
            
            // 오른손이 더 가깝다
            if fromLeft > fromRight {
                result.append("R")
                rightHand = target
                
            // 거리 동일
            } else if fromLeft == fromRight {
                if hand == "left" {
                    result.append("L")
                    leftHand = target
                } else {
                    result.append("R")
                    rightHand = target
                }
            // 왼손이 더 가깝다
            } else {
                result.append("L")
                leftHand = target
            }
        }
    }
    
    
    return result.joined(separator: "")
}
