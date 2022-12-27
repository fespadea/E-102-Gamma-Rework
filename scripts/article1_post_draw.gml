// article1 post draw

for(var i = 0; i < array_length(gammaRocketMarked); i++){
    if(gammaRocketMarked[i]){
        with oPlayer {
            if(player == i){
                shader_start();
                draw_sprite_ext(rocketMarked, get_gameplay_time()/6, other.x, other.y - other.char_height/2, 1, 1, 0, -1, .5);
                shader_end();
                break;
            }
        }
    }
}