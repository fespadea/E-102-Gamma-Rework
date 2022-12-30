//update
//Double Jump Turnaround
/*if (state == PS_DOUBLE_JUMP && state_timer == 0) {
	if (spr_dir == 1 && (left_down || (left_pressed && !right_down))) {
		spr_dir = -1;
	} else if (right_down || (right_pressed && !left_down)) {
		spr_dir = 1;
	}
}*/
//Jump Sound
if (state == PS_FIRST_JUMP && state_timer == 1){
    sound_play(djump_sound);
}

if (state == PS_HITSTUN || state_cat == SC_GROUND_NEUTRAL || state_cat == SC_GROUND_COMMITTED || state == PS_WALL_JUMP) {
    move_cooldown[AT_USPECIAL] = 0;
}


if ((attack != AT_USPECIAL_2 && attack != AT_USPECIAL) || !(state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND)) {
	sound_stop(gammaFanSoundInstance);
}

if (playingJabSFX && !(attack == AT_JAB && window == get_attack_value( AT_JAB, AG_NUM_WINDOWS)-1)){
	sound_stop(gammaElectricity2SoundInstance);
	playingJabSFX = false;
}

if (!(state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR) || (!(attack == AT_UAIR && window == get_attack_value( AT_UAIR, AG_NUM_WINDOWS)-1) && !(attack == AT_DSTRONG && window < get_attack_value(AT_DSTRONG, AG_NUM_WINDOWS) && window > 2) && attack != AT_FSTRONG && !(attack == AT_DAIR && window == get_attack_value( AT_DAIR, AG_NUM_WINDOWS)-1))){
	sound_stop(gammaElectricitySoundInstance);
	playingDairSFX = false;
}

if (playingFSpecialSFX && !((state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR) && attack = AT_FSPECIAL && window == 2)){
	sound_stop(targeting2SoundInstance);
	playingFSpecialSFX = false;
}

if(animationTimer > 0 && !hitpause){
	animationTimer--;
}

//floating mechanic
var aerialFSpecialActive = state == PS_ATTACK_AIR && attack == AT_FSPECIAL;
floatable = state_cat == SC_AIR_NEUTRAL || state == PS_WALL_JUMP || aerialFSpecialActive;
if (floatable) {
	if (vsp < 0) {
		goingUp = true;
	} else {
		if (jump_down || up_down) {
			if (goingUp || djumps == max_djumps || aerialFSpecialActive) {
				floatActive = true;
			}
		}
		goingUp = false;
	}
}

if floatActive {
	air_accel = .3;
	air_friction = .02;
	max_fall = 3;
	if (vsp > 3) {
		vsp = 3;
	}
	if (!(jump_down || up_down) || !floatable) {
		floatActive = false;
	}
} else {
	air_accel = .165;
	air_friction = .07;
	max_fall = 11;
}

//Smoothly decrease dspecial charge
if(!((state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND) && attack == AT_DSPECIAL)){
	if (mine_charge > 0){
		if(mine_charge < 3)
			mine_charge = 0;
		else
			mine_charge -= 2;
	}
}

//rejuvinate old mine if new mine dies
if(activeMines){
	numMines = 0;
	with pHitBox {
		if(other.player == player && other.player == orig_player){
			if(attack == AT_DSPECIAL && hbox_num == 1){
				other.numMines++;
			}
		}
	}
	if(numMines == 1){
		with pHitBox {
			if(other.player == player && other.player == orig_player){
				if(attack == AT_DSPECIAL && hbox_num == 1){
					age = 2;
				}
			}
		}
	}
}

fspecialEvent = "update";
user_event(1);

unlimitedAltEvent = "update";
user_event(0);

if(up_pressed){
	up_counter++;
} else {
	up_counter = 0;
}
if(down_pressed){
	down_counter++;
} else {
	down_counter = 0;
}
if(left_pressed){
	left_counter++;
} else {
	left_counter = 0;
}
if(right_pressed){
	right_counter++;
} else {
	right_counter = 0;
}

//kirby support
if swallowed {
	swallowed = 0;
	var ability_icon = gammaNspecialKirbyIcon;
    with enemykirby {
		newicon = ability_icon;
		other.kirbies[player] = id;
		betaArticleInstance = -1;
	}
}
for(var i = 0; i < array_length(kirbies); i++){
	if(kirbies[i] != -1){
		if(instance_exists(kirbies[i]) && kirbies[i].newicon == gammaNspecialKirbyIcon){
			with kirbies[i] {
				move_cooldown[AT_EXTRA_3] = max(3, move_cooldown[AT_EXTRA_3]);
				if(state != PS_ATTACK_AIR && state != PS_ATTACK_GROUND){
					if(move_cooldown[AT_EXTRA_3] <= 3){
						if(special_pressed && joy_pad_idle){
							move_cooldown[AT_EXTRA_3] = 20;
							if(betaArticleInstance != -1 && instance_exists(betaArticleInstance)){
								with betaArticleInstance {
									if(state == 0){
										state = 2;
										state_timer = 0;
									}
								}
							} else{
								var tempBetaArticleInstance = -1;
								sound_play(other.kirbyBetaSfx);
								with other{
									tempBetaArticleInstance = instance_create(other.x, other.y - other.char_height/2, "obj_article1");
									tempBetaArticleInstance.kirby = other;
								}
								betaArticleInstance = tempBetaArticleInstance;
							}
						}
					}
				}
			}
		} else{
			kirbies[i] = -1;
		}
	}
}

// Trummel and Alto Support
if trummelcodecneeded{
    trummelcodec = 17;
    trummelcodecmax = 1;
    trummelcodecsprite1 = idleSprite;
    trummelcodecsprite2 = idleSprite;
    var page = 0;

    //Page 0
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 2;

    trummelcodecline[page,1] = "IS that E-102 Gamma? I";
    trummelcodecline[page,2] = "thought he was dead.";
    trummelcodecline[page,3] = "";
    trummelcodecline[page,4] = "";
    page++; 

    //Page 1
    trummelcodecspeaker[page] = 0;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "Yup";
    trummelcodecline[page,2] = "";
    trummelcodecline[page,3] = "";
    trummelcodecline[page,4] = "";
    page++;
}


//runes
if(runesUpdated || runesEnabled){
	runesEnabled = false;
	if runeA {
		set_hitbox_value(AT_FSPECIAL, 1, HG_ANGLE_FLIPPER, 9);
	} else{
		set_hitbox_value(AT_FSPECIAL, 1, HG_ANGLE_FLIPPER, 8);
	}
	if(runeO){
		set_hitbox_value(AT_FSPECIAL, 1, HG_PROJECTILE_GROUND_BEHAVIOR, 1);
		set_hitbox_value(AT_FSPECIAL, 1, HG_PROJECTILE_WALL_BEHAVIOR, 1);
	} else{
		set_hitbox_value(AT_FSPECIAL, 1, HG_PROJECTILE_GROUND_BEHAVIOR, 0);
		set_hitbox_value(AT_FSPECIAL, 1, HG_PROJECTILE_WALL_BEHAVIOR, 0);
	}
}

if(runeF){
	if(free){
		if(y > view_get_yview() + view_get_hview() - 30 && vsp > 0 && (state == PS_IDLE_AIR || state == PS_FIRST_JUMP) && !down_down){
			vsp = 0;
			set_attack(AT_USPECIAL_2);
			set_state(PS_ATTACK_AIR);
			has_walljump = true;
			has_airdodge = true;
			sound_stop(gammaFanSoundInstance);
			gammaFanSoundInstance = sound_play(gammaFanSound, true);
		}
	}
}


debugEvent = "update";
user_event(2);