function solution(fees, records) {
    var answer = [];
    
    const [defaultTime, defaultFee, unitTime, unitFee]=fees;
    let parkinglot=[];
    

    const convertTime=(time)=>{
        const [hour, min]=time.split(":");
        return [parseInt(hour), parseInt(min)];
    }
    
    const calculateTime=(enter, out)=>{
        const hour=out[0]-enter[0];
        const min=out[1]-enter[1];
        return hour*60+min;
    }
    
    const calculateFees=(totalTime)=>{
        const fee=Math.ceil((totalTime-defaultTime)/unitTime)*unitFee;
        if (fee>0) return defaultFee+fee;
        else return defaultFee;
    }
    
    for (const record of records) {
        const [time, carNum, isEnter]=record.split(" ");

        const car=parkinglot.find((e)=>e.carNum===carNum);
        if (isEnter==="IN") {
            if (car===undefined) parkinglot.push({carNum: carNum, enter: time, totalTime:0 });
            else car.enter=time;
        }
        else {
            const enter=convertTime(car.enter);
            const out=convertTime(time);
            const totalTime=calculateTime(enter, out);
            car.enter='';
            car.totalTime+=totalTime;
        }
    }
    
    for (const cars of parkinglot) {
        //만약 출차내역이 없다면 23:59분에 출차
        if (cars.enter!=='') {
            const enter=convertTime(cars.enter);
            const out=[23, 59];
            const totalTime=calculateTime(enter, out);
            cars.totalTime+=totalTime;
        }
    }
    
    parkinglot.sort((a, b)=> a.carNum-b.carNum);
    
    for (const cars of parkinglot) {
        answer.push(calculateFees(cars.totalTime));
    }
    
    
    return answer;
}
