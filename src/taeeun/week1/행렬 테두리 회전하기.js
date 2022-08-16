function solution(rows, columns, queries) {
    var answer = [];
    //1. 행렬 만들기
    let matrix=[];
    let newMatrix=[];
    for (let i=0; i<rows;i++){
        let line=[];
        for (let j=1; j<=columns;j++){
            line.push(i*columns+j);
        }
        newMatrix.push(line);
        matrix.push(line);
    }
    //회전
    for (let j=0; j<queries.length; j++){
        const [r1, c1, r2, c2]=queries[j].map(query=>query-1);
        const temp=[]; //바뀌는 숫자들만 담은 배열
        for (let i=c1; i<c2; i++) temp.push(matrix[r1][i]);
        for (let i=r1; i<r2; i++) temp.push(matrix[i][c2]);
        for (let i=c2; i>c1; i--) temp.push(matrix[r2][i]);
        for (let i=r2; i>r1; i--) temp.push(matrix[i][c1]);
        
        answer.push(Math.min(...temp)); //위치가 바뀐 숫자들 중 가장 작은 값
        const last = temp.pop();
        temp.unshift(last); //회전을 하게 되면 가장 마지막에 들어간 숫자가 맨 앞으로 오기때문에
        
        //회전 적용
        for (let i=c1; i<c2; i++) matrix[r1][i]=temp.shift();
        for (let i=r1; i<r2; i++) matrix[i][c2]=temp.shift();      
        for (let i=c2; i>c1; i--) matrix[r2][i]=temp.shift();
        for (let i=r2; i>r1; i--) matrix[i][c1]=temp.shift();
    }
    
    return answer;
}
