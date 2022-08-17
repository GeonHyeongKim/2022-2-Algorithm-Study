def check(room,x,y):
    dx = [0, 0, 1, 1, 2, -1]
    dy = [1, 2, 0, 1, 0, 1]
    for i in range(6):
        nx = x+dx[i]
        ny = y+dy[i]
        if 0<=nx<5 and 0<=ny<5:
            if i == 0 or i == 2:
                if room[nx][ny] == 'P':
                    return False
            elif i == 1 and room[nx][ny] == 'P':
                if room[nx][ny-1] != 'X':
                    return False
            elif i == 4 and room[nx][ny] == 'P':
                if room[nx-1][ny] != 'X':
                    return False
            elif i == 3 and room[nx][ny] == 'P': 
                if room[nx-1][ny] != 'X' or room[nx][ny-1] != 'X':
                    return False
            elif i == 5 and room[nx][ny] == 'P': 
                if room[nx+1][ny] != 'X' or room[nx][ny-1] != 'X':
                    return False
    return True

def solution(places):
    answer = []
    for place in places:
        room = [list(p) for p in place]
        good = True
        for i in range(5):
            for j in range(5):
                if room[i][j] == 'P':
                    if not check(room,i,j):
                        good = False
                        break
        if good:
            answer.append(1)
        else:
            answer.append(0)
    return answer

#######################################################################

def man_dist(x1,y1,x2,y2):
    return abs(x1-x2)+abs(y1-y2)

def check(place,x,y):
    for i in range(-2,3):
        for j in range(3):
            if 0<=x+i<5 and 0<=y+j<5:
                if man_dist(x,y,x+i,y+j) == 1 and place[x+i][y+j] == 'P':
                    return False
                elif man_dist(x,y,x+i,y+j) == 2 and place[x+i][y+j] == 'P':
                    if i == 1 and j == 1:
                        if place[x+i-1][y+j] != 'X' or place[x+i][y+j-1] != 'X':
                            return False
                    if i == -1 and j == 1:
                        if place[x+i+1][y+j] != 'X' or place[x+i][y+j-1] != 'X':
                            return False
                    if i == 2 and j == 0:
                        if place[x+i-1][y+j] != 'X':
                            return False
                    if i == -2 and j == 0:
                        if place[x+i+1][y+j] != 'X':
                            return False
                    if i == 0 and j == 2:
                        if place[x+i][y+j-1] != 'X':
                            return False
                    
    return True

def valid(place):
    for i in range(5):
        for j in range(5):
            if place[i][j] == 'P':
                if not check(place,i,j):
                    return False
    return True

def solution(places):
    answer = []
    for place in places:
        if valid(place):
            answer.append(1)
        else:
            answer.append(0)
    return answer
