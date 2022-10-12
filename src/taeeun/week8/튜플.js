function solution(s) {
    var answer = [];
    let arr=[];
    arr=s.replace('{{', '').replace('}}', '').split('},{');
    arr.sort((a,b)=>{
        return a.length-b.length;
    });
    for (let i=0; i<arr.length; i++){
        arr[i]=arr[i].split(',')
    }
    for (let i=0; i<arr.length; i++){
        for (let j=0; j<arr[i].length; j++){
            if (!answer.includes(parseInt(arr[i][j]))) 
                answer.push(parseInt(arr[i][j]));
        }
    }
    return answer;
}
