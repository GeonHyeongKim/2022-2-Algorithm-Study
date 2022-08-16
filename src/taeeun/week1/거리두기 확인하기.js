function solution(places) {
    var answer = [];
    const dx=[0, 0, 1, -1];
    const dy=[-1, 1, 0, 0];
    
    const isReachable=(x, y)=>{
        if (x<0 || x>=5 || y<0 || y>=5) return false;
        return true;
    }
    
    const bfs=(place, x, y)=>{
        const visited=Array.from(Array(5), () => new Array(5).fill(false));
        let q=[[x,y,0]];
        visited[x][y]=true;
        while (q.length) {
            const [currentX, currentY, dist] = q.shift();
            if (dist==2) continue; //거리두기가 잘 지켜지고 있음
            for (let i=0; i<4; i++) {
                const nextX=currentX+dx[i];
                const nextY=currentY+dy[i];
                if (!isReachable(nextX, nextY)) continue; //접근 불가능
                if (visited[nextX][nextY] || place[nextX][nextY]=='X') continue;
                if (place[nextX][nextY]=='O') {
                    //빈 테이블이라면 일단 계속 확인
                    visited[nextX][nextY]=true;
                    q.push([nextX, nextY, dist+1]);
                }
                if (place[nextX][nextY]=='P') {
                    return false;
                }
            }
            
        }
        return true;
    }
    
    const findAnswer=(place)=>{
        for (let i=0; i<5; i++) {
            for (let j=0; j<5; j++) {
                if (place[i][j]=='P') {
                    if (bfs(place, i, j)==false) {
                        return 0;
                    }
                }
            }
        }  
        return 1;
    }
    
    for (let k=0; k<places.length; k++) {
        const place=places[k].map((e)=>e.split(''));
        answer.push(findAnswer(place));
    }
    
    return answer;
}
