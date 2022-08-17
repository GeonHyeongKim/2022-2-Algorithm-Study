
####################################################

def solution(name):
    check = [False for _ in range(len(name))]
    name = list(name)
    for i in range(len(name)):
        if name[i] =='A':
            check[i] = True
    ptr, cnt = 0, 0
    
    def getUpDown(ptr):
        diff = abs(ord(name[ptr]) - ord('A'))
        check[ptr] = True
        return min(diff, 26-diff)
    
    def getLeftRight(ptr):
        toRight = [0,0]
        for i in range(len(name)):
            index = (ptr+i)%len(name)
            if not check[index]:
                toRight = [index,i]
                break
        toLeft = [0,0]
        for i in range(len(name)):
            index = (ptr-i)
            if index < 0:
                index = len(name)-1
            if not check[index]:
                toLeft = [index,i]
                break
        return sorted([toRight,toLeft], key=lambda x:x[1])[0]
    
    cnt += getUpDown(ptr)
    while False in check:
        ptr, move = getLeftRight(ptr)
        cnt += move
        cnt += getUpDown(ptr)
    return cnt