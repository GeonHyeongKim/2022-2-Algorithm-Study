function solution(relation) {
    var answer = 0;
    
    const n=relation[0].length;
    const students=relation.length;
    const attr=Array(n).fill().map((v,i)=>i+1);
    const candidateKeys=[];
  
    const getCombinations=(arr, selectNumber)=>{
        const result=[];
        if (selectNumber===1) return arr.map(i=>[i])
        arr.forEach((fixed, index, origin) => {
            const rest = origin.slice(index+1); 
            const combinations = getCombinations(rest, selectNumber-1); 
            const attached = combinations.map((combination) => [fixed, ...combination]); 
            result.push(...attached); 
        });
        return result;
    }

    const isUnique=(arr)=>{
        const result=[];
        for (const columns of relation) {
            let str='';
            for (let i=0; i<arr.length; i++) {
                str+=columns[arr[i]-1];
            }
            result.push(str);
        }
        if (students===new Set(result).size) return true;
        return false;
    }

    const isMinimal=(arr)=>{
        //현재까지 만들어진 후보키들을 모두 포함하고 있으면 최소성 x
        for (const keys of candidateKeys) {
            if (keys.every(key=>arr.includes(key))) return false;
        }
        return true;
    }
    
    for (let i=1; i<=n; i++) {
        const combinations=getCombinations(attr, i);
        for (const combination of combinations) {
            if (isUnique(combination) && isMinimal(combination)) candidateKeys.push(combination);
        }
    }
    
    return candidateKeys.length;
}
