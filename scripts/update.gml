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


if attack != AT_USPECIAL || state != PS_ATTACK_AIR {
	sound_stop(gammaFanSound);
}

if (playingJabSFX && !(attack == AT_JAB && window == get_attack_value( AT_JAB, AG_NUM_WINDOWS)-1)){
	sound_stop(gammaElectricity2Sound);
	playingJabSFX = false;
}

if (!(state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR) || (!(attack == AT_UAIR && window == get_attack_value( AT_UAIR, AG_NUM_WINDOWS)-1) && !(attack == AT_USTRONG && window == get_attack_value( AT_USTRONG, AG_NUM_WINDOWS)-1) && attack != AT_FSTRONG && (attack != AT_DAIR && window == get_attack_value( AT_DAIR, AG_NUM_WINDOWS)-1))){
	sound_stop(gammaElectricitySound);
	playingDairSFX = false;
}

if (playingFSpecialSFX && !((state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR) && attack = AT_FSPECIAL && window == 2)){
	sound_stop(targeting2Sound);
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

//Open up mark slot if rocket no longer active
if(activeRockets){ // This is undone in hitbox_update.gml if there is still an active rocket (using fact that update.gml runs first)
	move_cooldown[AT_FSPECIAL] = 140;
	for(var i = 0; i < array_length(markedPlayers); i++){
		if(instance_exists(markedPlayers[i])){
			markedPlayers[i].gammaRocketMarked[player] = false;
		}
	}
	markedPlayers = [];
	activeRockets = false;
} else {
	move_cooldown[AT_FSPECIAL] = 0;
}

// activate random alt on hit
// The amount of frames into the match during which you can activate "random alt on hit" if you keep that feature. You can change this amount if you want. I believe the countdown is actually 122 frames, but allowing changes that late makes it possible to accidentally change alt while trying to do something early in the match. [Edit optional]
#macro CHANGE_ALT_FRAME_LIMIT 100
if (get_gameplay_time() < CHANGE_ALT_FRAME_LIMIT){ // you are still in the countdown
    // [Random alt on hit feature]
    // If you don't want this feature, get rid of this if statement. [Edit optional]
    if(taunt_down & special_down && jump_down){ // if taunt pressed
        randomAltOnHit = true; // activate "random alt on hit"
    }
}

// You don't need this if you don't have a rainbow alt [Edit optional]
// rainbow alt
#macro RAINBOW_ALT 38
if(unlimitedAlt == RAINBOW_ALT){ // check that you've selected the rainbow alt [Edit necessary]
    init_shader(); // run init_shader to update the hue
}

//kirby support
if swallowed {
	swallowed = 0;
	var ability_spr = gammaNspecialSprite;
	var ability_proj_spr = dspecialProjSprite;
	var ability_hurt = gammaNspecialHurtSprite;
	var ability_icon = gammaNspecialKirbyIcon;
    with enemykirby {
	// NSPECIAL
	set_attack_value(AT_EXTRA_3, AG_CATEGORY, 2);
	set_attack_value(AT_EXTRA_3, AG_SPRITE, ability_spr);
	set_attack_value(AT_EXTRA_3, AG_NUM_WINDOWS, 3);
	set_attack_value(AT_EXTRA_3, AG_AIR_SPRITE, ability_spr);
	set_attack_value(AT_EXTRA_3, AG_HURTBOX_SPRITE, ability_hurt);

	set_window_value(AT_EXTRA_3, 1, AG_WINDOW_TYPE, 0);
	set_window_value(AT_EXTRA_3, 1, AG_WINDOW_LENGTH, 9);
	set_window_value(AT_EXTRA_3, 1, AG_WINDOW_ANIM_FRAMES, 7);

	set_window_value(AT_EXTRA_3, 2, AG_WINDOW_TYPE, 0);
	set_window_value(AT_EXTRA_3, 2, AG_WINDOW_LENGTH, 20);
	set_window_value(AT_EXTRA_3, 2, AG_WINDOW_ANIM_FRAMES, 3);
	set_window_value(AT_EXTRA_3, 2, AG_WINDOW_HAS_SFX, 1);
	set_window_value(AT_EXTRA_3, 2, AG_WINDOW_SFX, asset_get("sfx_plant_shoot"));
	set_window_value(AT_EXTRA_3, 2, AG_WINDOW_SFX_FRAME, 1);
	set_window_value(AT_EXTRA_3, 2, AG_WINDOW_ANIM_FRAME_START, 6);

	set_window_value(AT_EXTRA_3, 3, AG_WINDOW_TYPE, 0);
	set_window_value(AT_EXTRA_3, 3, AG_WINDOW_LENGTH, 9);
	set_window_value(AT_EXTRA_3, 3, AG_WINDOW_ANIM_FRAMES, 2);
	set_window_value(AT_EXTRA_3, 3, AG_WINDOW_ANIM_FRAME_START, 9);

	set_num_hitboxes(AT_EXTRA_3,1);

	set_hitbox_value(AT_EXTRA_3, 1, HG_HITBOX_TYPE, 2);
	set_hitbox_value(AT_EXTRA_3, 1, HG_WINDOW, 2);
	set_hitbox_value(AT_EXTRA_3, 1, HG_WINDOW_CREATION_FRAME, 6);
	set_hitbox_value(AT_EXTRA_3, 1, HG_LIFETIME, 100);
	set_hitbox_value(AT_EXTRA_3, 1, HG_HITBOX_X, -20);
	set_hitbox_value(AT_EXTRA_3, 1, HG_HITBOX_Y, -50);
	set_hitbox_value(AT_EXTRA_3, 1, HG_WIDTH, 90);
	set_hitbox_value(AT_EXTRA_3, 1, HG_HEIGHT, 60);
	set_hitbox_value(AT_EXTRA_3, 1, HG_PRIORITY, 3);
	set_hitbox_value(AT_EXTRA_3, 1, HG_DAMAGE, 2);
	set_hitbox_value(AT_EXTRA_3, 1, HG_ANGLE, 50);
	set_hitbox_value(AT_EXTRA_3, 1, HG_BASE_KNOCKBACK, 3);
	set_hitbox_value(AT_EXTRA_3, 1, HG_KNOCKBACK_SCALING, .65);
	set_hitbox_value(AT_EXTRA_3, 1, HG_BASE_HITPAUSE, 4);
	set_hitbox_value(AT_EXTRA_3, 1, HG_HITPAUSE_SCALING, 1.25);
	set_hitbox_value(AT_EXTRA_3, 1, HG_VISUAL_EFFECT_Y_OFFSET, -16);
	set_hitbox_value(AT_EXTRA_3, 1, HG_PROJECTILE_SPRITE, ability_proj_spr);
	set_hitbox_value(AT_EXTRA_3, 1, HG_PROJECTILE_MASK, ability_proj_spr);
	set_hitbox_value(AT_EXTRA_3, 1, HG_PROJECTILE_ANIM_SPEED, 0.2);
	set_hitbox_value(AT_EXTRA_3, 1, HG_PROJECTILE_HSPEED, 4);
	set_hitbox_value(AT_EXTRA_3, 1, HG_PROJECTILE_VSPEED, -6);
	set_hitbox_value(AT_EXTRA_3, 1, HG_PROJECTILE_GRAVITY, 0.5);
	set_hitbox_value(AT_EXTRA_3, 1, HG_PROJECTILE_GROUND_BEHAVIOR, 0);
	set_hitbox_value(AT_EXTRA_3, 1, HG_PROJECTILE_GROUND_FRICTION, 100);
	set_hitbox_value(AT_EXTRA_3, 1, HG_HIT_SFX, asset_get("sfx_abyss_explosion"));
	set_hitbox_value(AT_EXTRA_3, 1, HG_VISUAL_EFFECT, 13);
	set_hitbox_value(AT_EXTRA_3, 1, HG_VISUAL_EFFECT_X_OFFSET, 10);
	set_hitbox_value(AT_EXTRA_3, 1, HG_VISUAL_EFFECT, 139);

	newicon = ability_icon;
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