// attack_update

//B - Reversals
if (attack == AT_FSPECIAL || attack == AT_DSPECIAL || attack == AT_USPECIAL){
    trigger_b_reverse();
}

//Dspecial Charge
if (attack == AT_DSPECIAL) {
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
}

//Rapid Jab
if attack == AT_JAB{
	if(attack_down)
		set_window_value(AT_JAB, 6, AG_WINDOW_TYPE, 9);
	if(window == get_attack_value(AT_JAB, AG_NUM_WINDOWS)-1 && !playingJabSFX){
		sound_play(sound_get("GammaElectricity2"), true);
		playingJabSFX = true;
	}
}

//Rapid Dair
if (attack == AT_DAIR) {
	if(attack_down || down_strong_down || strong_down || down_stick_down)
		set_window_value(AT_DAIR, 2, AG_WINDOW_TYPE, 9);
	if(window == get_attack_value(AT_DAIR, AG_NUM_WINDOWS)-1 && !playingDairSFX){
		sound_play(sound_get("GammaElectricity"), true);
		playingDairSFX = true;
	}
}

//Rapid Ftilt
if (attack == AT_FTILT && (attack_down || (spr_dir == 1 && right_stick_down) || (spr_dir == -1 && left_stick_down))){
	set_window_value(AT_FTILT, 2, AG_WINDOW_TYPE, 9);
}

//Undo Rapids
if !attack_down{
	if(!(spr_dir == 1 && right_stick_down) && !(spr_dir == -1 && left_stick_down))
		set_window_value(AT_FTILT, 2, AG_WINDOW_TYPE, 1);
	set_window_value(AT_JAB, 6, AG_WINDOW_TYPE, 1);
	if(!down_strong_down && !strong_down && !down_stick_down)
		set_window_value(AT_DAIR, 2, AG_WINDOW_TYPE, 1);
}

//CDs
if (attack == AT_USPECIAL){
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
		sound_stop(sound_get("GammaFan"));
	}
}

//Dash Attack transitions into dash
if (attack == AT_DATTACK) {
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
}

//Fspecial Stuff
if(attack == AT_FSPECIAL){
	//float mechanic
	if(state == PS_ATTACK_AIR){
		if(floatActive){
			set_attack_value(AT_FSPECIAL, AG_HURTBOX_AIR_SPRITE, sprite_get("fspecial_air_float_hurt"));
		} else {
			set_attack_value(AT_FSPECIAL, AG_HURTBOX_AIR_SPRITE, sprite_get("fspecial_air_hurt"));
		}
	} else {
		set_attack_value(AT_FSPECIAL, AG_HURTBOX_AIR_SPRITE, sprite_get("fspecial_hurt"));
	}
	hurtboxID.sprite_index = get_attack_value(AT_FSPECIAL, AG_HURTBOX_AIR_SPRITE);
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
		if(window == 2){
			if(window_timer == 1 && !playingFSpecialSFX){
				sound_play(sound_get("targeting2"), true);
				playingFSpecialSFX = true;
			}
			if(markedPlayers[2] == 0){
				var xLength = 2*lengthLaser*cos(targeterRotationRad)*targeterDir;
				var yLength = 2*lengthLaser*sin(targeterRotationRad)*targeterDir;
				var targetedPlayer = collision_line(laserX, laserY, laserX + xLength, laserY - yLength, oPlayer, false, true);
				var duplicate = false;
				for(var i = 0; i < 3; i++){
					if(targetedPlayer == markedPlayers[i]){
						duplicate = true;
						break;
					}
				}
				if(targetedPlayer != noone && !duplicate && !targetedPlayer.clone){
					sound_play(sound_get("TargetConfirmed"));
					targetedPlayer.gammaRocketMarked = true;
					if(markedPlayers[0] == 0)
						markedPlayers[0] = targetedPlayer;
					else if(markedPlayers[1] == 0)
						markedPlayers[1] = targetedPlayer;
					else
						markedPlayers[2] = targetedPlayer;
				}
			}
			if (state_timer > 130){
				if(markedPlayers[0] == 0)
					window = 4;
				else
					window = 3;
				set_window_value(AT_FSPECIAL, 2, AG_WINDOW_TYPE, 1);
			}
		}
	} else if (window == 3){
		if(window_timer == 1){
			if(markedPlayers[rocketsShot] == 0){
				window = 4;
				if(rocketsShot){
					activeRockets = true;
				}
			}
		} else if(window_timer == 2){
			with pHitBox {
				if(orig_player == other.player && attack == AT_FSPECIAL && hbox_num == 1){
					if(targetPlayer == 0) targetPlayer = other.markedPlayers[other.rocketsShot];
				}
			}
			rocketsShot++;
		}
	}
}

//End Nspecial
if(attack == AT_NSPECIAL){
	can_shield = true;
	if(!special_down && get_window_value(AT_NSPECIAL, 1, AG_WINDOW_TYPE) == 9){
		if (down_down) {
			if(noPeacock){
				sound_play(sound_get("BirdZeta"));
				if(spr_dir == 1 && left_down){
					spr_dir = -1;
					create_hitbox(AT_NSPECIAL, 3, x, y).timeToRejuvinate = 10000;
					spr_dir = 1;
				} else if(spr_dir == -1 && right_down){
					spr_dir = 1;
					create_hitbox(AT_NSPECIAL, 3, x, y).timeToRejuvinate = 10000;
					spr_dir = -1;
				} else create_hitbox(AT_NSPECIAL, 3, x, y).timeToRejuvinate = 10000;
				noPeacock = false;
			}
		} else if(right_down){
			if(noSwallow){
				sound_play(sound_get("BirdEpsilon"));
				var temp_dir = spr_dir;
				spr_dir = 1;
				create_hitbox(AT_NSPECIAL, 1, x+40, y-40).timeToRejuvinate = 10000;
				spr_dir = temp_dir;
				noSwallow = false;
			}
		} else if (left_down) {
			if(noSwallow){
				sound_play(sound_get("BirdEpsilon"));
				var temp_dir = spr_dir;
				spr_dir = -1;
				create_hitbox(AT_NSPECIAL, 1, x-40, y-40).timeToRejuvinate = 10000;
				spr_dir = temp_dir;
				noSwallow = false;
			}
		} else if (up_down) {
			if(noParrot){
				sound_play(sound_get("BirdDelta"));
				create_hitbox(AT_NSPECIAL, 2, x, y-80).timeToRejuvinate = 10000;
				noParrot = false;
			}
		} else {
			if(noFlicky){
				sound_play(sound_get("BirdBeta"));
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
}