//hitbox_update

if (attack == AT_DSPECIAL && hbox_num == 1) {
    if(was_parried){
        age = 2;
    }
    if (hsp != 0) {
        mask_index = player_id.dspecialProjSprite;
    } else {
        mask_index = player_id.dspecialProjGround;
    }
    collision_sprite = mask_index;
    if(age == 0) {
        length = 0;
    }
    if (x > RIGHT_BLASTZONE_X_POS || x < LEFT_BLASTZONE_X_POS || y > BOTTOM_BLASTZONE_Y_POS){
        length = 0;
    }
} else if (attack == AT_FSPECIAL && hbox_num == 1){
    if(!free) destroyed = true;
    if(was_parried && targetPlayer != player_id) {
        targetPlayer = player_id;
        proj_angle += 180;
        if(proj_angle > 360) proj_angle -= 360;
    }
    if(hitbox_timer < length - 30)
        maxSpeed = ease_quadIn(5, 20, hitbox_timer, length - 30);
    if(instance_exists(targetPlayer)){
        if(targetPlayer.state == PS_RESPAWN || targetPlayer.state == PS_DEAD)
            targetPlayer = noone;
    }
    if(instance_exists(targetPlayer)){
        if(!targetPlayer.gammaRocketMarked[orig_player]){
            targetPlayer.gammaRocketMarked[orig_player] = true;
            player_id.markedPlayers[array_length(player_id.markedPlayers)] = targetPlayer;
            player_id.activeRockets = true;
        }
        angleToTarget = point_direction(x, y, targetPlayer.x, targetPlayer.y - targetPlayer.char_height/2);
        if(hitbox_timer < length - 30){
            if(hitbox_timer < (length-30)/2) percentAngle = ease_circIn(0, 1, hitbox_timer, (length - 30)/2);
            else percentAngle = ease_circIn(1, 0, hitbox_timer, length - 30);
            if(proj_angle > angleToTarget + 180) proj_angle -= 360;
            else if (angleToTarget > proj_angle + 180) proj_angle += 360;
            newAngle = lerp(proj_angle, angleToTarget, percentAngle*min(0.7, point_distance(x, y, targetPlayer.x, targetPlayer.y - targetPlayer.char_height/2)/100.0));
            if(newAngle > proj_angle + MAX_ANGLE_CHANGE){
                newAngle = proj_angle + MAX_ANGLE_CHANGE;
            } else if (newAngle < proj_angle - MAX_ANGLE_CHANGE){
                newAngle = proj_angle - MAX_ANGLE_CHANGE;
            }
            if(abs(angleToTarget - proj_angle) > 175){ // avoid turning toward solid blocks if turning direction is negligible
                var testAngle = newAngle + 90*(newAngle-proj_angle)/abs(newAngle-proj_angle);
                var testAngleOpposite = newAngle - 90*(newAngle-proj_angle)/abs(newAngle-proj_angle);
                if(collision_line(x, y, x+dcos(testAngle)*player_id.char_height*1.5, y+dsin(testAngle)*player_id.char_height*1.5, player_id.solidBlockObject, false, true) < 0 && collision_line(x, y, x+dcos(testAngleOpposite)*player_id.char_height*1.5, y+dsin(testAngleOpposite)*player_id.char_height*1.5, player_id.solidBlockObject, false, true) >= 0){
                    newAngle = proj_angle + proj_angle - newAngle;
                }
            }
            proj_angle = newAngle;
        }
    }
    hsp = maxSpeed*dcos(proj_angle);
    vsp = -maxSpeed*dsin(proj_angle);
    if(hitbox_timer % 8 == 0){
        spawn_hit_fx(x, y, rocketFollowerVFX);
    }
} else if (attack == AT_NSPECIAL){
    if(outOfTime){
        length = 0;
    } else {
        depth = player_id.depth + 1;
        timeToRejuvinate--;
        if(timeToRejuvinate > 0){
            if(hbox_num == 1){
                if(x > RIGHT_BLASTZONE_X_POS || x < LEFT_BLASTZONE_X_POS){
                    length = 0;
                }
                draw_xscale = hsp/abs(hsp);
            } else if(hbox_num == 2){
                if(y < TOP_BLASTZONE_Y_POS || y > BOTTOM_BLASTZONE_Y_POS){
                    length = 0;
                }
            } else if(hbox_num == 3){
                if(x > RIGHT_BLASTZONE_X_POS || x < LEFT_BLASTZONE_X_POS || y > BOTTOM_BLASTZONE_Y_POS){
                    length = 0;
                }
                if(!free){
                    timeOnGround++;
                    if(timeOnGround > 15){
                        hsp = 5*spr_dir;
                        vsp = -5;
                        timeOnGround = 0;
                    }
                }
                if(vsp > 0){
                    kb_angle = -45;
                    image_index = 2;
                } else{
                    kb_angle = 45;
                    if(vsp < 0)
                        image_index = 0;
                    else
                        image_index = 1;
                }
                if(hsp != 0)
                    draw_xscale = hsp/abs(hsp);
            }
        } else {
            damage = 0;
            kb_value = 0;
            knockback_adj = 0;
            hitpause = 0;
            hitpause_growth = 0;
            sound_effect = 0;
            newHitbox = create_hitbox(AT_NSPECIAL, hbox_num, x, y);
            newHitbox.vsp = vsp;
            newHitbox.hsp = hsp;
            newHitbox.spr_dir = spr_dir;
            newHitbox.image_index = image_index;
            newHitbox.kb_angle = kb_angle;
            if(hbox_num == 3){
                newHitbox.timeOnGround = timeOnGround;
            }
            newHitbox.timeToRejuvinate = 10000;
            outOfTime = true;
        }
    }
}