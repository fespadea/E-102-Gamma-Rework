// pre-draw

//draw the jetpack during fspecial if floating
if(attack == AT_FSPECIAL && state == PS_ATTACK_AIR && floatActive){
    draw_sprite_ext(sprite_get("jetpack"), state_timer*jump_anim_speed, x, y, spr_dir, 1, 0, -1, 1);
}

//draw the mines
if(activeMines){
    activeMines = false;
    with pHitBox {
        if(attack == AT_DSPECIAL && hbox_num == 1 && other.player == player){
            if (hsp != 0) {
                if (age == 2){
                    draw_sprite_ext(sprite_get("dspecial_proj"), hitbox_timer*img_spd, x, y, dir, 1, 0, -1, 1);
                } if (age == 1) {
                    draw_sprite_ext(sprite_get("dspecial_proj"), hitbox_timer*img_spd, x, y, dir, 1, 0, c_gray, 1);
                }
            } else {
                if (age == 2) {
                    draw_sprite_ext(sprite_get("dspecial_proj_ground"), hitbox_timer*img_spd, x, y, dir, 1, 0, -1, 1);
                } else if (age == 1){
                    draw_sprite_ext(sprite_get("dspecial_proj_ground"), hitbox_timer*img_spd, x, y, dir, 1, 0, c_gray, 1);
                }
            }
            other.activeMines = true;
        }
    }
}