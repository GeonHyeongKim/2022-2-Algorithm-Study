function solution(s) {
    let answer = s.length;
    const len = s.length;
    
    for (let i=1; i<=len/2; i++) {
        let cnt=1;
        let cur=s.slice(0, i);
        let temp="";
        for (let j=i; j<len; j+=i) {
            let next=s.slice(j, j+i);
            if (next==cur) cnt++;
            else {
                if (cnt!==1) temp+=String(cnt);
                temp+=cur; 
                cnt=1;
                cur=next;
            }
        }
        if (cnt!==1) temp+=String(cnt);
        temp+=cur;
        if (answer > temp.length) answer=temp.length;
    }
    
    return answer;
}
