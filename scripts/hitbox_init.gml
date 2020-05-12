//hitbox_init

//mine age stuff
if(attack == AT_DSPECIAL && hbox_num == 1){
    age = 3;
    dir = player.spr_dir;
    with pHitBox {
        if(other.player == orig_player){
            if(attack == AT_DSPECIAL && hbox_num == 1){
                age--;
            }
        }
    }
    //stage variables
    BOTTOM_BLASTZONE_Y_POS = get_stage_data(SD_Y_POS) + get_stage_data(SD_BOTTOM_BLASTZONE);
    LEFT_BLASTZONE_X_POS = get_stage_data(SD_X_POS) - get_stage_data(SD_SIDE_BLASTZONE);
    RIGHT_BLASTZONE_X_POS = get_stage_data(SD_X_POS) + get_stage_data(SD_WIDTH) + get_stage_data(SD_SIDE_BLASTZONE);
} //targeting rocket stuff
else if (attack == AT_FSPECIAL && hbox_num == 1){
    targetPlayer = 0;
    maxSpeed = 2;
    angleToTarget = 0;
    percentAngle = 0;
    newAngle = 0;
    MAX_ANGLE_CHANGE = 7;
    if(spr_dir == -1){
        proj_angle = 180;
        spr_dir = 1;
    }else proj_angle = 0;
    //follower vfx
    rocketFollowerVFX = hit_fx_create(sprite_get("fspecial_proj_follower"), 18);
} else if (attack == AT_NSPECIAL){ //make sure to instantiate timeToRejuvinate when creating this hitbox
    //stage variables
    TOP_BLASTZONE_Y_POS = get_stage_data(SD_Y_POS) - get_stage_data(SD_TOP_BLASTZONE);
    BOTTOM_BLASTZONE_Y_POS = get_stage_data(SD_Y_POS) + get_stage_data(SD_BOTTOM_BLASTZONE);
    LEFT_BLASTZONE_X_POS = get_stage_data(SD_X_POS) - get_stage_data(SD_SIDE_BLASTZONE);
    RIGHT_BLASTZONE_X_POS = get_stage_data(SD_X_POS) + get_stage_data(SD_WIDTH) + get_stage_data(SD_SIDE_BLASTZONE);
    outOfTime = false;
    if(hbox_num == 3){
        timeOnGround = 0;
    }
    depth = player_id.depth + 1;
}