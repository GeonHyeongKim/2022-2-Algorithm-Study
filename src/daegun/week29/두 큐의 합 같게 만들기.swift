import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {

    var arr = queue1 + queue2
    var front = (0, queue1.count)  // queue의 front
    var rear = (queue1.count-1, queue2.count + queue2.count-1)
    var sum = (queue1.reduce(0, +), queue2.reduce(0, +))    // 각 queue의 현재 합
    
    // 큐의 합이 홀수일 경우 불가능
    if (sum.0 + sum.1)%2 != 0 { return -1 }
    
    var count = 0
    while sum.0 != sum.1 && count <= queue1.count*3 {
        
        // queue1 -> queue2
        if sum.0 > sum.1 {
            
            sum.1 += arr[front.0]
            sum.0 -= arr[front.0]
            
            front.0 += 1
            if front.0 >= arr.count { front.0 = 0 }
            rear.1 += 1
            if rear.1 >= arr.count { rear.1 = 0 }
            
        // queue2 -> queue1
        } else {
            
            sum.1 -= arr[front.1]
            sum.0 += arr[front.1]
            
            front.1 += 1
            if front.1 >= arr.count { front.1 = 0 }
            rear.0 += 1
            if rear.0 >= arr.count { rear.0 = 0 }
        }
        count += 1
        
    }
    
    if sum.0 != sum.1 { return -1 }
    
    return count
}
