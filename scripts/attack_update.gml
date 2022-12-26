// attack_update

//B - Reversals
if (attack == AT_FSPECIAL || attack == AT_DSPECIAL || attack == AT_USPECIAL){
    trigger_b_reverse();
}

unlimitedAltEvent = "attack_update";
user_event(0);

if(!hitpause){
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
					set_window_value(AT_DSPECIAL, 2, AG_WINDOW_TYPE, 0);
					move_cooldown[AT_DSPECIAL] = 80;
				}
			} else if (window == 3) {
				activeMines = true;
			}
			break;
		case AT_JAB: // Rapid Jab
			if(attack_down)
				set_window_value(AT_JAB, 8, AG_WINDOW_TYPE, 9);
			if(window == get_attack_value(AT_JAB, AG_NUM_WINDOWS)-1 && !playingJabSFX){
				gammaElectricity2SoundInstance = sound_play(gammaElectricity2Sound, true);
				playingJabSFX = true;
			}
			break;
		case AT_DAIR: // Rapid Dair
			if(!runeE){
				if(attack_down || down_strong_down || strong_down || down_stick_down)
					set_window_value(AT_DAIR, 2, AG_WINDOW_TYPE, 9);
				if(window == get_attack_value(AT_DAIR, AG_NUM_WINDOWS)-1 && !playingDairSFX){
					gammaElectricitySoundInstance = sound_play(gammaElectricitySound, true);
					playingDairSFX = true;
				}
			}
			break;
		case AT_FTILT: // Rapid Ftilt
			if (attack_down || (spr_dir == 1 && right_stick_down) || (spr_dir == -1 && left_stick_down)){
				set_window_value(AT_FTILT, 2, AG_WINDOW_TYPE, 9);
			}
			break;
		case AT_USPECIAL: // CDs
			if (window == 2){
				if (window_timer == get_window_value(attack, 2, AG_WINDOW_LENGTH)){
					if (times_through < 2 || runeJ){
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
				can_special = true;
				move_cooldown[AT_USPECIAL] = 2147483647;
				if(up_down || special_down){
					vsp = -1.5*(runeB ? 2 : 1);
				}
			}
			if !free{
				set_state(PS_IDLE);
				sound_stop(gammaFanSoundInstance);
			}
			break;
		case AT_USPECIAL_2:
			can_jump = true;
			can_attack = true;
			can_fast_fall = false;
			can_shield = true;
			can_wall_jump = true;
			can_special = true;
			can_djump = true;
			move_cooldown[AT_USPECIAL] = 0;
			djumps = 0;
			vsp = (y > view_get_yview() + view_get_hview() - 30 ? -1 : 0) + (state_timer % 62 > 30 ? (15 - state_timer % 31) : (state_timer % 31 - 15))/14;
			if(down_hard_pressed){
				set_state(PS_IDLE_AIR);
			}
			break;
		case AT_DATTACK: // Dash Attack transitions into dash
			if(was_parried){
        		set_attack_value(attack, AG_USES_CUSTOM_GRAVITY, false);
			} else if (has_hit){
        		set_attack_value(attack, AG_USES_CUSTOM_GRAVITY, true);
			}
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
		case AT_FSPECIAL: 
			fspecialEvent = "attack_update";
			user_event(1);
			break;
		case AT_NSPECIAL: // End Nspecial
			can_shield = true;
			//check for active birds
			if(runeL){
				noSwallow = true;
				noParrot = true;
				noPeacock = true;
				noFlicky = true;
			}
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
			var down_winner = (down_counter < up_counter && down_counter < right_counter && down_counter < left_counter && down_pressed) || down_down;
			var right_winner = ((right_winner < up_counter && right_winner < down_counter && right_winner < left_counter && right_pressed) || right_down) && !down_winner;
			var left_winner = ((left_winner < up_counter && left_winner < right_counter && left_winner < down_counter && left_pressed) || left_down) && !down_winner && !right_winner;
			var up_winner = ((up_winner < down_counter && up_winner < right_counter && up_winner < left_counter && up_pressed) || up_down) && !down_winner && !right_winner && !left_winner;
			if(!special_down && get_window_value(AT_NSPECIAL, 1, AG_WINDOW_TYPE) == 9){
				if (down_winner) {
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
				} else if(right_winner){
					if(noSwallow){
						sound_play(birdEpsilonSound);
						var temp_dir = spr_dir;
						spr_dir = 1;
						create_hitbox(AT_NSPECIAL, 1, x+40, y-40);
						spr_dir = temp_dir;
						noSwallow = false;
					}
				} else if (left_winner) {
					if(noSwallow){
						sound_play(birdEpsilonSound);
						var temp_dir = spr_dir;
						spr_dir = -1;
						create_hitbox(AT_NSPECIAL, 1, x-40, y-40);
						spr_dir = temp_dir;
						noSwallow = false;
					}
				} else if (up_winner) {
					if(noParrot){
						sound_play(birdDeltaSound);
						create_hitbox(AT_NSPECIAL, 2, x, y-80);
						noParrot = false;
					}
				} else {
					if(noFlicky){
						sound_play(birdBetaSound);
						instance_create(x, y - char_height/2, "obj_article1");
						noFlicky = false;
					} else{
						with obj_article1 {
							if(player_id == other.id && kirby == -1){
								if(state == 0 || state == 4){
									state = 2;
									state_timer = 0;
								}
							}
						}
					}
				}
				set_window_value(AT_NSPECIAL, 1, AG_WINDOW_TYPE, 0);
			}
			break;
		case AT_FSTRONG:
			if(!runeD){
				if(window == 2){
					if(window_timer == 1){
						gammaElectricitySoundInstance = sound_play(gammaElectricitySound);
					}
					set_hitbox_value(AT_FSTRONG, 3, HG_PROJECTILE_HSPEED, 3 + 6*strong_charge/60);
				}
			}
			break;
		case AT_USTRONG:
			if(!runeC){
				if(window == 3){
					if(window_timer == 1){
						gammaElectricitySoundInstance = sound_play(gammaElectricitySound);
					}
				}
			}
			break;
		case AT_UAIR:
			if(window == 2){
				if(window_timer == 1){
					gammaElectricitySoundInstance = sound_play(gammaElectricitySound);
				}
			}
			break;
	}

	// Undo Rapids
	if !attack_down{
		if(!(spr_dir == 1 && right_stick_down) && !(spr_dir == -1 && left_stick_down))
			set_window_value(AT_FTILT, 2, AG_WINDOW_TYPE, 0);
		set_window_value(AT_JAB, 8, AG_WINDOW_TYPE, 0);
		if(!runeE){
			if(!down_strong_down && !strong_down && !down_stick_down)
				set_window_value(AT_DAIR, 2, AG_WINDOW_TYPE, 0);
		}
	}
}