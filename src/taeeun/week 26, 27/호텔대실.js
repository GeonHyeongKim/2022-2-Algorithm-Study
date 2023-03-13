function solution(book_time) {
    var answer = 0;
    book_time.sort();
    const room=[];
    for (const [start, end] of book_time) {
        const [startHour, startMin]=start.split(":").map(Number);
        const [endHour, endMin]=end.split(":").map(Number);
        const startTime=startHour*60+startMin;
        const endTime=endHour*60+endMin+10;

        const idx=room.findIndex((end)=>end<=startTime);

        //방 하나가 더 필요하다는 뜻
        if (idx===-1) {
            room.push(endTime);
        }
        else room[idx]=endTime;
    }
    return room.length;
}