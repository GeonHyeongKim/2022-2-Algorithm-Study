function solution(genres, plays) {
    var answer = [];
    const music=[];
    const genreMap=new Map();

    for (let i=0; i<genres.length; i++) {
        music.push({genre:genres[i], plays:plays[i], index: i});
        if (!genreMap.has(genres[i])) genreMap.set(genres[i], plays[i]);
        else genreMap.set(genres[i], genreMap.get(genres[i])+plays[i]);
    }
    
    const genreArray=[...genreMap];
    genreArray.sort((a,b)=> b[1]-a[1]);
    music.sort((a,b)=> {
        if (genreMap.get(a.genre)!==genreMap.get(b.genre)) return genreMap.get(b.genre)-genreMap.get(a.genre)
        if (a.plays!==b.plays) return b.plays-a.plays;
        return a.index-b.index;
    })

    for (const [g, _] of genreArray) {
        let cnt=0;
        for (const {genre, plays, index} of music) {
            if (genre===g && cnt<2) {
                answer.push(index);
                cnt++;
            }
        }
    }

    return answer;
}
