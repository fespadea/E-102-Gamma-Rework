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
    // targetPlayer is created when hitbox is created in attack_update.gml
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
    rocketFollowerVFX = player_id.rocketFollowerVFX;
    currentOwner = player_id;
} else if (attack == AT_NSPECIAL){ //make sure to instantiate timeToRejuvinate when creating this hitbox
    //stage variables
    TOP_BLASTZONE_Y_POS = get_stage_data(SD_Y_POS) - get_stage_data(SD_TOP_BLASTZONE);
    BOTTOM_BLASTZONE_Y_POS = get_stage_data(SD_Y_POS) + get_stage_data(SD_BOTTOM_BLASTZONE);
    LEFT_BLASTZONE_X_POS = get_stage_data(SD_X_POS) - get_stage_data(SD_SIDE_BLASTZONE);
    RIGHT_BLASTZONE_X_POS = get_stage_data(SD_X_POS) + get_stage_data(SD_WIDTH) + get_stage_data(SD_SIDE_BLASTZONE);
    if(hbox_num == 3){
        timeOnGround = 0;
    }
    timeToRejuvinate = [];
    for(var i = 0; i < array_length(can_hit); i++){
        timeToRejuvinate[i] = can_hit[i]*31-1; // set to 30 if can_hit[i] is 1 and -1 if can_hit[i] is 0 so that we don't refresh can_hit[i] if it was never true
    }
    depth = player_id.depth + 1;
}