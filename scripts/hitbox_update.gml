//hitbox_update

if (attack == AT_DSPECIAL && hbox_num == 1) {
    if(was_parried || player_id.runeM){
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
    if(!free && !player_id.runeO) destroyed = true;
    if(was_parried) {
        was_parried = false;
        targetPlayer = currentOwner;
        currentOwner = last_player_id;
        proj_angle += 180;
        if(proj_angle > 360) proj_angle -= 360;
    }
    if(hitbox_timer < length - 30)
        maxSpeed = ease_quadIn(5, 20, hitbox_timer, length - 30);
    var refresh = false;
    if(instance_exists(targetPlayer)){
        if("state" in targetPlayer){
            if(targetPlayer.state == PS_RESPAWN || targetPlayer.state == PS_DEAD)
                targetPlayer = noone;
        }
    }
    if(instance_exists(targetPlayer)){
        var markedPlayersPosition = -1;
        for(var i = 0; i < array_length(player_id.markedPlayers); i++){
            if(player_id.markedPlayers[i] == targetPlayer){
                markedPlayersPosition = i;
            }
        }
        if(markedPlayersPosition >= 0){
            player_id.drawTargets[markedPlayersPosition] = targetPlayer;
        } else{
            if("gammaRocketMarked" in targetPlayer){
                targetPlayer.gammaRocketMarked[orig_player] = true;
            } 
            player_id.drawTargets[array_length(player_id.markedPlayers)] = targetPlayer;
            player_id.markedPlayers[array_length(player_id.markedPlayers)] = targetPlayer;
            player_id.activeRockets = true;
        }
        angleToTarget = point_direction(x, y, get_instance_x(targetPlayer) + ("gammaTargetWidth" in targetPlayer ? targetPlayer.gammaTargetWidth/2 : 0), get_instance_y(targetPlayer) - ("char_height" in targetPlayer ? targetPlayer.char_height/2 : 0));
        if(hitbox_timer < length - 30){
            if(hitbox_timer < (length-30)/2) percentAngle = ease_circIn(0, 1, hitbox_timer, (length - 30)/2);
            else percentAngle = ease_circIn(1, 0, hitbox_timer, length - 30);
            if(proj_angle > angleToTarget + 180) proj_angle -= 360;
            else if (angleToTarget > proj_angle + 180) proj_angle += 360;
            newAngle = lerp(proj_angle, angleToTarget, percentAngle*min(0.7, point_distance(x, y, get_instance_x(targetPlayer), get_instance_y(targetPlayer) - ("char_height" in targetPlayer ? targetPlayer.char_height/2 : 0))/100.0));
            if(newAngle > proj_angle + MAX_ANGLE_CHANGE){
                newAngle = proj_angle + MAX_ANGLE_CHANGE;
            } else if (newAngle < proj_angle - MAX_ANGLE_CHANGE){
                newAngle = proj_angle - MAX_ANGLE_CHANGE;
            }
            if(abs(angleToTarget - proj_angle) > 160){ // avoid turning toward solid blocks if turning direction is negligible
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
    depth = player_id.depth + 1;
    for(var i = 0; i < array_length(timeToRejuvinate); i++){
        if(can_hit[i] == 0){
            timeToRejuvinate[i]--;
            if(timeToRejuvinate[i] == 0){ // this avoids the values that started at -1
                timeToRejuvinate[i] = 30;
                can_hit[i] = 1;
            }
        }
    }
    if(hbox_num == 1){
        if(x > RIGHT_BLASTZONE_X_POS || x < LEFT_BLASTZONE_X_POS){
            length = 0;
        }
        if(player_id.runeK){
            if(x <= view_get_xview()){
                hsp = abs(hsp);
            } else if(x >= view_get_xview() + view_get_wview()){
                hsp = -abs(hsp);
            }
        }
        draw_xscale = hsp/abs(hsp);
    } else if(hbox_num == 2){
        if(y < TOP_BLASTZONE_Y_POS || y > BOTTOM_BLASTZONE_Y_POS){
            length = 0;
        }
        if(player_id.runeK){
            if(y <= view_get_yview()){
                vsp = abs(vsp);
            } else if(y >= view_get_yview() + view_get_hview()){
                vsp = -abs(vsp);
            }
        }
    } else if(hbox_num == 3){
        if(x > RIGHT_BLASTZONE_X_POS || x < LEFT_BLASTZONE_X_POS || y > BOTTOM_BLASTZONE_Y_POS){
            length = 0;
        }
        if(!free || y >= view_get_yview() + view_get_hview()){
            vsp = 0;
            hsp = 0;
            timeOnGround++;
            if(timeOnGround > 15){
                hsp = 5*spr_dir;
                vsp = -5;
                timeOnGround = 0;
            }
        }
        if(player_id.runeK){
            if(x <= view_get_xview()){
                hsp = abs(hsp);
            } else if(x >= view_get_xview() + view_get_wview()){
                hsp = -abs(hsp);
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
            spr_dir = draw_xscale;
    }
}