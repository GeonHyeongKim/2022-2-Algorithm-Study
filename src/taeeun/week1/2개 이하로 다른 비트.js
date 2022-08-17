function solution(numbers) {
    var answer = [];
    
    const convertBinary=(num)=>{
        let temp=[];
        while(num>=1) {
            temp.push(num%2);
            num=parseInt(num/2);
            if (num===1) {
                temp.push(num);
                break;
            }
        }
        return temp;
    }
    
    for (const number of numbers) {
        let result=0;
        if (number%2==0) result=number+1;
        else {
           const arr=convertBinary(number); //현재 이 배열은 원래 비트의 반대로 되어있음
            let i=0;
            let flag=false;
            for (i; i<arr.length; i++) {
                if (arr[i]==0) {
                    flag=true;
                    break;
                }
            }
            if (flag) { //0이 나온 자리와 바로 그 밑의 자리와 swap하는 것과 같음
                [arr[i], arr[i-1]]=[arr[i-1], arr[i]];
            }
            else { //비트가 1밖에 없는 경우
                arr.push(1);
                arr[i-1]=0;
            }
            for (let j=0; j<arr.length; j++) {
                result+=arr[j]*Math.pow(2, j);
            }
        }
        answer.push(result);
    }
    
    return answer;
}
