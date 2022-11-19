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

if (!(state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR) || (!(attack == AT_UAIR && window == get_attack_value( AT_UAIR, AG_NUM_WINDOWS)-1) && !(attack == AT_USTRONG && window == get_attack_value( AT_USTRONG, AG_NUM_WINDOWS)-1) && attack != AT_FSTRONG && !(attack == AT_DAIR && window == get_attack_value( AT_DAIR, AG_NUM_WINDOWS)-1))){
	sound_stop(gammaElectricitySoundInstance);
	playingDairSFX = false;
}

if (playingFSpecialSFX && !((state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR) && attack = AT_FSPECIAL && window == 2)){
	sound_stop(targeting2SoundInstance);
	playingFSpecialSFX = false;
}

//floating mechanic
var aerialFSpecialActive = state == PS_ATTACK_AIR && attack == AT_FSPECIAL;
floatable = state_cat == SC_AIR_NEUTRAL || state == PS_WALL_JUMP || aerialFSpecialActive;
if (floatable) {
	if (vsp < 0) {
		goingUp = true;
	} else {
		if (jump_down || (up_down && can_tap_jump())) {
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
	if (!(jump_down || (up_down && can_tap_jump())) || !floatable) {
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

//kirby support
if swallowed {
	swallowed = 0;
	var ability_icon = gammaNspecialKirbyIcon;
	print("hi");
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
	if runeC {
		set_attack_value(AT_USTRONG, AG_CATEGORY, 0);
		set_attack_value(AT_USTRONG, AG_SPRITE, sprite_get("ustrong_old"));
		set_attack_value(AT_USTRONG, AG_NUM_WINDOWS, 3);
		set_attack_value(AT_USTRONG, AG_STRONG_CHARGE_WINDOW, 1);
		set_attack_value(AT_USTRONG, AG_HURTBOX_SPRITE, sprite_get("ustrong_old_hurt"));

		set_window_value(AT_USTRONG, 1, AG_WINDOW_TYPE, 1);
		set_window_value(AT_USTRONG, 1, AG_WINDOW_LENGTH, 1);
		set_window_value(AT_USTRONG, 1, AG_WINDOW_ANIM_FRAMES, 1);
		set_window_value(AT_USTRONG, 1, AG_WINDOW_ANIM_FRAME_START, 0);

		set_window_value(AT_USTRONG, 2, AG_WINDOW_TYPE, 1);
		set_window_value(AT_USTRONG, 2, AG_WINDOW_LENGTH, 30);
		set_window_value(AT_USTRONG, 2, AG_WINDOW_ANIM_FRAMES, 10);
		set_window_value(AT_USTRONG, 2, AG_WINDOW_HAS_SFX, 1);
		set_window_value(AT_USTRONG, 2, AG_WINDOW_SFX, asset_get("sfx_absa_whip3"));
		set_window_value(AT_USTRONG, 2, AG_WINDOW_SFX_FRAME, 1);
		set_window_value(AT_USTRONG, 2, AG_WINDOW_ANIM_FRAME_START, 1);
		set_window_value(AT_USTRONG, 2, AG_WINDOW_HAS_WHIFFLAG, 10);

		set_window_value(AT_USTRONG, 3, AG_WINDOW_TYPE, 1);
		set_window_value(AT_USTRONG, 3, AG_WINDOW_LENGTH, 7);
		set_window_value(AT_USTRONG, 3, AG_WINDOW_ANIM_FRAMES, 1);
		set_window_value(AT_USTRONG, 3, AG_WINDOW_ANIM_FRAME_START, 0);
		set_window_value(AT_USTRONG, 3, AG_WINDOW_HAS_WHIFFLAG, 30);


		set_num_hitboxes(AT_USTRONG,2);

		set_hitbox_value(AT_USTRONG, 1, HG_PARENT_HITBOX, 1);
		set_hitbox_value(AT_USTRONG, 1, HG_HITBOX_TYPE, 1);
		set_hitbox_value(AT_USTRONG, 1, HG_WINDOW, 2);
		set_hitbox_value(AT_USTRONG, 1, HG_WINDOW_CREATION_FRAME, 2);
		set_hitbox_value(AT_USTRONG, 1, HG_LIFETIME, 19);
		set_hitbox_value(AT_USTRONG, 1, HG_EFFECT, 11);
		set_hitbox_value(AT_USTRONG, 1, HG_HITBOX_X, 0);
		set_hitbox_value(AT_USTRONG, 1, HG_HITBOX_Y, -40);
		set_hitbox_value(AT_USTRONG, 1, HG_WIDTH, 60);
		set_hitbox_value(AT_USTRONG, 1, HG_HEIGHT, 100);
		set_hitbox_value(AT_USTRONG, 1, HG_PRIORITY, 2);
		set_hitbox_value(AT_USTRONG, 1, HG_DAMAGE, 5);
		set_hitbox_value(AT_USTRONG, 1, HG_ANGLE, 40);
		set_hitbox_value(AT_USTRONG, 1, HG_BASE_KNOCKBACK, 5);
		set_hitbox_value(AT_USTRONG, 1, HG_KNOCKBACK_SCALING, 0.75);
		set_hitbox_value(AT_USTRONG, 1, HG_BASE_HITPAUSE, 6);
		set_hitbox_value(AT_USTRONG, 1, HG_HITPAUSE_SCALING, 0.45);
		set_hitbox_value(AT_USTRONG, 1, HG_VISUAL_EFFECT_X_OFFSET, 32);
		set_hitbox_value(AT_USTRONG, 1, HG_VISUAL_EFFECT_Y_OFFSET, -10);
		set_hitbox_value(AT_USTRONG, 1, HG_HIT_SFX, asset_get("sfx_blow_heavy1"));


		set_hitbox_value(AT_USTRONG, 2, HG_PARENT_HITBOX, 2);
		set_hitbox_value(AT_USTRONG, 2, HG_HITBOX_TYPE, 1);
		set_hitbox_value(AT_USTRONG, 2, HG_WINDOW, 2);
		set_hitbox_value(AT_USTRONG, 2, HG_WINDOW_CREATION_FRAME, 15);
		set_hitbox_value(AT_USTRONG, 2, HG_LIFETIME, 28);
		set_hitbox_value(AT_USTRONG, 2, HG_EFFECT, 11);
		set_hitbox_value(AT_USTRONG, 2, HG_HITBOX_X, 0);
		set_hitbox_value(AT_USTRONG, 2, HG_HITBOX_Y, -80);
		set_hitbox_value(AT_USTRONG, 2, HG_WIDTH, 60);
		set_hitbox_value(AT_USTRONG, 2, HG_HEIGHT, 85);
		set_hitbox_value(AT_USTRONG, 2, HG_PRIORITY, 2);
		set_hitbox_value(AT_USTRONG, 2, HG_DAMAGE, 15);
		set_hitbox_value(AT_USTRONG, 2, HG_ANGLE, 90);
		set_hitbox_value(AT_USTRONG, 2, HG_BASE_KNOCKBACK, 6);
		set_hitbox_value(AT_USTRONG, 2, HG_KNOCKBACK_SCALING, 1.2);
		set_hitbox_value(AT_USTRONG, 2, HG_BASE_HITPAUSE, 6);
		set_hitbox_value(AT_USTRONG, 2, HG_HITPAUSE_SCALING, 0.45);
		set_hitbox_value(AT_USTRONG, 2, HG_VISUAL_EFFECT_X_OFFSET, 32);
		set_hitbox_value(AT_USTRONG, 2, HG_VISUAL_EFFECT_Y_OFFSET, -10);
		set_hitbox_value(AT_USTRONG, 2, HG_HIT_SFX, asset_get("sfx_blow_heavy1"));
	} else{
		set_attack_value(AT_USTRONG, AG_CATEGORY, 0);
		set_attack_value(AT_USTRONG, AG_SPRITE, sprite_get("ustrong"));
		set_attack_value(AT_USTRONG, AG_NUM_WINDOWS, 3);
		set_attack_value(AT_USTRONG, AG_STRONG_CHARGE_WINDOW, 1);
		set_attack_value(AT_USTRONG, AG_HURTBOX_SPRITE, sprite_get("ustrong_hurt"));

		set_window_value(AT_USTRONG, 1, AG_WINDOW_LENGTH, 18);
		set_window_value(AT_USTRONG, 1, AG_WINDOW_ANIM_FRAMES, 6);
		set_window_value(AT_USTRONG, 1, AG_WINDOW_ANIM_FRAME_START, 0);

		set_window_value(AT_USTRONG, 2, AG_WINDOW_LENGTH, 14);
		set_window_value(AT_USTRONG, 2, AG_WINDOW_ANIM_FRAMES, 14);
		set_window_value(AT_USTRONG, 2, AG_WINDOW_ANIM_FRAME_START, 6);
		set_window_value(AT_USTRONG, 2, AG_WINDOW_HAS_WHIFFLAG, 10);
		set_window_value(AT_USTRONG, 2, AG_WINDOW_HAS_SFX, 0);

		set_window_value(AT_USTRONG, 3, AG_WINDOW_LENGTH, 27);
		set_window_value(AT_USTRONG, 3, AG_WINDOW_ANIM_FRAMES, 9);
		set_window_value(AT_USTRONG, 3, AG_WINDOW_ANIM_FRAME_START, 20);
		set_window_value(AT_USTRONG, 3, AG_WINDOW_HAS_WHIFFLAG, 30);


		set_num_hitboxes(AT_USTRONG,7);

		set_hitbox_value(AT_USTRONG, 1, HG_HITBOX_TYPE, 1);
		set_hitbox_value(AT_USTRONG, 1, HG_WINDOW, 2);
		set_hitbox_value(AT_USTRONG, 1, HG_WINDOW_CREATION_FRAME, 0);
		set_hitbox_value(AT_USTRONG, 1, HG_LIFETIME, 1);
		set_hitbox_value(AT_USTRONG, 1, HG_HITBOX_X, 27);
		set_hitbox_value(AT_USTRONG, 1, HG_HITBOX_Y, -42);
		set_hitbox_value(AT_USTRONG, 1, HG_WIDTH, 76);
		set_hitbox_value(AT_USTRONG, 1, HG_HEIGHT, 50);
		set_hitbox_value(AT_USTRONG, 1, HG_PRIORITY, 2);
		set_hitbox_value(AT_USTRONG, 1, HG_DAMAGE, 1);
		set_hitbox_value(AT_USTRONG, 1, HG_ANGLE, 180);
		set_hitbox_value(AT_USTRONG, 1, HG_BASE_KNOCKBACK, 10);
		set_hitbox_value(AT_USTRONG, 1, HG_BASE_HITPAUSE, 3);
		set_hitbox_value(AT_USTRONG, 1, HG_HITBOX_GROUP, 1);
		set_hitbox_value(AT_USTRONG, 1, HG_VISUAL_EFFECT, 20);
		set_hitbox_value(AT_USTRONG, 1, HG_HIT_SFX, asset_get("sfx_absa_singlezap1"));

		set_hitbox_value(AT_USTRONG, 2, HG_HITBOX_TYPE, 1);
		set_hitbox_value(AT_USTRONG, 2, HG_WINDOW, 2);
		set_hitbox_value(AT_USTRONG, 2, HG_WINDOW_CREATION_FRAME, 1);
		set_hitbox_value(AT_USTRONG, 2, HG_LIFETIME, 2);
		set_hitbox_value(AT_USTRONG, 2, HG_HITBOX_X, 5);
		set_hitbox_value(AT_USTRONG, 2, HG_HITBOX_Y, -41);
		set_hitbox_value(AT_USTRONG, 2, HG_WIDTH, 93);
		set_hitbox_value(AT_USTRONG, 2, HG_HEIGHT, 55);
		set_hitbox_value(AT_USTRONG, 2, HG_PRIORITY, 2);
		set_hitbox_value(AT_USTRONG, 2, HG_DAMAGE, 1);
		set_hitbox_value(AT_USTRONG, 2, HG_ANGLE, 180);
		set_hitbox_value(AT_USTRONG, 2, HG_BASE_KNOCKBACK, 10);
		set_hitbox_value(AT_USTRONG, 2, HG_BASE_HITPAUSE, 3);
		set_hitbox_value(AT_USTRONG, 2, HG_HITPAUSE_SCALING, 0.45);
		set_hitbox_value(AT_USTRONG, 2, HG_HITBOX_GROUP, 2);
		set_hitbox_value(AT_USTRONG, 2, HG_VISUAL_EFFECT, 20);
		set_hitbox_value(AT_USTRONG, 2, HG_HIT_SFX, asset_get("sfx_absa_singlezap1"));

		set_hitbox_value(AT_USTRONG, 3, HG_HITBOX_TYPE, 1);
		set_hitbox_value(AT_USTRONG, 3, HG_WINDOW, 2);
		set_hitbox_value(AT_USTRONG, 3, HG_WINDOW_CREATION_FRAME, 3);
		set_hitbox_value(AT_USTRONG, 3, HG_LIFETIME, 2);
		set_hitbox_value(AT_USTRONG, 3, HG_HITBOX_X, -23);
		set_hitbox_value(AT_USTRONG, 3, HG_HITBOX_Y, -42);
		set_hitbox_value(AT_USTRONG, 3, HG_WIDTH, 76);
		set_hitbox_value(AT_USTRONG, 3, HG_HEIGHT, 50);
		set_hitbox_value(AT_USTRONG, 3, HG_PRIORITY, 2);
		set_hitbox_value(AT_USTRONG, 3, HG_DAMAGE, 1);
		set_hitbox_value(AT_USTRONG, 3, HG_ANGLE, 90);
		set_hitbox_value(AT_USTRONG, 3, HG_BASE_KNOCKBACK, 5);
		set_hitbox_value(AT_USTRONG, 3, HG_BASE_HITPAUSE, 3);
		set_hitbox_value(AT_USTRONG, 3, HG_HITPAUSE_SCALING, 0.45);
		set_hitbox_value(AT_USTRONG, 3, HG_HITBOX_GROUP, 3);
		set_hitbox_value(AT_USTRONG, 3, HG_VISUAL_EFFECT, 20);
		set_hitbox_value(AT_USTRONG, 3, HG_HIT_SFX, asset_get("sfx_absa_singlezap1"));

		set_hitbox_value(AT_USTRONG, 4, HG_HITBOX_TYPE, 1);
		set_hitbox_value(AT_USTRONG, 4, HG_WINDOW, 2);
		set_hitbox_value(AT_USTRONG, 4, HG_WINDOW_CREATION_FRAME, 5);
		set_hitbox_value(AT_USTRONG, 4, HG_LIFETIME, 1);
		set_hitbox_value(AT_USTRONG, 4, HG_HITBOX_X, -22);
		set_hitbox_value(AT_USTRONG, 4, HG_HITBOX_Y, -47);
		set_hitbox_value(AT_USTRONG, 4, HG_WIDTH, 76);
		set_hitbox_value(AT_USTRONG, 4, HG_HEIGHT, 50);
		set_hitbox_value(AT_USTRONG, 4, HG_PRIORITY, 2);
		set_hitbox_value(AT_USTRONG, 4, HG_DAMAGE, 1);
		set_hitbox_value(AT_USTRONG, 4, HG_ANGLE, 0);
		set_hitbox_value(AT_USTRONG, 4, HG_BASE_KNOCKBACK, 10);
		set_hitbox_value(AT_USTRONG, 4, HG_BASE_HITPAUSE, 3);
		set_hitbox_value(AT_USTRONG, 4, HG_HITPAUSE_SCALING, 0.45);
		set_hitbox_value(AT_USTRONG, 4, HG_HITBOX_GROUP, 4);
		set_hitbox_value(AT_USTRONG, 4, HG_VISUAL_EFFECT, 20);
		set_hitbox_value(AT_USTRONG, 4, HG_HIT_SFX, asset_get("sfx_absa_singlezap1"));

		set_hitbox_value(AT_USTRONG, 5, HG_HITBOX_TYPE, 1);
		set_hitbox_value(AT_USTRONG, 5, HG_WINDOW, 2);
		set_hitbox_value(AT_USTRONG, 5, HG_WINDOW_CREATION_FRAME, 6);
		set_hitbox_value(AT_USTRONG, 5, HG_LIFETIME, 2);
		set_hitbox_value(AT_USTRONG, 5, HG_HITBOX_X, 28);
		set_hitbox_value(AT_USTRONG, 5, HG_HITBOX_Y, -47);
		set_hitbox_value(AT_USTRONG, 5, HG_WIDTH, 76);
		set_hitbox_value(AT_USTRONG, 5, HG_HEIGHT, 50);
		set_hitbox_value(AT_USTRONG, 5, HG_PRIORITY, 2);
		set_hitbox_value(AT_USTRONG, 5, HG_DAMAGE, 1);
		set_hitbox_value(AT_USTRONG, 5, HG_ANGLE, 90);
		set_hitbox_value(AT_USTRONG, 5, HG_BASE_KNOCKBACK, 5);
		set_hitbox_value(AT_USTRONG, 5, HG_BASE_HITPAUSE, 3);
		set_hitbox_value(AT_USTRONG, 5, HG_HITPAUSE_SCALING, 0.45);
		set_hitbox_value(AT_USTRONG, 5, HG_HITBOX_GROUP, 5);
		set_hitbox_value(AT_USTRONG, 5, HG_VISUAL_EFFECT, 20);
		set_hitbox_value(AT_USTRONG, 5, HG_HIT_SFX, asset_get("sfx_absa_singlezap1"));

		set_hitbox_value(AT_USTRONG, 6, HG_HITBOX_TYPE, 1);
		set_hitbox_value(AT_USTRONG, 6, HG_WINDOW, 2);
		set_hitbox_value(AT_USTRONG, 6, HG_WINDOW_CREATION_FRAME, 8);
		set_hitbox_value(AT_USTRONG, 6, HG_LIFETIME, 2);
		set_hitbox_value(AT_USTRONG, 6, HG_HITBOX_X, 27);
		set_hitbox_value(AT_USTRONG, 6, HG_HITBOX_Y, -42);
		set_hitbox_value(AT_USTRONG, 6, HG_WIDTH, 76);
		set_hitbox_value(AT_USTRONG, 6, HG_HEIGHT, 50);
		set_hitbox_value(AT_USTRONG, 6, HG_PRIORITY, 2);
		set_hitbox_value(AT_USTRONG, 6, HG_DAMAGE, 1);
		set_hitbox_value(AT_USTRONG, 6, HG_ANGLE, 180);
		set_hitbox_value(AT_USTRONG, 6, HG_BASE_KNOCKBACK, 10);
		set_hitbox_value(AT_USTRONG, 6, HG_BASE_HITPAUSE, 3);
		set_hitbox_value(AT_USTRONG, 6, HG_HITPAUSE_SCALING, 0.45);
		set_hitbox_value(AT_USTRONG, 6, HG_HITBOX_GROUP, 6);
		set_hitbox_value(AT_USTRONG, 6, HG_VISUAL_EFFECT, 20);
		set_hitbox_value(AT_USTRONG, 6, HG_HIT_SFX, asset_get("sfx_absa_singlezap1"));

		set_hitbox_value(AT_USTRONG, 7, HG_HITBOX_TYPE, 1);
		set_hitbox_value(AT_USTRONG, 7, HG_WINDOW, 2);
		set_hitbox_value(AT_USTRONG, 7, HG_WINDOW_CREATION_FRAME, 10);
		set_hitbox_value(AT_USTRONG, 7, HG_LIFETIME, 4);
		set_hitbox_value(AT_USTRONG, 7, HG_HITBOX_X, -23);
		set_hitbox_value(AT_USTRONG, 7, HG_HITBOX_Y, -42);
		set_hitbox_value(AT_USTRONG, 7, HG_WIDTH, 76);
		set_hitbox_value(AT_USTRONG, 7, HG_HEIGHT, 50);
		set_hitbox_value(AT_USTRONG, 7, HG_PRIORITY, 3);
		set_hitbox_value(AT_USTRONG, 7, HG_DAMAGE, 8);
		set_hitbox_value(AT_USTRONG, 7, HG_ANGLE, 90);
		set_hitbox_value(AT_USTRONG, 7, HG_BASE_KNOCKBACK, 7);
		set_hitbox_value(AT_USTRONG, 7, HG_KNOCKBACK_SCALING, 1.25);
		set_hitbox_value(AT_USTRONG, 7, HG_BASE_HITPAUSE, 6);
		set_hitbox_value(AT_USTRONG, 7, HG_HITPAUSE_SCALING, 1.25);
		set_hitbox_value(AT_USTRONG, 7, HG_HITBOX_GROUP, 7);
		set_hitbox_value(AT_USTRONG, 7, HG_VISUAL_EFFECT, 197);
		set_hitbox_value(AT_USTRONG, 7, HG_VISUAL_EFFECT_X_OFFSET, 32);
		set_hitbox_value(AT_USTRONG, 7, HG_VISUAL_EFFECT_Y_OFFSET, -10);
		set_hitbox_value(AT_USTRONG, 7, HG_HIT_SFX, asset_get("sfx_absa_uair"));
	}
	if runeD {
		set_attack_value(AT_FSTRONG, AG_SPRITE, sprite_get("fstrong_old"));
		set_attack_value(AT_FSTRONG, AG_NUM_WINDOWS, 3);
		set_attack_value(AT_FSTRONG, AG_STRONG_CHARGE_WINDOW, 1);
		set_attack_value(AT_FSTRONG, AG_HURTBOX_SPRITE, sprite_get("fstrong_old_hurt"));

		set_window_value(AT_FSTRONG, 1, AG_WINDOW_TYPE, 1);
		set_window_value(AT_FSTRONG, 1, AG_WINDOW_LENGTH, 12);
		set_window_value(AT_FSTRONG, 1, AG_WINDOW_ANIM_FRAMES, 6);

		set_window_value(AT_FSTRONG, 2, AG_WINDOW_TYPE, 1);
		set_window_value(AT_FSTRONG, 2, AG_WINDOW_LENGTH, 10);
		set_window_value(AT_FSTRONG, 2, AG_WINDOW_ANIM_FRAMES, 4);
		set_window_value(AT_FSTRONG, 2, AG_WINDOW_ANIM_FRAME_START, 5);
		set_window_value(AT_FSTRONG, 2, AG_WINDOW_HAS_SFX, 1);
		set_window_value(AT_FSTRONG, 2, AG_WINDOW_SFX, asset_get("sfx_abyss_explosion_big"));
		set_window_value(AT_FSTRONG, 2, AG_WINDOW_HAS_WHIFFLAG, 10);

		set_window_value(AT_FSTRONG, 3, AG_WINDOW_TYPE, 1);
		set_window_value(AT_FSTRONG, 3, AG_WINDOW_LENGTH, 10);
		set_window_value(AT_FSTRONG, 3, AG_WINDOW_ANIM_FRAMES, 6);
		set_window_value(AT_FSTRONG, 3, AG_WINDOW_ANIM_FRAME_START, 10);
		set_window_value(AT_FSTRONG, 3, AG_WINDOW_HAS_SFX, 0);

		set_num_hitboxes(AT_FSTRONG, 2);

		set_hitbox_value(AT_FSTRONG, 1, HG_HITBOX_TYPE, 1);
		set_hitbox_value(AT_FSTRONG, 1, HG_WINDOW, 2);
		set_hitbox_value(AT_FSTRONG, 1, HG_WINDOW_CREATION_FRAME, 4);
		set_hitbox_value(AT_FSTRONG, 1, HG_LIFETIME, 11);
		set_hitbox_value(AT_FSTRONG, 1, HG_HITBOX_X, 60);
		set_hitbox_value(AT_FSTRONG, 1, HG_HITBOX_Y, -40);
		set_hitbox_value(AT_FSTRONG, 1, HG_WIDTH, 85);
		set_hitbox_value(AT_FSTRONG, 1, HG_HEIGHT, 65);
		set_hitbox_value(AT_FSTRONG, 1, HG_PRIORITY, 2);
		set_hitbox_value(AT_FSTRONG, 1, HG_DAMAGE, 13);
		set_hitbox_value(AT_FSTRONG, 1, HG_ANGLE, 45);
		set_hitbox_value(AT_FSTRONG, 1, HG_BASE_KNOCKBACK, 5);
		set_hitbox_value(AT_FSTRONG, 1, HG_KNOCKBACK_SCALING, 1.1);
		set_hitbox_value(AT_FSTRONG, 1, HG_BASE_HITPAUSE, 4);
		set_hitbox_value(AT_FSTRONG, 1, HG_HITPAUSE_SCALING, .6);
		set_hitbox_value(AT_FSTRONG, 1, HG_VISUAL_EFFECT, 139);
		set_hitbox_value(AT_FSTRONG, 1, HG_VISUAL_EFFECT_X_OFFSET, 24);
		set_hitbox_value(AT_FSTRONG, 1, HG_HIT_SFX, asset_get("sfx_boss_fireball_land"));

		set_hitbox_value(AT_FSTRONG, 2, HG_HITBOX_TYPE, 1);
		set_hitbox_value(AT_FSTRONG, 2, HG_WINDOW, 2);
		set_hitbox_value(AT_FSTRONG, 2, HG_WINDOW_CREATION_FRAME, 9);
		set_hitbox_value(AT_FSTRONG, 2, HG_LIFETIME, 6);
		set_hitbox_value(AT_FSTRONG, 2, HG_HITBOX_X, 100);
		set_hitbox_value(AT_FSTRONG, 2, HG_HITBOX_Y, -40);
		set_hitbox_value(AT_FSTRONG, 2, HG_WIDTH, 65);
		set_hitbox_value(AT_FSTRONG, 2, HG_HEIGHT, 65);
		set_hitbox_value(AT_FSTRONG, 2, HG_PRIORITY, 2);
		set_hitbox_value(AT_FSTRONG, 2, HG_DAMAGE, 5);
		set_hitbox_value(AT_FSTRONG, 2, HG_ANGLE, 50);
		set_hitbox_value(AT_FSTRONG, 2, HG_BASE_KNOCKBACK, 4);
		set_hitbox_value(AT_FSTRONG, 2, HG_KNOCKBACK_SCALING, 0.45);
		set_hitbox_value(AT_FSTRONG, 2, HG_BASE_HITPAUSE, 4);
		set_hitbox_value(AT_FSTRONG, 2, HG_HITPAUSE_SCALING, .6);
		set_hitbox_value(AT_FSTRONG, 2, HG_VISUAL_EFFECT, 139);
		set_hitbox_value(AT_FSTRONG, 2, HG_VISUAL_EFFECT_X_OFFSET, 24);
		set_hitbox_value(AT_FSTRONG, 2, HG_HIT_SFX, asset_get("sfx_boss_fireball_land"));
	} else{
		set_attack_value(AT_FSTRONG, AG_SPRITE, sprite_get("fstrong"));
		set_attack_value(AT_FSTRONG, AG_NUM_WINDOWS, 4);
		set_attack_value(AT_FSTRONG, AG_STRONG_CHARGE_WINDOW, 1);
		set_attack_value(AT_FSTRONG, AG_HURTBOX_SPRITE, sprite_get("fstrong_hurt"));

		set_window_value(AT_FSTRONG, 1, AG_WINDOW_LENGTH, 14);
		set_window_value(AT_FSTRONG, 1, AG_WINDOW_ANIM_FRAMES, 7);

		set_window_value(AT_FSTRONG, 2, AG_WINDOW_LENGTH, 10);
		set_window_value(AT_FSTRONG, 2, AG_WINDOW_ANIM_FRAMES, 5);
		set_window_value(AT_FSTRONG, 2, AG_WINDOW_ANIM_FRAME_START, 7);
		set_window_value(AT_FSTRONG, 2, AG_WINDOW_HAS_WHIFFLAG, 10);
		set_window_value(AT_FSTRONG, 2, AG_WINDOW_HAS_SFX, 0);

		set_window_value(AT_FSTRONG, 3, AG_WINDOW_LENGTH, 10);
		set_window_value(AT_FSTRONG, 3, AG_WINDOW_ANIM_FRAMES, 4);
		set_window_value(AT_FSTRONG, 3, AG_WINDOW_ANIM_FRAME_START, 12);
		set_window_value(AT_FSTRONG, 3, AG_WINDOW_HAS_SFX, 1);
		set_window_value(AT_FSTRONG, 3, AG_WINDOW_SFX, sound_get("GammaBlast"));

		set_window_value(AT_FSTRONG, 4, AG_WINDOW_LENGTH, 45);
		set_window_value(AT_FSTRONG, 4, AG_WINDOW_ANIM_FRAMES, 9);
		set_window_value(AT_FSTRONG, 4, AG_WINDOW_ANIM_FRAME_START, 16);

		set_num_hitboxes(AT_FSTRONG, 3);

		set_hitbox_value(AT_FSTRONG, 1, HG_HITBOX_TYPE, 1);
		set_hitbox_value(AT_FSTRONG, 1, HG_WINDOW, 2);
		set_hitbox_value(AT_FSTRONG, 1, HG_WINDOW_CREATION_FRAME, 0);
		set_hitbox_value(AT_FSTRONG, 1, HG_LIFETIME, 10);
		set_hitbox_value(AT_FSTRONG, 1, HG_HITBOX_X, 52);
		set_hitbox_value(AT_FSTRONG, 1, HG_HITBOX_Y, -40);
		set_hitbox_value(AT_FSTRONG, 1, HG_WIDTH, 60);
		set_hitbox_value(AT_FSTRONG, 1, HG_HEIGHT, 65);
		set_hitbox_value(AT_FSTRONG, 1, HG_PRIORITY, 2);
		set_hitbox_value(AT_FSTRONG, 1, HG_DAMAGE, 4);
		set_hitbox_value(AT_FSTRONG, 1, HG_ANGLE, 100);
		set_hitbox_value(AT_FSTRONG, 1, HG_BASE_KNOCKBACK, 4);
		set_hitbox_value(AT_FSTRONG, 1, HG_BASE_HITPAUSE, 4);
		set_hitbox_value(AT_FSTRONG, 1, HG_HITPAUSE_SCALING, .6);
		set_hitbox_value(AT_FSTRONG, 1, HG_HITBOX_GROUP, -1);
		set_hitbox_value(AT_FSTRONG, 1, HG_VISUAL_EFFECT, 21);
		set_hitbox_value(AT_FSTRONG, 1, HG_VISUAL_EFFECT_X_OFFSET, 24);
		set_hitbox_value(AT_FSTRONG, 1, HG_HIT_SFX, asset_get("sfx_absa_uair"));

		set_hitbox_value(AT_FSTRONG, 2, HG_HITBOX_TYPE, 1);
		set_hitbox_value(AT_FSTRONG, 2, HG_WINDOW, 3);
		set_hitbox_value(AT_FSTRONG, 2, HG_WINDOW_CREATION_FRAME, 0);
		set_hitbox_value(AT_FSTRONG, 2, HG_LIFETIME, 10);
		set_hitbox_value(AT_FSTRONG, 2, HG_HITBOX_X, 35);
		set_hitbox_value(AT_FSTRONG, 2, HG_HITBOX_Y, -65);
		set_hitbox_value(AT_FSTRONG, 2, HG_WIDTH, 65);
		set_hitbox_value(AT_FSTRONG, 2, HG_HEIGHT, 65);
		set_hitbox_value(AT_FSTRONG, 2, HG_PRIORITY, 4);
		set_hitbox_value(AT_FSTRONG, 2, HG_DAMAGE, 4);
		set_hitbox_value(AT_FSTRONG, 2, HG_ANGLE, 110);
		set_hitbox_value(AT_FSTRONG, 2, HG_BASE_KNOCKBACK, 6);
		set_hitbox_value(AT_FSTRONG, 2, HG_KNOCKBACK_SCALING, 0.45);
		set_hitbox_value(AT_FSTRONG, 2, HG_BASE_HITPAUSE, 4);
		set_hitbox_value(AT_FSTRONG, 2, HG_HITPAUSE_SCALING, .6);
		set_hitbox_value(AT_FSTRONG, 1, HG_HITBOX_GROUP, -1);
		set_hitbox_value(AT_FSTRONG, 2, HG_VISUAL_EFFECT, 197);
		set_hitbox_value(AT_FSTRONG, 2, HG_VISUAL_EFFECT_X_OFFSET, 24);
		set_hitbox_value(AT_FSTRONG, 2, HG_HIT_SFX, asset_get("sfx_absa_uair"));

		set_hitbox_value(AT_FSTRONG, 3, HG_HITBOX_TYPE, 2);
		set_hitbox_value(AT_FSTRONG, 3, HG_WINDOW, 3);
		set_hitbox_value(AT_FSTRONG, 3, HG_WINDOW_CREATION_FRAME, 0);
		set_hitbox_value(AT_FSTRONG, 3, HG_LIFETIME, 40);
		set_hitbox_value(AT_FSTRONG, 3, HG_HITBOX_X, 52);
		set_hitbox_value(AT_FSTRONG, 3, HG_HITBOX_Y, -45);
		set_hitbox_value(AT_FSTRONG, 3, HG_WIDTH, 90);
		set_hitbox_value(AT_FSTRONG, 3, HG_HEIGHT, 60);
		set_hitbox_value(AT_FSTRONG, 3, HG_PRIORITY, 3);
		set_hitbox_value(AT_FSTRONG, 3, HG_DAMAGE, 6);
		set_hitbox_value(AT_FSTRONG, 3, HG_ANGLE, 40);
		set_hitbox_value(AT_FSTRONG, 3, HG_BASE_KNOCKBACK, 6);
		set_hitbox_value(AT_FSTRONG, 3, HG_KNOCKBACK_SCALING, 0.8);
		set_hitbox_value(AT_FSTRONG, 3, HG_BASE_HITPAUSE, 4);
		set_hitbox_value(AT_FSTRONG, 3, HG_HITPAUSE_SCALING, 1.25);
		set_hitbox_value(AT_FSTRONG, 3, HG_VISUAL_EFFECT, 125);
		set_hitbox_value(AT_FSTRONG, 3, HG_PROJECTILE_SPRITE, sprite_get("plasma_proj"));
		set_hitbox_value(AT_FSTRONG, 3, HG_PROJECTILE_MASK, sprite_get("plasma_proj"));
		set_hitbox_value(AT_FSTRONG, 3, HG_PROJECTILE_ANIM_SPEED, .5);
		set_hitbox_value(AT_FSTRONG, 3, HG_PROJECTILE_VSPEED, 0);
		set_hitbox_value(AT_FSTRONG, 3, HG_HIT_SFX, asset_get("sfx_clairen_hit_med"));
	}
	if runeE{
		set_attack_value(AT_DAIR, AG_CATEGORY, 1);
		set_attack_value(AT_DAIR, AG_SPRITE, sprite_get("dair_old"));
		set_attack_value(AT_DAIR, AG_NUM_WINDOWS, 3);
		set_attack_value(AT_DAIR, AG_HAS_LANDING_LAG, 1);
		set_attack_value(AT_DAIR, AG_LANDING_LAG, 9);
		set_attack_value(AT_DAIR, AG_HURTBOX_SPRITE, sprite_get("dair_old_hurt"));

		set_window_value(AT_DAIR, 1, AG_WINDOW_TYPE, 1);
		set_window_value(AT_DAIR, 1, AG_WINDOW_LENGTH, 15);
		set_window_value(AT_DAIR, 1, AG_WINDOW_ANIM_FRAMES, 7);
		set_window_value(AT_DAIR, 1, AG_WINDOW_ANIM_FRAME_START, 0);

		set_window_value(AT_DAIR, 2, AG_WINDOW_TYPE, 1);
		set_window_value(AT_DAIR, 2, AG_WINDOW_LENGTH, 10);
		set_window_value(AT_DAIR, 2, AG_WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT_DAIR, 2, AG_WINDOW_HAS_SFX, 1);
		set_window_value(AT_DAIR, 2, AG_WINDOW_SFX, asset_get("sfx_absa_whip3"));
		set_window_value(AT_DAIR, 2, AG_WINDOW_SFX_FRAME, 1);
		set_window_value(AT_DAIR, 2, AG_WINDOW_ANIM_FRAME_START, 6);
		set_window_value(AT_DAIR, 2, AG_WINDOW_HAS_WHIFFLAG, 10);

		set_window_value(AT_DAIR, 3, AG_WINDOW_TYPE, 1);
		set_window_value(AT_DAIR, 3, AG_WINDOW_LENGTH, 10);
		set_window_value(AT_DAIR, 3, AG_WINDOW_ANIM_FRAMES, 6);
		set_window_value(AT_DAIR, 3, AG_WINDOW_ANIM_FRAME_START, 10);
		set_window_value(AT_DAIR, 3, AG_WINDOW_HAS_WHIFFLAG, 10);

		set_num_hitboxes(AT_DAIR,2);

		set_hitbox_value(AT_DAIR, 1, HG_PARENT_HITBOX, 1);
		set_hitbox_value(AT_DAIR, 1, HG_HITBOX_TYPE, 1);
		set_hitbox_value(AT_DAIR, 1, HG_WINDOW, 2);
		set_hitbox_value(AT_DAIR, 1, HG_WINDOW_CREATION_FRAME, 0);
		set_hitbox_value(AT_DAIR, 1, HG_LIFETIME, 15);
		set_hitbox_value(AT_DAIR, 1, HG_HITBOX_X, 30);
		set_hitbox_value(AT_DAIR, 1, HG_HITBOX_Y, -3);
		set_hitbox_value(AT_DAIR, 1, HG_WIDTH, 70);
		set_hitbox_value(AT_DAIR, 1, HG_HEIGHT, 40);
		set_hitbox_value(AT_DAIR, 1, HG_PRIORITY, 2);
		set_hitbox_value(AT_DAIR, 1, HG_DAMAGE, 4);
		set_hitbox_value(AT_DAIR, 1, HG_ANGLE, -20);
		set_hitbox_value(AT_DAIR, 1, HG_BASE_KNOCKBACK, 4);
		set_hitbox_value(AT_DAIR, 1, HG_KNOCKBACK_SCALING, 0.25);
		set_hitbox_value(AT_DAIR, 1, HG_BASE_HITPAUSE, 4);
		set_hitbox_value(AT_DAIR, 1, HG_HITPAUSE_SCALING, 1.25);
		set_hitbox_value(AT_DAIR, 1, HG_VISUAL_EFFECT, 125);
		set_hitbox_value(AT_DAIR, 1, HG_VISUAL_EFFECT_X_OFFSET, 5);
		set_hitbox_value(AT_DAIR, 1, HG_VISUAL_EFFECT_Y_OFFSET, 0);
		set_hitbox_value(AT_DAIR, 1, HG_HIT_SFX, asset_get("sfx_clairen_hit_weak"));

		set_hitbox_value(AT_DAIR, 2, HG_PARENT_HITBOX, 2);
		set_hitbox_value(AT_DAIR, 2, HG_HITBOX_TYPE, 2);
		set_hitbox_value(AT_DAIR, 2, HG_WINDOW, 2);
		set_hitbox_value(AT_DAIR, 2, HG_WINDOW_CREATION_FRAME, 5);
		set_hitbox_value(AT_DAIR, 2, HG_LIFETIME, 80);
		set_hitbox_value(AT_DAIR, 2, HG_HITBOX_X, -17);
		set_hitbox_value(AT_DAIR, 2, HG_HITBOX_Y, -35);
		set_hitbox_value(AT_DAIR, 2, HG_WIDTH, 90);
		set_hitbox_value(AT_DAIR, 2, HG_HEIGHT, 60);
		set_hitbox_value(AT_DAIR, 2, HG_PRIORITY, 3);
		set_hitbox_value(AT_DAIR, 2, HG_DAMAGE, 3);
		set_hitbox_value(AT_DAIR, 2, HG_ANGLE, 70);
		set_hitbox_value(AT_DAIR, 2, HG_BASE_KNOCKBACK, 3);
		set_hitbox_value(AT_DAIR, 2, HG_KNOCKBACK_SCALING, .35);
		set_hitbox_value(AT_DAIR, 2, HG_BASE_HITPAUSE, 4);
		set_hitbox_value(AT_DAIR, 2, HG_HITPAUSE_SCALING, 1.25);
		set_hitbox_value(AT_DAIR, 2, HG_VISUAL_EFFECT, 125);
		set_hitbox_value(AT_DAIR, 2, HG_VISUAL_EFFECT_Y_OFFSET, 0);
		set_hitbox_value(AT_DAIR, 2, HG_PROJECTILE_SPRITE, sprite_get("dair_old_proj"));
		set_hitbox_value(AT_DAIR, 2, HG_PROJECTILE_MASK, sprite_get("dair_old_proj"));
		set_hitbox_value(AT_DAIR, 2, HG_PROJECTILE_ANIM_SPEED, .5);
		set_hitbox_value(AT_DAIR, 2, HG_PROJECTILE_HSPEED, 2);
		set_hitbox_value(AT_DAIR, 2, HG_PROJECTILE_VSPEED, 2);
		set_hitbox_value(AT_DAIR, 2, HG_HIT_SFX, asset_get("sfx_clairen_hit_med"));
	} else{
		set_attack_value(AT_DAIR, AG_CATEGORY, 1);
		set_attack_value(AT_DAIR, AG_SPRITE, sprite_get("dair"));
		set_attack_value(AT_DAIR, AG_NUM_WINDOWS, 3);
		set_attack_value(AT_DAIR, AG_HAS_LANDING_LAG, 1);
		set_attack_value(AT_DAIR, AG_LANDING_LAG, 9);
		set_attack_value(AT_DAIR, AG_HURTBOX_SPRITE, sprite_get("dair_hurt"));

		set_window_value(AT_DAIR, 1, AG_WINDOW_LENGTH, 10);
		set_window_value(AT_DAIR, 1, AG_WINDOW_ANIM_FRAMES, 6);
		set_window_value(AT_DAIR, 1, AG_WINDOW_ANIM_FRAME_START, 0);

		set_window_value(AT_DAIR, 2, AG_WINDOW_LENGTH, 10);
		set_window_value(AT_DAIR, 2, AG_WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT_DAIR, 2, AG_WINDOW_ANIM_FRAME_START, 6);
		set_window_value(AT_DAIR, 2, AG_WINDOW_HAS_SFX, 0);

		set_window_value(AT_DAIR, 3, AG_WINDOW_LENGTH, 10);
		set_window_value(AT_DAIR, 3, AG_WINDOW_ANIM_FRAMES, 6);
		set_window_value(AT_DAIR, 3, AG_WINDOW_ANIM_FRAME_START, 9);

		set_num_hitboxes(AT_DAIR, 2);

		set_hitbox_value(AT_DAIR, 1, HG_HITBOX_TYPE, 1);
		set_hitbox_value(AT_DAIR, 1, HG_WINDOW, 2);
		set_hitbox_value(AT_DAIR, 1, HG_WINDOW_CREATION_FRAME, 0);
		set_hitbox_value(AT_DAIR, 1, HG_LIFETIME, 10);
		set_hitbox_value(AT_DAIR, 1, HG_HITBOX_X, 25);
		set_hitbox_value(AT_DAIR, 1, HG_HITBOX_Y, -10);
		set_hitbox_value(AT_DAIR, 1, HG_WIDTH, 70);
		set_hitbox_value(AT_DAIR, 1, HG_HEIGHT, 40);
		set_hitbox_value(AT_DAIR, 1, HG_PRIORITY, 2);
		set_hitbox_value(AT_DAIR, 1, HG_DAMAGE, 1);
		set_hitbox_value(AT_DAIR, 1, HG_ANGLE, -45);
		set_hitbox_value(AT_DAIR, 1, HG_BASE_KNOCKBACK, .5);
		set_hitbox_value(AT_DAIR, 1, HG_HITBOX_GROUP, -1);
		set_hitbox_value(AT_DAIR, 1, HG_VISUAL_EFFECT, 20);
		set_hitbox_value(AT_DAIR, 1, HG_VISUAL_EFFECT_X_OFFSET, 5);
		set_hitbox_value(AT_DAIR, 1, HG_VISUAL_EFFECT_Y_OFFSET, 0);
		set_hitbox_value(AT_DAIR, 1, HG_HIT_SFX, asset_get("sfx_absa_singlezap1"));

		set_hitbox_value(AT_DAIR, 2, HG_HITBOX_TYPE, 1);
		set_hitbox_value(AT_DAIR, 2, HG_WINDOW, 3);
		set_hitbox_value(AT_DAIR, 2, HG_WINDOW_CREATION_FRAME, 0);
		set_hitbox_value(AT_DAIR, 2, HG_LIFETIME, 1);
		set_hitbox_value(AT_DAIR, 2, HG_HITBOX_X, 25);
		set_hitbox_value(AT_DAIR, 2, HG_HITBOX_Y, -10);
		set_hitbox_value(AT_DAIR, 2, HG_WIDTH, 70);
		set_hitbox_value(AT_DAIR, 2, HG_HEIGHT, 40);
		set_hitbox_value(AT_DAIR, 2, HG_PRIORITY, 2);
		set_hitbox_value(AT_DAIR, 2, HG_DAMAGE, 4);
		set_hitbox_value(AT_DAIR, 2, HG_ANGLE, -45);
		set_hitbox_value(AT_DAIR, 2, HG_BASE_KNOCKBACK, 7);
		set_hitbox_value(AT_FAIR, 2, HG_KNOCKBACK_SCALING, 1.5);
		set_hitbox_value(AT_FAIR, 2, HG_BASE_HITPAUSE, 4);
		set_hitbox_value(AT_FAIR, 2, HG_HITPAUSE_SCALING, .45);
		set_hitbox_value(AT_DAIR, 2, HG_HITBOX_GROUP, -1);
		set_hitbox_value(AT_DAIR, 2, HG_VISUAL_EFFECT, 197);
		set_hitbox_value(AT_DAIR, 2, HG_VISUAL_EFFECT_X_OFFSET, 5);
		set_hitbox_value(AT_DAIR, 2, HG_VISUAL_EFFECT_Y_OFFSET, 0);
		set_hitbox_value(AT_DAIR, 2, HG_HIT_SFX, asset_get("sfx_absa_uair"));
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

// count++;
// if(count < array_length(objects))
// 	// if(0 < count && count < 16)
// 		with objects[count] {
// 			if(garbageName == "hi"){
// 				// print("made it")
// 			}
// 		}