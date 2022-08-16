function solution(n, info) {
    let answer=new Array(11).fill(0);

    const calcScore=(ryan, apeach)=>{
        let ryanScore=0;
        let apeachScore=0;
        for (let i=0; i<10; i++) {
            if (ryan[i]==0 && apeach[i]==0) continue;
            if (ryan[i]>apeach[i]) ryanScore+=(10-i);
            else apeachScore+=(10-i);
        }
        if (apeachScore>=ryanScore) return -1;
        else return ryanScore-apeachScore;
    }
    
    const isLower=(current, ryan)=>{
        for (let i=10; i>=0; i--) {
            if (current[i]>ryan[i]) return false;
            if (current[i]<ryan[i]) return true;
        }
        return false;
    }
    
    let maxDiff=-1;
    
    const solve=(apeach, ryan, current, arrows)=>{
        //남은 화살이 없거나 끝난 경우 점수 계산
        if (arrows==0 || current>10) {
            let diff=calcScore(ryan, apeach);
            if (diff==-1) return;
            ryan[10]+=arrows; // 낮은 점수를 더 많이 맞혀야하니까 0점에 남은 화살 더함
            
            //더 큰 점수 차이인지
            //낮은 점수를 더 많이 맞혔는지
            if (diff == maxDiff&&isLower(answer, ryan)) {
                answer=ryan;
            }
            else if (diff > maxDiff) {
                answer=ryan;
                maxDiff=diff;
            }
            return;
        }
        
        //점수를 가져가는 경우
        if (apeach[current] < arrows) {
            const temp=[...ryan]
            temp[current]=apeach[current]+1;
            solve(apeach, temp, current+1, arrows-(apeach[current]+1));
        }
        //점수를 가져가지 않는 경우
        solve(apeach, ryan, current+1, arrows);
    }
    
    solve(info, answer, 0, n);

    if (maxDiff==-1) return [-1];
    else return answer;
}
