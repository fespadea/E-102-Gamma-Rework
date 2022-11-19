// pre-draw

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

unlimitedAltEvent = "pre_draw";
user_event(0);

fspecialEvent = "pre_draw";
user_event(1);