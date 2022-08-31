function solution(ingredients) {
    var answer = 0;
    let burger=[];

    const check=(arr)=>{
        if (arr.slice(-4, arr.legth).join('')=='1231') return true;
        return false;
    }

    for (const ingredient of ingredients) {
        burger.push(ingredient);
        if (burger.length>=4) {
            if (check(burger)) {
                burger.splice(-4, burger.length);
                answer++;
            }
        }
    }
    return answer;
}
