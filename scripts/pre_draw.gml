// pre-draw

//draw the jetpack during fspecial if floating
if(attack == AT_FSPECIAL && state == PS_ATTACK_AIR && floatActive){
    draw_sprite_ext(jetpackSprite, state_timer*jump_anim_speed, x, y, spr_dir, 1, 0, -1, 1);
}

//draw the mines
if(activeMines){
    activeMines = false;
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
}