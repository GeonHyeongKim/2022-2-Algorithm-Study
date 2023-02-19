function solution(users, emoticons) {
    var answer = [];
    const sales=[10, 20, 30, 40];
    const n = emoticons.length;
    let salesArray=[];
    const createSalesArray=(arr, depth)=>{
        if (depth===n) {
            salesArray.push(arr);
            return;
        }
        for (const sale of sales) {
            const temp=[...arr, sale];
            createSalesArray(temp, depth+1);
        }
    }
    createSalesArray([], 0);
    let maxEmoticonPlus=0;
    let maxProfit=0;

    for (const sale of salesArray) {
        let emoticonPlus=0;
        let totalProfit=0;

        for (const [percent, limitPrice] of users) {
            let totalPrice=0;
            emoticons.forEach((emoticon, idx)=> {
                if (sale[idx]>=percent)  totalPrice+=(emoticon*(100-sale[idx]))/100
                }
            );
            //이모티콘 플러스 가입
            if (totalPrice>=limitPrice) {
                emoticonPlus+=1;
            }
            else {
                totalProfit+=totalPrice;
            }
        }

        if (emoticonPlus < maxEmoticonPlus) continue;
        if (emoticonPlus===maxEmoticonPlus) {
            maxProfit = Math.max(maxProfit, totalProfit);
            continue;
        }
        if (emoticonPlus > maxEmoticonPlus) {
            maxEmoticonPlus = emoticonPlus;
            maxProfit = totalProfit;
        }

    }
    answer=[maxEmoticonPlus, maxProfit];

    return answer;
}