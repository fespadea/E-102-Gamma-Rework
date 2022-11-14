//init of other players

var largestPlayerNumber = 0;
with oPlayer{
    if(player > largestPlayerNumber){
        largestPlayerNumber = player;
    }
}
for(var i = 0; i <= largestPlayerNumber; i++){
    gammaRocketMarked[i] = false;
}