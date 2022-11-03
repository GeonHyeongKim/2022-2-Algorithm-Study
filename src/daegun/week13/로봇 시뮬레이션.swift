import Foundation

let direction = ["N":0,"E":1,"S":2,"W":3]

enum CommandType: String {
    case L, R, F
}

func getPositionKey(x: Int, y: Int) -> String{
    return "\(x)|\(y)"
}

// A: 가로길이 B: 세로길이
let AB = readLine()!.split(separator: " ").map { Int(String($0))! }
let width = AB[0]
let height = AB[1]

// N: 로봇수 M: 명령수
let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0]
let M = NM[1]

// 초기X 초기Y 방향
typealias RobotState = (x: Int, y: Int, offset: Int)
var robotStates: [RobotState] = []
for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { String($0) }
    robotStates.append(
        (Int(input[0])!-1, Int(input[1])!-1, direction[input[2]]!)
    )
}

// 로봇번호 명령종류 반복횟수
typealias Command = (robot: Int, type: CommandType, count: Int)
var commands: [Command] = []
for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { String($0) }
    commands.append((Int(input[0])!-1, CommandType(rawValue: input[1])!, Int(input[2])!))
}

// 로봇 위치 저장
var occupied: [String:Int] = [:]
for (idx, state) in robotStates.enumerated() {
    occupied[getPositionKey(x: state.x, y: state.y)] = idx
}

// 명령 처리
let offset = [(0, 1), (1, 0), (0, -1), (-1, 0)] // N E S W



func resultMessage() -> String {
    
    for command in commands {
        
        switch command.type {
        case .F:
            let existing = robotStates[command.robot]
            var current = robotStates[command.robot]
            for _ in 0..<command.count {
                // 전진할 좌표 연산
                let currentOffset = offset[current.offset]
                current = (current.x+currentOffset.0, current.y+currentOffset.1, current.offset)

                // 로봇 충돌 체크
                if let crashed = occupied[getPositionKey(x: current.x, y: current.y)] {
                    return "Robot \(command.robot+1) crashes into robot \(crashed+1)"
                }
                
                // 벽 충돌 체크
                if current.x < 0 || current.x >= width ||
                    current.y < 0 || current.y >= height {
                    return "Robot \(command.robot+1) crashes into the wall"
                }
            }
            
            // 충돌이 없는 경우 좌표 이동
            robotStates[command.robot] = current
            occupied[getPositionKey(x: existing.x, y: existing.y)] = nil
            occupied[getPositionKey(x: current.x, y: current.y)] = command.robot
            
        case .R:
            var changed = robotStates[command.robot]
            changed.offset = (changed.offset + command.count)%4
            robotStates[command.robot] = changed
            
        case .L:
            var changed = robotStates[command.robot]
            var newOffset = changed.offset - command.count%4
            if newOffset < 0 { newOffset += 4 }
            changed.offset = newOffset
            robotStates[command.robot] = changed
            
        }
        
    }
    
    return "OK"
}

print(resultMessage())

