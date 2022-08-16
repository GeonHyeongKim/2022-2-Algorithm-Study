function solution(N, stages) {
    let answer = [];
    let temp=[];
    for (let i=1; i<=N; i++) {
        const success=stages.filter((stage)=>stage>=i);
        const fail=stages.filter((stage)=>stage===i);
        if (success.length==0) {
            temp.push({failRate:0, stage:i});
        }
        else {
            temp.push({failRate:fail.length/success.length, stage:i});
        }
    }
    temp.sort((a,b)=>b.failRate-a.failRate);
    for (const element of temp) {
        answer.push(element.stage);
    }
    return answer;
}
