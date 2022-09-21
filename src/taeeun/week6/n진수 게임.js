function solution(n, t, m, p) {
    var answer = '';    
    const arr=[];
    for (let i=0; i<=t*m; i++) {
        arr.push(i.toString(n));
    }
    const newArr=arr.join('').split('');
    for (let i=p-1; i<t*m; i+=m) {
        answer+=newArr[i];
    }
    return answer.toUpperCase();
}
