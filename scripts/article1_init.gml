//article1_init

sprite_index = player_id.nspecialFlickySprite;
image_index = 0;
spr_dir = player_id.spr_dir;

state = 0;
article_timer = 0;
state_timer = 0;
hsp = 0;
vsp = 0;
can_be_grounded = false;
ignores_walls = true;
free = true;
hitstop = 0;

despawn = false;
mineHitbox = noone;
windboxCooldown = 0;
isGammaOrbittable = true
var largestPlayerNumber = 0;
with oPlayer{
    if(player > largestPlayerNumber){
        largestPlayerNumber = player;
    }
}
for(var i = 0; i <= largestPlayerNumber; i++){
    gammaRocketMarked[i] = false;
}

if(!("kirby" in self)){
    kirby = -1;
}