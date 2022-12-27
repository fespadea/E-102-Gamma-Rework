//other post draw

//draw mark effect on themselves
if(gammaRocketMarked[other_player_id.player]){
    with other_player_id {
        shader_start();
        draw_sprite_ext(rocketMarked, get_gameplay_time()/6, other.x, other.y - other.char_height/2, 1, 1, 0, -1, .5);
        shader_end();
    }
}