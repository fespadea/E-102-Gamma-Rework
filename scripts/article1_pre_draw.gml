// article 1 pre draw

var needColors = false;
with oPlayer{
    if(player != other.player_id.player && !(get_player_team(player) == get_player_team(other.player_id.player) && !get_match_setting(SET_TEAMATTACK)) && "url" in self && url == other.player_id.url){
        needColors = true;
    }
}
if(needColors){
    gpu_push_state();
    gpu_set_fog(true, get_player_hud_color(player), 0, 0);
    draw_sprite_ext(sprite_index, image_index, x, y, 1.3*spr_dir, 1.3, 0, get_player_hud_color(player), 0.25);
    gpu_pop_state();
}