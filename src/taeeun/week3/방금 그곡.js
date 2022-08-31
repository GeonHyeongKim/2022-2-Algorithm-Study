function solution(m, musicinfos) {
    const replace=(melody)=>{
        return melody
            .replace(/(C#)/g, "c")
            .replace(/(D#)/g, "d")
            .replace(/(F#)/g, "f")
            .replace(/(G#)/g, "g")
            .replace(/(A#)/g, "a");
    }
    m=replace(m);
    
    const temp=[];
    
    for (const musicinfo of musicinfos) {
        const [start, end, title, melody] = musicinfo.split(',');
        const hour = end.slice(0, 2)-start.slice(0, 2);
        const min = end.slice(3, 5) - start.slice(3, 5);
        
        const playedTime = Number(hour*60+min); //재생된 시간
        const newMelody = replace(melody);
        let playedMusic=newMelody.repeat(playedTime/newMelody.length);
        playedMusic+=newMelody.slice(0, playedTime%newMelody.length);
        
        if (playedMusic.includes(m)) temp.push([title, playedTime, temp.length+1]);
    }
    
    if (temp.length===0) return '(None)';
    
    temp.sort((a,b)=>{
        if (a[1]!==b[1]) return b[1]-a[1];
        return a[2]-b[2];
    })

    return temp[0][0];
}
