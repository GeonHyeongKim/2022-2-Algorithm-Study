function solution(expression) {
    let answer = [];
    let op=/\-|\*|\+/g;
    //1. 숫자와 연산자를 각각 배열로 분리
    //숫자만 저장된 배열
    let numArr=expression.split(op).map(i=>parseInt(i));
    //연산자만 저장된 배열
    let opArr=[];
    for (let i=0; i<expression.length;i++){
        if (expression[i]==='-'||expression[i]==='+'||expression[i]==='*') opArr.push(expression[i]);
    }
    //2. 연산자 우선순위 정하기
    const priorities=[
        '*-+',
        '*+-',
        '+-*',
        '+*-',
        '-*+',
        '-+*',
    ];
    //3. 완전 탐색
    for (let i=0; i<priorities.length;i++){
        //새로운 배열에 복사
        let newNumArr=numArr.slice();
        let newOpArr=opArr.slice();
        for (let j=0; j<priorities[i].length; j++){
            let k=0;
            while (k!=newOpArr.length){
                if (priorities[i][j]===newOpArr[k]) {
                    if (newOpArr[k]==='*'){
                        newNumArr[k]*=newNumArr[k+1];
                    }
                    else if (newOpArr[k]==='-'){
                        newNumArr[k]-=newNumArr[k+1];
                    }
                    else if (newOpArr[k]==='+'){
                        newNumArr[k]+=newNumArr[k+1];
                    }
                    newNumArr.splice(k+1,1);
                    newOpArr.splice(k,1);
                }
                else k++;
            }
        }
        answer.push(newNumArr[0]);
    }
    return Math.max(...answer.map(i=>Math.abs(i)));
}
