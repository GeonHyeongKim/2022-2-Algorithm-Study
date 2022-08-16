function solution(name) {
    var answer = 0;
    let updown=0;
    let move=name.length-1;
    for (let i=0; i<name.length; i++) {
        updown+=Math.min(name.charCodeAt(i)-65, 91-name.charCodeAt(i));
        let next=i+1;
        while (next<name.length && name[next]=='A') {
            next++;
        }
        move=Math.min(move, i+name.length-next+Math.min(i, name.length-next));
    }
    return updown+move;
}
