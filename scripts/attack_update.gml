// attack_update

//B - Reversals
if (attack == AT_FSPECIAL || attack == AT_DSPECIAL || attack == AT_USPECIAL){
    trigger_b_reverse();
}

switch(attack){
	case AT_DSPECIAL: // Dspecial Charge
		if (window == 1){
			set_hitbox_value(AT_DSPECIAL, 1, HG_PROJECTILE_HSPEED, 4);
		} else if (window == 2) {
			if (special_down && mine_charge < 100) {
				set_window_value(AT_DSPECIAL, 2, AG_WINDOW_TYPE, 9);
				mine_charge++;
				set_hitbox_value(AT_DSPECIAL, 1, HG_PROJECTILE_HSPEED, 4 + (mine_charge/10.0));
			} else {
				set_window_value(AT_DSPECIAL, 2, AG_WINDOW_TYPE, 1);
				move_cooldown[AT_DSPECIAL] = 80;
			}
		} else if (window == 3) {
			activeMines = true;
		}
		break;
	case AT_JAB: // Rapid Jab
		if(attack_down)
			set_window_value(AT_JAB, 7, AG_WINDOW_TYPE, 9);
		if(window == get_attack_value(AT_JAB, AG_NUM_WINDOWS)-1 && !playingJabSFX){
			sound_play(gammaElectricity2Sound, true);
			playingJabSFX = true;
		}
		break;
	case AT_DAIR: // Rapid Dair
		if(attack_down || down_strong_down || strong_down || down_stick_down)
			set_window_value(AT_DAIR, 2, AG_WINDOW_TYPE, 9);
		if(window == get_attack_value(AT_DAIR, AG_NUM_WINDOWS)-1 && !playingDairSFX){
			sound_play(gammaElectricitySound, true);
			playingDairSFX = true;
		}
		break;
	case AT_FTILT: // Rapid Ftilt
		if (attack_down || (spr_dir == 1 && right_stick_down) || (spr_dir == -1 && left_stick_down)){
			set_window_value(AT_FTILT, 2, AG_WINDOW_TYPE, 9);
		}
		break;
	case AT_USPECIAL: // CDs
		if (window == 1 && window_timer == 1){
			times_through = 0;
			can_fast_fall = false;
		}
		if (window == 2){
			if (window_timer == get_window_value(attack, 2, AG_WINDOW_LENGTH)){
				if (times_through < 2){
					times_through++;
					window_timer = 0;
				}
			}
			if (!joy_pad_idle){
				hsp += lengthdir_x(1, joy_dir);
			} else {
				hsp *= .6;
			}
			var fly_dir = point_direction(0,0,hsp,vsp);
			var fly_dist = point_distance(0,0,hsp,vsp);
			var max_speed = 6;
			if (fly_dist > max_speed){
				hsp = lengthdir_x(max_speed, fly_dir);
				vsp = lengthdir_y(max_speed, fly_dir);
			}
			can_jump = true;
			can_attack = true;
			can_shield = true;
			can_fast_fall = false;
			can_wall_jump = true;
			move_cooldown[AT_USPECIAL] = 999;
			if special_down {
				vsp = -1.5;
			}
		}
		if !free{
			set_state(PS_IDLE);
			sound_stop(gammaFanSound);
		}
		break;
	case AT_DATTACK: // Dash Attack transitions into dash
		if (state == PS_ATTACK_GROUND){
			if(was_parried){
				hsp = dash_speed*spr_dir;
			} else if(window == get_attack_value(AT_DATTACK, AG_NUM_WINDOWS) && window_timer == 19){
				if(((spr_dir == 1 && right_down) || (spr_dir == -1 && left_down)))
					set_state(PS_DASH);
			}
		} else if(was_parried){
			hsp = air_max_speed*spr_dir;
		}
		break;
	case AT_FSPECIAL: // Fspecial Stuff
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
			targeterBaseX = x-10*spr_dir;
			targeterBaseY = y-69;
		} else {
			targeterBaseX = x-18*spr_dir;
			targeterBaseY = y-63;
		}
		//holding laser
		if(window < 3){
			if(special_down){
				set_window_value(AT_FSPECIAL, 2, AG_WINDOW_TYPE, 9);
			} else {
				set_window_value(AT_FSPECIAL, 2, AG_WINDOW_TYPE, 1);
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
					sound_play(targeting2Sound, true);
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
				with oPlayer{
					if(player != other.player && !(get_player_team(player) == get_player_team(other.player) && get_match_setting(SET_TEAMATTACK) == false)){
						unMarkedPlayer = true;
						for(i = 0; i < array_length(other.markedPlayers); i++){
							if(other.markedPlayers[i] == id){
								unMarkedPlayer = false;
							}
						}
						if(unMarkedPlayer){
							targetedPlayer = collision_line(other.laserX, other.laserY, other.laserX + xLength, other.laserY - yLength, id, false, false);
							if(targetedPlayer != noone){
								other.markedPlayers[array_length(other.markedPlayers)] = targetedPlayer;
								gammaRocketMarked[other.player] = true;
								playTargetConfirmedSound = true;
							}
						}
					}
				}
				if(playTargetConfirmedSound){
					sound_play(targetConfirmedSound);
				}
				if (state_timer > 130){
					if(array_length(markedPlayers) == 0)
						window = 4;
					else
						window = 3;
					set_window_value(AT_FSPECIAL, 2, AG_WINDOW_TYPE, 1);
				}
			}
		} else if (window == 3){
			if(window_timer == 1){
				if(rocketsShot >= array_length(markedPlayers)){
					window = 4;
					activeRockets = true;
				}
			}else if(window_timer == 2){
				while(rocketsShot < array_length(markedPlayers) && !instance_exists(markedPlayers[rocketsShot])){
					rocketsShot++;
				} 
				if(rocketsShot < array_length(markedPlayers)){
					var newRocket = create_hitbox(attack, 1, x + spr_dir*get_hitbox_value(attack, 1, HG_HITBOX_X), y + get_hitbox_value(attack, 1, HG_HITBOX_Y) );
					newRocket.targetPlayer = markedPlayers[rocketsShot];
					newRocket.draw_xscale = 1;
					rocketsShot++;
				}
			}
		}
		break;
	case AT_NSPECIAL: // End Nspecial
		can_shield = true;
		//check for active birds
		if(!noSwallow){
			noSwallow = true;
			with pHitBox {
				if(orig_player == other.player && attack == AT_NSPECIAL && hbox_num == 1){
					other.noSwallow = false;
				}
			}
		}
		if(!noParrot){
			noParrot = true;
			with pHitBox {
				if(orig_player == other.player && attack == AT_NSPECIAL && hbox_num == 2){
					other.noParrot = false;
				}
			}
		}
		if(!noPeacock){
			noPeacock = true;
			with pHitBox {
				if(orig_player == other.player && attack == AT_NSPECIAL && hbox_num == 3){
					other.noPeacock = false;
				}
			}
		}
		if(!special_down && get_window_value(AT_NSPECIAL, 1, AG_WINDOW_TYPE) == 9){
			if (down_down) {
				if(noPeacock){
					sound_play(birdZetaSound);
					if(spr_dir == 1 && left_down){
						spr_dir = -1;
						create_hitbox(AT_NSPECIAL, 3, x, y);
						spr_dir = 1;
					} else if(spr_dir == -1 && right_down){
						spr_dir = 1;
						create_hitbox(AT_NSPECIAL, 3, x, y);
						spr_dir = -1;
					} else create_hitbox(AT_NSPECIAL, 3, x, y);
					noPeacock = false;
				}
			} else if(right_down){
				if(noSwallow){
					sound_play(birdEpsilonSound);
					var temp_dir = spr_dir;
					spr_dir = 1;
					create_hitbox(AT_NSPECIAL, 1, x+40, y-40);
					spr_dir = temp_dir;
					noSwallow = false;
				}
			} else if (left_down) {
				if(noSwallow){
					sound_play(birdEpsilonSound);
					var temp_dir = spr_dir;
					spr_dir = -1;
					create_hitbox(AT_NSPECIAL, 1, x-40, y-40);
					spr_dir = temp_dir;
					noSwallow = false;
				}
			} else if (up_down) {
				if(noParrot){
					sound_play(birdDeltaSound);
					create_hitbox(AT_NSPECIAL, 2, x, y-80);
					noParrot = false;
				}
			} else {
				if(noFlicky){
					sound_play(birdBetaSound);
					instance_create(x, y - char_height/2, "obj_article1");
				} else{
					with obj_article1 {
						if(state == 0){
							state = 2;
							state_timer = 0;
						}
					}
				}
			}
			set_window_value(AT_NSPECIAL, 1, AG_WINDOW_TYPE, 0);
		}
		break;
}

// Undo Rapids
if !attack_down{
	if(!(spr_dir == 1 && right_stick_down) && !(spr_dir == -1 && left_stick_down))
		set_window_value(AT_FTILT, 2, AG_WINDOW_TYPE, 1);
	set_window_value(AT_JAB, 7, AG_WINDOW_TYPE, 1);
	if(!down_strong_down && !strong_down && !down_stick_down)
		set_window_value(AT_DAIR, 2, AG_WINDOW_TYPE, 1);
}



#define range_finder(ox, oy, dir, range, object, prec, notme)
// https://www.gmlscripts.com/script/range_finder
var dx, dy, sx, sy, distance;
sx = lengthdir_x(range,dir);
sy = lengthdir_y(range,dir);
dx = ox + sx;
dy = oy + sy;
if (collision_line(ox,oy,dx,dy,object,prec,notme) < 0) {
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