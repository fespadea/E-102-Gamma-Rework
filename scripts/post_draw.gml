//post-draw

//drawing the laser targeter for Fspecial
if(attack == AT_FSPECIAL && (state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR)){
    if(state == PS_ATTACK_GROUND){
        var targeterBaseX = x-10*spr_dir;
        var targeterBaseY = y-69;
    } else {
        var targeterBaseX = x-18*spr_dir;
        var targeterBaseY = y-63;
    }
    if(window == 1){
        if(image_index > 0){
            draw_sprite_ext(fspecialTargetingSprite, image_index-1, targeterBaseX, targeterBaseY, spr_dir, 1, 0, -1, 1);
        }
        targeterDir = spr_dir;
    } else if (window == 2){
        if(!joy_pad_idle){
            if(targeterDir > 0) {
                if (joy_dir < 90 || up_down) {
                    targeterRotation = min(targeterRotation + (real(joy_dir - targeterRotation)/30.0), maxPositiveRotation);
                } else if (joy_dir > 270 || down_down) {
                    targeterRotation = max(targeterRotation + (real(joy_dir - 360 - targeterRotation)/30.0), minNegativeRotation);
                } else if (left_down){
                    targeterDir = -1;
                }
            } else {
                if (joy_dir >= 180 && joy_dir < 270 || down_down){
                    targeterRotation = min(targeterRotation + (real(joy_dir - 180 - targeterRotation)/30.0), maxPositiveRotation);
                } else if(joy_dir > 90 && joy_dir < 180 || up_down){
                    targeterRotation = max(targeterRotation + (real(joy_dir - 180 - targeterRotation)/30.0), minNegativeRotation);
                } else if (right_down){
                    targeterDir = 1;
                }
            }
        }
        targeterRotationRad = degtorad(targeterRotation);
        laserX = targeterBaseX + targeterDir * distanceToTargetPoint*cos(targeterRotationRad + angleToTargetPoint * targeterDir);
        laserY = targeterBaseY - targeterDir * distanceToTargetPoint*sin(targeterRotationRad + angleToTargetPoint * targeterDir);
        lengthLaser = 0;
        if(targeterDir > 0){
            var rotationForCalculations = targeterRotation;
            var rotationForCalculationsRad = degtorad(rotationForCalculations);
            if(laserX < RIGHT_MAIN_STAGE_X_POS && point_direction(laserX, laserY, LEFT_MAIN_STAGE_X_POS, TOP_MAIN_STAGE_Y_POS) - 360 < rotationForCalculations && point_direction(laserX, laserY, RIGHT_MAIN_STAGE_X_POS, TOP_MAIN_STAGE_Y_POS) - 360 > rotationForCalculations){
                lengthLaser = (laserY-TOP_MAIN_STAGE_Y_POS)/(2.0*sin(rotationForCalculationsRad));
            } else if(laserX < LEFT_MAIN_STAGE_X_POS && point_direction(laserX, laserY, LEFT_MAIN_STAGE_X_POS, BOTTOM_BLASTZONE_Y_POS) - 360 < rotationForCalculations) {
                var dirTopLeftCorner = point_direction(laserX, laserY, LEFT_MAIN_STAGE_X_POS, TOP_MAIN_STAGE_Y_POS);
                if(laserY < TOP_MAIN_STAGE_Y_POS) dirTopLeftCorner -= 360;
                if(dirTopLeftCorner > rotationForCalculations)
                    lengthLaser = (LEFT_MAIN_STAGE_X_POS - laserX)/(2.0*cos(rotationForCalculationsRad));
            }
        } else {
            var rotationForCalculations = targeterRotation + 180;
            var rotationForCalculationsRad = degtorad(rotationForCalculations);
            if(laserX > LEFT_MAIN_STAGE_X_POS && point_direction(laserX, laserY, LEFT_MAIN_STAGE_X_POS, TOP_MAIN_STAGE_Y_POS) < rotationForCalculations && point_direction(laserX, laserY, RIGHT_MAIN_STAGE_X_POS, TOP_MAIN_STAGE_Y_POS) > rotationForCalculations){
                lengthLaser = (laserY-TOP_MAIN_STAGE_Y_POS)/(2.0*sin(rotationForCalculationsRad));
            } else if(laserX > RIGHT_MAIN_STAGE_X_POS && point_direction(laserX, laserY, RIGHT_MAIN_STAGE_X_POS, BOTTOM_BLASTZONE_Y_POS) > rotationForCalculations && point_direction(laserX, laserY, RIGHT_MAIN_STAGE_X_POS, TOP_MAIN_STAGE_Y_POS) < rotationForCalculations) {
                lengthLaser = (RIGHT_MAIN_STAGE_X_POS - laserX)/(2.0*cos(rotationForCalculationsRad));
            }
        }
        if(lengthLaser == 0 && !(laserX > LEFT_MAIN_STAGE_X_POS && laserX < RIGHT_MAIN_STAGE_X_POS && laserY > TOP_MAIN_STAGE_Y_POS)){
            lengthLaser = 1000;
        }
        draw_sprite_ext(fspecialTargetingSprite, 3, targeterBaseX, targeterBaseY, targeterDir, 1, targeterRotation, -1, 1);
        if(state_timer < 100)
            draw_sprite_ext(fspecialLaser, 0, laserX, laserY, targeterDir*lengthLaser, 1, targeterRotation, -1, 0.3);
        else
            draw_sprite_ext(fspecialLaserOld, 0, laserX, laserY, targeterDir*lengthLaser, 1, targeterRotation, -1, 0.3-(state_timer-100)/100);
    } else {
        if(image_index < 10){
        draw_sprite_ext(fspecialTargetingSprite, 3, targeterBaseX, targeterBaseY, targeterDir, 1, targeterRotation, -1, 1);
        } else if(image_index < 13){
        draw_sprite_ext(fspecialTargetingSprite, 12 - image_index, targeterBaseX, targeterBaseY, targeterDir, 1, targeterRotation, -1, 1);
        }
    }
}

