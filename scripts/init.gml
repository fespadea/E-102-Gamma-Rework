hurtbox_spr = sprite_get("Gamma_hurt");
crouchbox_spr = sprite_get("crouch_hurtbox");
air_hurtbox_spr = sprite_get("air_hurtbox");
hitstun_hurtbox_spr = -1;

char_height = 70;
idle_anim_speed = .09;
crouch_anim_speed = .015;
walk_anim_speed = .125;
dash_anim_speed = .2;
jump_anim_speed = .25;
doublejump_anim_speed = .25;
pratfall_anim_speed = .25;

walk_speed = 2.75;
walk_accel = 0.15;
walk_turn_time = 16;
initial_dash_time = 8;
initial_dash_speed = 7.5;
dash_speed = 8.2;
dash_turn_time = 6;
dash_turn_accel = 1.25;
dash_stop_time = 4;
dash_stop_percent = .35; //the value to multiply your hsp by when going into idle from dash or dashstop
ground_friction = .95;
moonwalk_accel = 1.6;

jump_start_time = 6;
jump_speed = 11;
short_hop_speed = 7;
djump_speed = 10;
leave_ground_max = 7; //the maximum hsp you can have when you go from grounded to aerial without jumping
max_jump_hsp = 6; //the maximum hsp you can have when jumping from the ground
air_max_speed = 6; //the maximum hsp you can accelerate to when in a normal aerial state
jump_change = 3; //maximum hsp when double jumping. If already going faster, it will not slow you down
air_accel = .165;
prat_fall_accel = 1; //multiplier of air_accel while in pratfall
air_friction = .07;
max_djumps = 1;
double_jump_time = 32; //the number of frames to play the djump animation. Can't be less than 31.
walljump_hsp = 7;
walljump_vsp = 11;
walljump_time = 32;
max_fall = 11; //maximum fall speed without fastfalling
fast_fall = 16; //fast fall speed
gravity_speed = .55;
hitstun_grav = .5;
knockback_adj = 1.07; //the multiplier to KB dealt to you. 1 = default, >1 = lighter, <1 = heavier

//>

land_time = 5; //normal landing frames
prat_land_time = 5;
wave_land_time = 7;
wave_land_adj = 1.2; //the multiplier to your initial hsp when wavelanding. Usually greater than 1
wave_friction = .06; //grounded deceleration when wavelanding

//crouch animation frames
crouch_startup_frames = 3;
crouch_active_frames = 1;
crouch_recovery_frames = 3;

//parry animation frames
dodge_startup_frames = 4;
dodge_active_frames = 3;
dodge_recovery_frames = 4;

//tech animation frames
tech_active_frames = 2;
tech_recovery_frames = 2;

//tech roll animation frames
techroll_startup_frames = 2
techroll_active_frames = 2;
techroll_recovery_frames = 2;
techroll_speed = 8;

//airdodge animation frames
air_dodge_startup_frames = 1;
air_dodge_active_frames = 1;
air_dodge_recovery_frames = 2;
air_dodge_speed = 6.5;

//roll animation frames
roll_forward_startup_frames = 2;
roll_forward_active_frames = 4;
roll_forward_recovery_frames = 2;
roll_back_startup_frames = 2;
roll_back_active_frames = 4;
roll_back_recovery_frames = 2;
roll_forward_max = 7.5; //roll speed
roll_backward_max = 7.5;

land_sound = sound_get("Gamma_Land");
landing_lag_sound = sound_get("Gamma_Land");
waveland_sound = asset_get("sfx_waveland_zet");
djump_sound = sound_get("sfx_e102jump");
air_dodge_sound = asset_get("sfx_quick_dodge");

//visual offsets for when you're in Ranno's bubble
bubble_x = 0;
bubble_y = 8;

//Projectile variables

//mines
mine_charge = 0;
drawMines = false;
numMines = 0;
activeMines = false;

//targeting
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
markedPlayers[3] = 0; //this spot is never filled since only 3 other players can be in a game
markedPlayers[2] = 0;
markedPlayers[1] = 0;
markedPlayers[0] = 0;
rocketsShot = 0;
activeRockets = false;

//birds
noSwallow = true;
noParrot = true;
noPeacock = true;
noFlicky = true;

//Stage Data
LEFT_MAIN_STAGE_X_POS = get_stage_data(SD_X_POS);
RIGHT_MAIN_STAGE_X_POS = get_stage_data(SD_WIDTH) + LEFT_MAIN_STAGE_X_POS;
TOP_MAIN_STAGE_Y_POS = get_stage_data(SD_Y_POS);
BOTTOM_BLASTZONE_Y_POS = TOP_MAIN_STAGE_Y_POS + get_stage_data(SD_BOTTOM_BLASTZONE);
TOP_BLASTZONE_Y_POS = TOP_MAIN_STAGE_Y_POS - get_stage_data(SD_TOP_BLASTZONE);
LEFT_BLASTZONE_X_POS = LEFT_MAIN_STAGE_X_POS - get_stage_data(SD_SIDE_BLASTZONE);
RIGHT_BLASTZONE_X_POS = RIGHT_MAIN_STAGE_X_POS + get_stage_data(SD_SIDE_BLASTZONE);

//Float Mechanic Variables
floatActive = false;
floatable = false;
aerialFSpecialActive = false;
goingUp = false;

//SFX
playingJabSFX = false;
playingDairSFX = false;
playingFSpecialSFX = false;

//VFX
rocketHitVFX = hit_fx_create(sprite_get("fspecial_proj_hit"), 14);
rocketMarked = sprite_get("fspecial_marked");

// Support stuff

// Kirby Support
kirbyability = 16;
swallowed = 0;

// TCO Support
tcoart = sprite_get("tcoartGamma");

// Feri Support
feri_costume = sprite_get("feri_costume_gamma");

// Trummel and Alto Support
trummelcodecneeded = false;
trummelcodec_id = noone;

// Otto Bobblehead Support
otto_bobblehead_sprite = sprite_get("hudbobbleheadgamma");