function solution(info, query) {
    var answer = [];
    const infoObj={};

    const binarySearch=(arr, target)=>{
        let left=0;
        let right=arr.length;
        while (left<right) {
            let mid=Math.floor((left+right)/2);
            if (arr[mid]>=target) right=mid;
            else left=mid+1;
        }
        return arr.length-left;
    }

    const combination=(info, score, infoObj, start)=>{
        const key=info.join(""); // 'javabackendjuniorpizza'

        //score을 배열 형태로 선언
        if (infoObj[key]) infoObj[key].push(score); //'javabackendjuniorpizza': [150, 170]
        else infoObj[key]=[score];

        for (let i=start; i<info.length; i++) {
            let temp=[...info];
            temp[i]='-';
            combination(temp, score, infoObj, i+1);
        }
    }

    for (let i=0; i<info.length; i++) {
        const infoArr=info[i].split(" "); //[ 'java', 'backend', 'junior', 'pizza']
        const score=Number(infoArr.pop());
        combination(infoArr, score, infoObj, 0);
    }


    const infoKeys=Object.keys(infoObj);

    const getResult=(query, score)=>{
        return infoKeys
        .filter(key=>query.every(e=>key.includes(e)))
        .reduce((acc, key) => { 
            return acc + binarySearch(infoObj[key], score)
        }, 0); 
    }

    for (let key in infoObj) {
        infoObj[key].sort((a,b)=>a-b);
    }    


    for (let i=0; i<query.length; i++){
        let newQuery=query[i].replace(/ and /g, "").split(" ");
        const score=Number(newQuery.pop());
        //score 점수 이상이면서 query 값을 만족해야 함
        answer.push(getResult(newQuery, score));
    }

    return answer;
}
