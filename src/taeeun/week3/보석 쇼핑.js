function solution(gems) {
    var answer = [];
    let gemMap=new Map();
    const gemSize=new Set(gems).size;
    gems.forEach((gem, index)=>{
        gemMap.delete(gem)
        gemMap.set(gem, index+1);
        if (gemMap.size===gemSize) {
            const minArray=[gemMap.values().next().value, index+1];
            if (answer.length===0 || answer[1]-answer[0]>minArray[1]-minArray[0]){
                answer=minArray;
            }
        }
    })
    return answer;
}
