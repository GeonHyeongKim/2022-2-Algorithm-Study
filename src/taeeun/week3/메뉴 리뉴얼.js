function solution(orders, course) {
    var answer = [];
    orders=orders.map(order=>order.split('').sort().join(''));
    
    const getCombinations=(arr, selectNumber)=>{
        let results = [];
        if (selectNumber===1) return arr.map(i=>[i])
        arr.forEach((fixed, index, origin) => {
            const rest = origin.slice(index+1);
            const combinations = getCombinations(rest, selectNumber-1);
            const attached = combinations.map((combination) => [fixed, ...combination]);
            results.push(...attached);
        });
        return results;
    }
    
    for (let j=0; j<course.length; j++){
        let results=[];
        let map=new Map();
        for (let i=0; i<orders.length; i++){
            let splitOrder=orders[i].split('');
            results=getCombinations(splitOrder, course[j]); //각 메뉴에 대한 조합이 담긴 배열
            results.forEach(element=>{
                element=element.join('')
                if (map.has(element)) map.set(element, map.get(element)+1);
                else map.set(element, 1);
            });
        }
        let max=0;
        for (let value of map.values()) {
            if (value>=max) max=value;
        }
        map.forEach((value, key)=>{
            if (value>=2&&value===max) answer.push(key)
        })
    }
    
    return answer.sort();
}
