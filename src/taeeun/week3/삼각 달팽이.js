function solution(n) {
    var answer = [];
    let arr = Array.from(Array(n), (el, i) => Array(i+1))
    let currentX=0;
    let currentY=0;
    const totalMove = n*(n+1)/2;
    let cnt=0;
    let change=n;
    
    //방향은 총 세가지 1: 아래, 2: 옆, 3: 위
    let dir=1;
    
    for (let i=1; i<=totalMove; i++){ 
        arr[currentX][currentY]=i;
        cnt++;
        //방향을 바꿔야하는지?
        if (cnt===change) {
            dir=dir%3===0 ? 1: dir+1;
            cnt=0;
            change-=1;
        }
        if (dir===1) {
            currentX+=1;
            continue;
        }
        if (dir===2) {
            currentY+=1;
            continue;
        }
        if (dir===3) {
            currentX-=1;
            currentY-=1;
        }
    }
    

    return arr.flat();
}
