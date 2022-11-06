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
walljump_vsp = 8;
walljump_time = 32;
max_fall = 10; //maximum fall speed without fastfalling
fast_fall = 14; //fast fall speed
gravity_speed = .5;
hitstun_grav = .5;
knockback_adj = 1.07; //the multiplier to KB dealt to you. 1 = default, >1 = lighter, <1 = heavier

//>

land_time = 5; //normal landing frames
prat_land_time = 15;
wave_land_time = 7;
wave_land_adj = 1.2; //the multiplier to your initial hsp when wavelanding. Usually greater than 1
wave_friction = .12; //grounded deceleration when wavelanding

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
markedPlayers = [];
rocketsShot = 0;
activeRockets = false;
targetConfirmedSound = sound_get("TargetConfirmed");

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
rocketFollowerVFX = hit_fx_create(sprite_get("fspecial_proj_follower"), 18);

//Various sprites (I made these all at once when I realized I shouldn't be calling sprite_get in repeating scripts)
floatSprite = sprite_get("float");
fallSprite = sprite_get("fall");
walkLoopSprite = sprite_get("walkloop");
upHurtSprite = sprite_get("uphurt");
bounceHurtSprite = sprite_get("bouncehurt");
fspecialAirFloatHurtSprite = sprite_get("fspecial_air_float_hurt");
dspecialBarsSprite = sprite_get("dspecial_bars");
dspecialCooldownSprite = sprite_get("dspecial_cooldown");
dspecialChargeSprite = sprite_get("dspecial_charge");
dspecialLogoSprite = sprite_get("dspecial_logo");
dspecialProjGround = sprite_get("dspecial_proj_ground");
fspecialTargetingSprite = sprite_get("fspecial_targeting");
fspecialLaser = sprite_get("fspecial_laser");
fspecialLaserOld = sprite_get("fspecial_laser_old");
nspecialPeacockIconSprite = sprite_get("nspecial_peacock_icon");
nspecialSwallowIconSprite = sprite_get("nspecial_swallow_icon");
nspecialParrotIconSprite = sprite_get("nspecial_parrot_icon");
nspecialFlickyIconSprite = sprite_get("nspecial_flicky_icon");
jetpackSprite = sprite_get("jetpack");
gammaNspecialSprite = sprite_get("gamma_nspecial");
gammaNspecialHurtSprite = sprite_get("gamma_nspecial_hurt");
gammaNspecialKirbyIcon = sprite_get("Gamma_nspecial_kirby_icon");
idleSprite = sprite_get("idle");
nspecialFlickySprite = sprite_get("nspecial_flicky");

//Various sounds (I made these all at once when I realized I shouldn't be calling sound_get in repeating scripts)
gammaElectricity2Sound = sound_get("GammaElectricity2");
gammaElectricitySound = sound_get("GammaElectricity");
targeting2Sound = sound_get("targeting2");
birdZetaSound = sound_get("BirdZeta");
birdEpsilonSound = sound_get("BirdEpsilon");
birdDeltaSound = sound_get("BirdDelta");
birdBetaSound = sound_get("BirdBeta");

// Alt stuff

/*
These are the variables to decide which bits of the synced variable you want to dedicate
to allowing more alts (from bit 0 to 31). These should match what you put in css_init.gml.
[Edit necessary]
*/
FIRST_BIT_UNLIMITED = 0;
LAST_BIT_UNLIMITED = 31;

// the currently selected unlimited alt
unlimitedAlt = split_synced_var(FIRST_BIT_UNLIMITED, LAST_BIT_UNLIMITED-FIRST_BIT_UNLIMITED+1, 31-LAST_BIT_UNLIMITED)[1];

// [Random alt on hit feature]
randomAltOnHit = false; // holds whether this feature has been activated

// Variable to hold the number of alts [Edit necessary]
NUM_UNLIMITED_ALTS = 40;

// [Random Alt]
// Check if the random alt is selected
randomSelected = false;
if(unlimitedAlt == NUM_UNLIMITED_ALTS-1){ // This means the next alt isn't set which means this is the last alt
    updateUnlimitedAlt(random_func(0, unlimitedAlt, true), false);
    randomSelected = true;
}

// taunt sfx
normalTauntSfx = sound_get("haha");
EggBreakerTauntSfx = sound_get("MoreTheMerrier");

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

// Hikaru Support
Hikaru_Title = "E-Series";



#define updateUnlimitedAlt
unlimitedAlt = argument[0];
var syncedVar = get_synced_var(player);
var newSyncedVar = 0;
newSyncedVar += syncedVar >> (LAST_BIT_UNLIMITED+1) << (LAST_BIT_UNLIMITED+1);
newSyncedVar += (unlimitedAlt & ((1 << (LAST_BIT_UNLIMITED-FIRST_BIT_UNLIMITED+1))-1)) << FIRST_BIT_UNLIMITED;
newSyncedVar += syncedVar & ((1 << (FIRST_BIT_UNLIMITED))-1);
set_synced_var(player, newSyncedVar);

#define split_synced_var
///args chunk_lengths...
var num_chunks = argument_count;
var chunk_arr = array_create(argument_count);
var synced_var = get_synced_var(player);
var chunk_offset = 0
for (var i = 0; i < num_chunks; i++) {
    var chunk_len = argument[i]; //print(chunk_len);
    var chunk_mask = (1 << chunk_len)-1
    chunk_arr[i] = (synced_var >> chunk_offset) & chunk_mask;
    //print(`matching shift = ${chunk_len}`);
    chunk_offset += chunk_len;
}
// print(chunk_arr);
return chunk_arr;