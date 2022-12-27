// pre-draw

var needColors = false;
with oPlayer{
    if(player != other.player && !(get_player_team(player) == get_player_team(other.player) && !get_match_setting(SET_TEAMATTACK)) && "url" in self && url == other.url){
        needColors = true;
    }
}
if(needColors){
    gpu_push_state();
    gpu_set_fog(true, get_player_hud_color(player), 0, 0);
    with pHitBox{
        if(attack == AT_NSPECIAL && other.player == orig_player){
            draw_sprite_ext(sprite_index, image_index, x, y+sprite_get_height(sprite_index)*0.08, 1.2*spr_dir, 1.2, 0, -1, 0.25);
        }
    }
    // with obj_article1 {
    //     if(player_id == other){
    //         draw_sprite_ext(sprite_index, image_index, x, y+sprite_get_height(sprite_index)*0.08, 1.2*spr_dir, 1.2, 0, -1, 0.25);
    //     }
    // }
    gpu_pop_state();
}

//draw the mines
if(activeMines){
    activeMines = false;
    shader_start();
    with pHitBox {
        if(attack == AT_DSPECIAL && hbox_num == 1 && other.player == orig_player){
            if (hsp != 0) {
                if (age == 2){
                    draw_sprite_ext(other.dspecialProjSprite, hitbox_timer*img_spd, x, y, dir, 1, 0, -1, 1);
                } if (age == 1) {
                    draw_sprite_ext(other.dspecialProjSprite, hitbox_timer*img_spd, x, y, dir, 1, 0, c_gray, 1);
                }
            } else {
                if (age == 2) {
                    draw_sprite_ext(other.dspecialProjGround, hitbox_timer*img_spd, x, y, dir, 1, 0, -1, 1);
                } else if (age == 1){
                    draw_sprite_ext(other.dspecialProjGround, hitbox_timer*img_spd, x, y, dir, 1, 0, c_gray, 1);
                }
            }
            other.activeMines = true;
        }
    }
    shader_end();
}

// unlimitedAltEvent = "pre_draw" is called in user_event1
fspecialEvent = "pre_draw";
user_event(1);