//Bird overlay for nspecial
if(attack == AT_NSPECIAL && special_down && (state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR)){
    if(!noPeacock){
        draw_sprite_ext(nspecialPeacockIconSprite, 0, x+10, y-10, 1, 1, 0, c_gray, .7);
        draw_sprite_ext(nspecialPeacockIconSprite, 0, x-10, y-10, -1, 1, 0, c_gray, .7);
    } else if(down_down && ((spr_dir == 1 && !left_down) || (spr_dir == -1 && right_down))){
        draw_sprite_ext(nspecialPeacockIconSprite, 0, x+10, y-10, 1, 1, 0, -1, 1);
        draw_sprite_ext(nspecialPeacockIconSprite, 0, x-10, y-10, -1, 1, 0, -1, .7);
    } else if(down_down && ((spr_dir == 1 && left_down) || (spr_dir == -1 && !right_down))){
        draw_sprite_ext(nspecialPeacockIconSprite, 0, x+10, y-10, 1, 1, 0, -1, .7);
        draw_sprite_ext(nspecialPeacockIconSprite, 0, x-10, y-10, -1, 1, 0, -1, 1);
    } else {
        draw_sprite_ext(nspecialPeacockIconSprite, 0, x+10, y-10, 1, 1, 0, -1, .7);
        draw_sprite_ext(nspecialPeacockIconSprite, 0, x-10, y-10, -1, 1, 0, -1, .7);
    }
    if(!noSwallow){
        draw_sprite_ext(nspecialSwallowIconSprite, 0, x+40, y-40, 1, 1, 0, c_gray, .7);
        draw_sprite_ext(nspecialSwallowIconSprite, 0, x-40, y-40, -1, 1, 0, c_gray, .7);
    } else if(right_down && !down_down){
        draw_sprite_ext(nspecialSwallowIconSprite, 0, x+40, y-40, 1, 1, 0, -1, 1);
        draw_sprite_ext(nspecialSwallowIconSprite, 0, x-40, y-40, -1, 1, 0, -1, .7);
    } else if(left_down && !down_down){
        draw_sprite_ext(nspecialSwallowIconSprite, 0, x+40, y-40, 1, 1, 0, -1, .7);
        draw_sprite_ext(nspecialSwallowIconSprite, 0, x-40, y-40, -1, 1, 0, -1, 1);
    } else {
        draw_sprite_ext(nspecialSwallowIconSprite, 0, x+40, y-40, 1, 1, 0, -1, .7);
        draw_sprite_ext(nspecialSwallowIconSprite, 0, x-40, y-40, -1, 1, 0, -1, .7);
    }
    if(!noParrot)
        draw_sprite_ext(nspecialParrotIconSprite, 0, x, y-90, 1, 1, 0, c_gray, .9);
    else if(up_down && !right_down && !left_down && !down_down)
        draw_sprite_ext(nspecialParrotIconSprite, 0, x, y-90, 1, 1, 0,  -1, 1);
    else
        draw_sprite_ext(nspecialParrotIconSprite, 0, x, y-90, 1, 1, 0, -1, .7);
    if(!noFlicky)
        draw_sprite_ext(nspecialFlickyIconSprite, 0, x, y-char_height/2, spr_dir, 1, 0, c_gray, .9);
    else if(joy_pad_idle)
        draw_sprite_ext(nspecialFlickyIconSprite, 0, x, y-char_height/2, spr_dir, 1, 0,  -1, 1);
    else
        draw_sprite_ext(nspecialFlickyIconSprite, 0, x, y-char_height/2, spr_dir, 1, 0, -1, .7);
}