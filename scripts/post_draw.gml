//post-draw

//drawing the laser targeter for Fspecial
if(attack == AT_FSPECIAL && (state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR)){
    if(window == 1){
        if(image_index > 0){
            draw_sprite_ext(fspecialTargetingSprite, image_index-1, targeterBaseX, targeterBaseY, spr_dir, 1, 0, -1, 1);
        }
    } else if (window == 2){
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

//draw mark effect on gamma if a rocket gets reflected
if(gammaRocketMarked[player]){
    shader_start();
    draw_sprite_ext(rocketMarked, state_timer/6, x, y - char_height/2, 1, 1, 0, -1, .5);
    shader_end();
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