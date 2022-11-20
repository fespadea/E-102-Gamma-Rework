// fspecial

#macro NORMAL_ARTICLES_ARRAY 8
#macro NORMAL_BASE_ARTICLES_ARRAY 6
#macro NORMAL_NEUTRAL_BASE_ARTICLES_ARRAY 11


switch(fspecialEvent){
    case "init":
        // targeting
        drawTargeter = false;
        targerterRotation = 0;
        targeterRotationRad = 0;
        targerterDir = 1;
        laserX = 0.0;
        laserY = 0.0;
        lengthLaser = 0;
        maxPositiveRotation = 30;
        minNegativeRotation = -maxPositiveRotation;
        xDistanceToTargetPoint = 16;
        yDistanceToTargetPoint = 5;
        distanceToTargetPoint = sqrt(xDistanceToTargetPoint*xDistanceToTargetPoint + yDistanceToTargetPoint*yDistanceToTargetPoint);
        angleToTargetPoint = arctan(yDistanceToTargetPoint/xDistanceToTargetPoint);
        markedPlayers = [];
        drawTargets = [];
        rocketsShot = 0;
        activeRockets = false;
        targetConfirmedSound = sound_get("TargetConfirmed");
        var largestPlayerNumber = 0;
        with oPlayer{
            if(player > largestPlayerNumber){
                largestPlayerNumber = player;
            }
        }
        for(var i = 0; i <= largestPlayerNumber; i++){
            gammaRocketMarked[i] = false;
        }
        solidBlockObject = asset_get("par_block");
        targeterBaseX = x-10*spr_dir;
        targeterBaseY = y-69;
        multiplier = 1;
        smokeObject = asset_get("smoke_obj");
        holyGuyObject = asset_get("holy_guy_obj");
        articles = [obj_article1, obj_article2, obj_article3, obj_article_solid, obj_article_platform, obj_stage_article, obj_stage_article_platform, obj_stage_article_solid, pHitBox];
        baseArticles = [asset_get("rock_obj"), asset_get("pillar_obj"), asset_get("smoke_obj"), asset_get("frog_bubble_obj"), asset_get("olymp_gem_obj"), asset_get("pomme_guard_obj"), asset_get("steam_bubble_obj"), asset_get("chester_obj"), asset_get("hodan_spirit_obj"), asset_get("moth_bomb_obj"), asset_get("gus_anchor_obj"), asset_get("orb_obj"), asset_get("steam_bomb_obj"), asset_get("ice_obj"), asset_get("cloud_obj"), asset_get("puddle_obj"), asset_get("wind_obj"), asset_get("wolf_bud_obj"), asset_get("wolf_grass_obj"), asset_get("plasma_field_obj"), asset_get("plant_obj"), asset_get("pBurnBox"),
            asset_get("promo_sword_obj"), asset_get("promo_ball_obj"), asset_get("bubble_obj"), asset_get("big_bubble_obj"), asset_get("abyss_tornado_obj"), asset_get("promo_flag_obj"), asset_get("kragg_statue_obj"), asset_get("kragg_genesis_obj"), asset_get("falling_cactus_obj"), asset_get("decoy_cactus_obj"), asset_get("dream_star_obj"), asset_get("mark_leaf_obj"), asset_get("penguin_ball_obj"), asset_get("genesis_tv_obj"), asset_get("etalus_icecream_obj"), asset_get("etalus_icecream_splat_obj"), asset_get("promo_shard_obj"), asset_get("promo_cape_obj"), asset_get("tongue_obj"),
            asset_get("frog_small_bubble_obj"), asset_get("clairen_pong_ball_obj"), asset_get("clairen_cactus_obj"), asset_get("wolf_ftilt_obj"), asset_get("wolf_vine_ball_obj"), asset_get("wolf_bair_vine_obj"), asset_get("steam_mech_obj"), asset_get("steam_claw_obj"), asset_get("gus_gem"), asset_get("moneybag_obj"), asset_get("gus_rock_obj"), asset_get("exclamation_obj"), asset_get("treasure_rock_obj"), asset_get("mobile_gear_obj"), asset_get("shield_knight_obj"), asset_get("champ_sk_item_obj"), asset_get("hodan_whirl_obj"), asset_get("pomme_field_obj"), asset_get("mud_pop_obj"),
            asset_get("olymp_crystal_shatter_obj"), asset_get("olymp_dsmash_crystal_obj"), asset_get("seasonal_obj"), asset_get("graffiti_obj"), asset_get("graffiti_can_obj"), asset_get("ratcopter_obj"), asset_get("promo_plush_obj"), asset_get("fors_plush_obj")];
        // the noone is holding the spot of holyGuyObject which is only hittable/targettable under certain conditions
        neutralBaseArticles = [noone, asset_get("obj_tetherball"), asset_get("abyss_pinata_obj"), asset_get("target_obj"), asset_get("abyss_seed_obj"), asset_get("abyss_root_obj"), asset_get("abyss_bomb_obj"), asset_get("boss_eye_obj"), asset_get("troupple_fish_obj"), asset_get("ice_wall_obj"), asset_get("rockwall_support_obj"), asset_get("holy_bug_obj"), asset_get("holy_plant_obj"), asset_get("holy_law_obj"), asset_get("troupple_king_obj"), asset_get("abyss_portal_obj"), asset_get("abyss_capture_point_obj"), asset_get("abyss_cpu_explode_obj"), asset_get("abyss_mine_obj")];

        // whether Gamma is floating during fspecial
        aerialFSpecialActive = false;
        
        // bool to keep track of whether fspecial sfx is playing
        playingFSpecialSFX = false;

        // targetting sound instance
        targeting2SoundInstance = -1;

        // rocket VFX
        rocketMarked = sprite_get("fspecial_marked");
        rocketFollowerVFX = hit_fx_create(sprite_get("fspecial_proj_follower"), 18);
        break;
    case "attack_update":
        //float mechanic
        if(state == PS_ATTACK_AIR){
            if(floatActive){
                set_attack_value(AT_FSPECIAL, AG_HURTBOX_AIR_SPRITE, fspecialAirFloatHurtSprite);
            } else {
                set_attack_value(AT_FSPECIAL, AG_HURTBOX_AIR_SPRITE, fspecialAirHurtSprite);
            }
        } else {
            set_attack_value(AT_FSPECIAL, AG_HURTBOX_AIR_SPRITE, fspecialHurtSprite);
        }
        hurtboxID.sprite_index = get_attack_value(AT_FSPECIAL, AG_HURTBOX_AIR_SPRITE);
        if(state == PS_ATTACK_GROUND){
            targeterBaseX = x-10*spr_dir+hsp;
            targeterBaseY = y-69+vsp;
        } else {
            targeterBaseX = x-18*spr_dir+hsp;
            targeterBaseY = y-63+vsp;
        }
        //holding laser
        if(window < 3){
            if(special_down){
                set_window_value(AT_FSPECIAL, 2, AG_WINDOW_TYPE, 9);
            } else {
                set_window_value(AT_FSPECIAL, 2, AG_WINDOW_TYPE, 0);
            }
            //cancel early
            can_jump = true;
            can_wall_jump = true;
            can_attack = true;
            can_shield = true;
            can_move = true;
            if(window == 1){
                targeterDir = spr_dir;
            }else if(window == 2){
                if(window_timer == 1 && !playingFSpecialSFX){
                    targeting2SoundInstance = sound_play(targeting2Sound, true);
                    playingFSpecialSFX = true;
                }
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
                lengthLaser = range_finder(laserX, laserY, targeterRotation + (targeterDir == 1 ? 0 : 180), 1000, solidBlockObject, false, true)/2;
                var xLength = 2*lengthLaser*cos(targeterRotationRad)*targeterDir;
                var yLength = 2*lengthLaser*sin(targeterRotationRad)*targeterDir;
                var playTargetConfirmedSound = false;
                var unMarkedPlayer;
                var targetedPlayer;
                var i;
                var j;
                var k;
                var largestPlayerNumber = 0; // used for articles and projectiles after this
                with oPlayer{
                    if(player > largestPlayerNumber){
                        largestPlayerNumber = player;
                    }
                    if(player != other.player && !(get_player_team(player) == get_player_team(other.player) && get_match_setting(SET_TEAMATTACK) == false)){
                        if(state != PS_DEAD && state != PS_RESPAWN){
                            var forsburnInSmoke = url == CH_FORSBURN;
                            if(forsburnInSmoke){
                                forsburnInSmoke = false;
                                with other.smokeObject {
                                    // forsburn width is 40 and smoke cloud width/height is 100
                                    if (other.x-20 > get_instance_x(self)-50 && other.x+20 < get_instance_x(self)+50 && other.y < get_instance_y(self)+50 && other.y -other.char_height > get_instance_y(self)-50){
                                        forsburnInSmoke = true;
                                        break;
                                    }
                                }
                            }
                            if(!forsburnInSmoke){
                                unMarkedPlayer = true;
                                for(i = 0; i < array_length(other.markedPlayers); i++){
                                    if(other.markedPlayers[i] == self){
                                        unMarkedPlayer = false;
                                    }
                                }
                                if(unMarkedPlayer){
                                    targetedPlayer = collision_line(other.laserX, other.laserY, other.laserX + xLength, other.laserY - yLength, id, false, false);
                                    if(targetedPlayer != noone){
                                        other.drawTargets[array_length(other.markedPlayers)] = false;
                                        other.markedPlayers[array_length(other.markedPlayers)] = targetedPlayer;
                                        gammaRocketMarked[other.player] = true;
                                        playTargetConfirmedSound = true;
                                    }
                                }
                            }
                        }
                    }
                }
                for(i = 0; i < (runeG ? array_length(articles) : NORMAL_ARTICLES_ARRAY); i++){
                    with articles[i] {
                        if(player != other.player && !(get_player_team(player) == get_player_team(other.player) && get_match_setting(SET_TEAMATTACK) == false)){
                            if((other.runeG && other.articles[i] != obj_stage_article_platform && other.articles[i] != obj_stage_article_solid) || is_hittable){
                                unMarkedPlayer = true;
                                for(j = 0; j < array_length(other.markedPlayers); j++){
                                    if(other.markedPlayers[j] == self){
                                        unMarkedPlayer = false;
                                    }
                                }
                                if(unMarkedPlayer){
                                    targetedPlayer = collision_line(other.laserX, other.laserY, other.laserX + xLength, other.laserY - yLength, id, false, false);
                                    if(targetedPlayer != noone){
                                        other.drawTargets[array_length(other.markedPlayers)] = true;
                                        other.markedPlayers[array_length(other.markedPlayers)] = targetedPlayer;
                                        for(k = ("gammaRocketMarked" in self ? array_length(gammaRocketMarked) : 0); k <= largestPlayerNumber; k++){
                                            gammaRocketMarked[k] = false;
                                        }
                                        gammaRocketMarked[other.player] = true;
                                        playTargetConfirmedSound = true;
                                        if(!("char_height" in self)){
                                            if(sprite_index == other.emptySprite){
                                                char_height = (sprite_get_yoffset(mask_index) - sprite_get_height(mask_index)/2)*2;
                                            } else{
                                                char_height = (sprite_get_yoffset(sprite_index) - sprite_get_height(sprite_index)/2)*2;
                                            }
                                        }
                                        if(!("gammaTargetWidth" in self)){
                                            if(sprite_index == other.emptySprite){
                                                gammaTargetWidth = (sprite_get_xoffset(mask_index) - sprite_get_width(mask_index)/2)*2;
                                            } else{
                                                gammaTargetWidth = (sprite_get_xoffset(sprite_index) - sprite_get_width(sprite_index)/2)*2;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                for(i = 0; i < (runeG ? array_length(baseArticles) : NORMAL_BASE_ARTICLES_ARRAY); i++){
                    with baseArticles[i] {
                        if(get_instance_player(self) != other.player && !(get_player_team(get_instance_player(self)) == get_player_team(other.player) && get_match_setting(SET_TEAMATTACK) == false)){
                            unMarkedPlayer = true;
                            for(j = 0; j < array_length(other.markedPlayers); j++){
                                if(other.markedPlayers[j] == self){
                                    unMarkedPlayer = false;
                                }
                            }
                            if(unMarkedPlayer){
                                targetedPlayer = collision_line(other.laserX, other.laserY, other.laserX + xLength, other.laserY - yLength, self, false, false);
                                if(targetedPlayer != noone){
                                    other.drawTargets[array_length(other.markedPlayers)] = true;
                                    other.markedPlayers[array_length(other.markedPlayers)] = targetedPlayer;
                                    playTargetConfirmedSound = true;
                                }
                            }
                        }
                    }
                }
                for(i = 0; i < (runeG ? array_length(neutralBaseArticles) : NORMAL_NEUTRAL_BASE_ARTICLES_ARRAY); i++){
                    if(neutralBaseArticles[i] != noone){
                        with neutralBaseArticles[i] {
                            unMarkedPlayer = true;
                            for(j = 0; j < array_length(other.markedPlayers); j++){
                                if(other.markedPlayers[j] == self){
                                    unMarkedPlayer = false;
                                }
                            }
                            if(unMarkedPlayer){
                                targetedPlayer = collision_line(other.laserX, other.laserY, other.laserX + xLength, other.laserY - yLength, self, false, false);
                                if(targetedPlayer != noone){
                                    other.drawTargets[array_length(other.markedPlayers)] = true;
                                    other.markedPlayers[array_length(other.markedPlayers)] = targetedPlayer;
                                    playTargetConfirmedSound = true;
                                }
                            }
                        }
                    }
                }
                debugEvent = "attack_update";
                user_event(2);
                if(playTargetConfirmedSound){
                    sound_play(targetConfirmedSound);
                }
                if (state_timer > 130){
                    if(array_length(markedPlayers) == 0)
                        window = 4;
                    else
                        window = 3;
                    set_window_value(AT_FSPECIAL, 2, AG_WINDOW_TYPE, 0);
                }
            }
        } else if (window == 3){
            if(window_timer == 1){
                while(rocketsShot < array_length(markedPlayers)*multiplier && !instance_exists(markedPlayers[floor(rocketsShot/multiplier)])){
                    rocketsShot++;
                } 
                if(rocketsShot >= array_length(markedPlayers)*multiplier){
                    window = 4;
                    activeRockets = true;
                }
            }else if(window_timer == 2){
                while(rocketsShot < array_length(markedPlayers)*multiplier && !instance_exists(markedPlayers[floor(rocketsShot/multiplier)])){
                    rocketsShot++;
                } 
                if(rocketsShot < array_length(markedPlayers)*multiplier){
                    var newRocket = create_hitbox(attack, 1, x + spr_dir*get_hitbox_value(attack, 1, HG_HITBOX_X), y + get_hitbox_value(attack, 1, HG_HITBOX_Y) );
                    newRocket.targetPlayer = markedPlayers[floor(rocketsShot/multiplier)];
                    newRocket.draw_xscale = 1;
                    rocketsShot++;
                }
            }
        }
        break;
    case "update": // some floating mechanic during fspecial stuff is left in update.gml 
        //Open up mark slot if rocket no longer active
        multiplier = (runeI ? 2 : 1)*(runeN ? 3 : 1);
        for(var i = 0; i < min(array_length(markedPlayers), floor(rocketsShot/multiplier)); i++){
            drawTargets[i] = false;
        }
        if(activeRockets || state == PS_PARRY_START){ // This is undone in hitbox_update.gml if there is still an active rocket (using fact that update.gml runs first)
            move_cooldown[AT_FSPECIAL] = 140;
            for(var i = 0; i < array_length(markedPlayers); i++){
                if(instance_exists(markedPlayers[i])){
                    if("gammaRocketMarked" in markedPlayers[i]){
                        markedPlayers[i].gammaRocketMarked[player] = false;
                    }
                }
            }
            markedPlayers = [];
            activeRockets = false;
        } else {
            move_cooldown[AT_FSPECIAL] = 0;
        }

        // check for living Eid
        with holyGuyObject {
            if(get_instance_x(self) == 620){
                other.neutralBaseArticles[0] = other.holyGuyObject;
            }
            if(other.neutralBaseArticles[0] != noone){
                if(get_instance_x(self) >= 620 && get_instance_x(self) <= 660){
                    if(place_meeting(get_instance_x(self), get_instance_y(self), pHitBox)){
                        other.neutralBaseArticles[0] = noone;
                    }
                } else{
                    other.neutralBaseArticles[0] = noone;
                }
            }
        }
        break;
    case "other_post_draw": // this stuff is just done in other_post_draw.gml
        break;
    case "post_draw":
        //drawing the laser targeter for Fspecial
        if(attack == AT_FSPECIAL && (state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR)){
            if(window == 1){
                if(image_index > 0){
                    draw_sprite_ext(fspecialTargetingSprite, image_index-1, targeterBaseX, targeterBaseY, spr_dir, 1, 0, -1, 1);
                }
            } else if (window == 2){
                draw_sprite_ext(fspecialTargetingSprite, 3, targeterBaseX, targeterBaseY, targeterDir, 1, targeterRotation, -1, 1);
            } else {
                if(image_index < 10){
                draw_sprite_ext(fspecialTargetingSprite, 3, targeterBaseX, targeterBaseY, targeterDir, 1, targeterRotation, -1, 1);
                } else if(image_index < 13){
                draw_sprite_ext(fspecialTargetingSprite, 12 - image_index, targeterBaseX, targeterBaseY, targeterDir, 1, targeterRotation, -1, 1);
                }
            }
        }

        unlimitedAltEvent = "post_draw"; // this is called here to have the 
        user_event(0);

        //drawing the laser for Fspecial
        if(attack == AT_FSPECIAL && (state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR)){
            if (window == 2){
                if(state_timer < 100)
                    draw_sprite_ext(fspecialLaser, 0, laserX, laserY, targeterDir*lengthLaser, 1, targeterRotation, -1, 0.3);
                else
                    draw_sprite_ext(fspecialLaserOld, 0, laserX, laserY, targeterDir*lengthLaser, 1, targeterRotation, -1, 0.3-(state_timer-100)/100);
            }
        }

        //draw mark effect on gamma if a rocket gets reflected
        if(gammaRocketMarked[player]){
            shader_start();
            draw_sprite_ext(rocketMarked, state_timer/6, x, y - char_height/2, 1, 1, 0, -1, .5);
            shader_end();
        }

        // drawing the mark effect on non-player targets
        for(var i = 0; i < array_length(markedPlayers); i++){
            if(drawTargets[i] && instance_exists(markedPlayers[i])){
                if(!("object_index" in markedPlayers[i])){
                    shader_start();
                    draw_sprite_ext(rocketMarked, state_timer/6, get_instance_x(markedPlayers[i]), get_instance_y(markedPlayers[i]), 1, 1, 0, -1, .5);
                    shader_end();
                }else if(markedPlayers[i].object_index != oPlayer){
                    shader_start();
                    draw_sprite_ext(rocketMarked, state_timer/6, markedPlayers[i].x + markedPlayers[i].gammaTargetWidth/2, markedPlayers[i].y - markedPlayers[i].char_height/2, 1, 1, 0, -1, .5);
                    shader_end();
                }
            }
        }
        break;
    case "hitbox_init": // this stuff is just done in hitbox_init.gml
        break;
    case "hitbox_update": // this stuff is just done in hitbox_init.gml
        break;
    case "set_attack":
        // set up variables for fspecial
        targeterRotation = 0;
        rocketsShot = 0;
        break;
    case "pre_draw":
        // draw the jetpack during fspecial if floating
        if(attack == AT_FSPECIAL && state == PS_ATTACK_AIR && floatActive){
            shader_start();
            draw_sprite_ext(jetpackSprite, state_timer*jump_anim_speed, x, y, spr_dir, 1, 0, -1, 1);
            shader_end();
        }
        break;
    case "death":
    case "got_hit":
        //don't leave people marked if FSPECIAL was canceled
        if(attack == AT_FSPECIAL){
            for(var i = 0; i < array_length(markedPlayers); i++){
                if(instance_exists(markedPlayers[i])){
                    markedPlayers[i].gammaRocketMarked[player] = false;
                }
            }
            markedPlayers = [];
            with pHitBox{
                if(orig_player == other.player && attack == AT_FSPECIAL && hbox_num == 1){
                    if(instance_exists(targetPlayer)){
                        other.markedPlayers[array_length(other.markedPlayers)] = targetPlayer;
                        targetPlayer.gammaRocketMarked[other.player] = true;
                    }
                }
            }
            activeRockets = array_length(markedPlayers) > 0;
        }
        break;
}



#define range_finder(ox, oy, dir, range, object, prec, notme)
// https://www.gmlscripts.com/script/range_finder
var dx, dy, sx, sy, distance;
sx = lengthdir_x(range,dir);
sy = lengthdir_y(range,dir);
dx = ox + sx;
dy = oy + sy;
if (runeO || collision_line(ox,oy,dx,dy,object,prec,notme) < 0) {
	distance = range;
}else{
	while ((abs(sx) >= 1) || (abs(sy) >= 1)) {
		sx /= 2;
		sy /= 2;
		if (collision_line(ox,oy,dx,dy,object,prec,notme) < 0) {
			dx += sx;
			dy += sy;
		}else{
			dx -= sx;
			dy -= sy;
		}
	}
	distance = point_distance(ox,oy,dx,dy);
}
return distance;