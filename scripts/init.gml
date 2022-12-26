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

walk_speed = 3;
walk_accel = 0.2;
walk_turn_time = 6;
initial_dash_time = 8;
initial_dash_speed = 6;
dash_speed = 7;
dash_turn_time = 10;
dash_turn_accel = 0.5;
dash_stop_time = 4;
dash_stop_percent = .35; //the value to multiply your hsp by when going into idle from dash or dashstop
ground_friction = .95;
moonwalk_accel = 1.6;

jump_start_time = 5;
jump_speed = 11;
short_hop_speed = 7;
djump_speed = 10;
leave_ground_max = 7; //the maximum hsp you can have when you go from grounded to aerial without jumping
max_jump_hsp = 6; //the maximum hsp you can have when jumping from the ground
air_max_speed = 5; //the maximum hsp you can accelerate to when in a normal aerial state
jump_change = 3; //maximum hsp when double jumping. If already going faster, it will not slow you down
air_accel = .3;
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
dodge_startup_frames = 1;
dodge_active_frames = 6;
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
bubble_x = 4;
bubble_y = 0;

//Projectile variables

//mines
mine_charge = 0;
drawMines = false;
numMines = 0;
activeMines = false;

//birds
noSwallow = true;
noParrot = true;
noPeacock = true;
noFlicky = true;

//input counters
down_counter = 0;
left_counter = 0;
right_counter = 0;
up_counter = 0;

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
goingUp = false;

//SFX
playingJabSFX = false;
playingDairSFX = false;

//VFX
reverseWindEffect = hit_fx_create(sprite_get("nspecial_reverse_wind_effect"), 10);

//SFXInstanceIDs
tauntSoundInstance = -1;
gammaFanSoundInstance = -1;
gammaElectricitySoundInstance = -1;
gammaElectricity2SoundInstance = -1;

// fspecial stuff
fspecialEvent = "init";
user_event(1);

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
idleSprite = sprite_get("idle");
nspecialFlickySprite = sprite_get("nspecial_flicky");
emptySprite = asset_get("empty_sprite");

//Various sounds (I made these all at once when I realized I shouldn't be calling sound_get in repeating scripts)
gammaElectricity2Sound = sound_get("GammaElectricity2");
gammaElectricitySound = sound_get("GammaElectricity");
targeting2Sound = sound_get("targeting2");
birdZetaSound = sound_get("BirdZeta");
birdEpsilonSound = sound_get("BirdEpsilon");
birdDeltaSound = sound_get("BirdDelta");
birdBetaSound = sound_get("BirdBeta");
failedSound = sound_get("failed");
sfxBirdSidespecialStartSound = asset_get("sfx_bird_sidespecial_start");
gammaFanSound = sound_get("GammaFan");

// Clairen Field Object
plasmaFieldObj = asset_get("plasma_field_obj");

// alt stuff
unlimitedAltEvent = "init";
user_event(0);

// taunt sfx
normalTauntSfx = sound_get("haha");
EggBreakerTauntSfx = sound_get("MoreTheMerrier");


// Support stuff

// Kirby Support
kirbyability = 16;
swallowed = 0;
kirbyBetaSfx = sound_get("kirbyBeta");
gammaNspecialKirbyIcon = sprite_get("kirby_nspecial_icon");
kirbies = [];
var largestPlayerNumber = 0;
with oPlayer{
    if(player > largestPlayerNumber){
        largestPlayerNumber = player;
    }
}
for(var i = 0; i <= largestPlayerNumber; i++){
    kirbies[i] = -1;
}

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

// Rune Buddy/Base Game Runes
abyssEnabled = false;
enum runes {A = 1,B = 2,C = 3,D = 4,E = 5,F = 6,G = 7,H = 8,I = 9,J = 10,K = 11,L = 12,M = 13,N = 14,O = 15}
runesUpdated = false;
var rune_letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O"];
for (var rune_num = 0; rune_num < array_length(rune_letters); rune_num++) {
    variable_instance_set(self, "rune" + rune_letters[rune_num], has_rune(rune_letters[rune_num]));
}
// variable used to activate runesUpdated at the start of the match
runesEnabled = get_match_setting(SET_RUNES);
ab_hud_x = 0;
ab_hud_y = 0;

//abyssMods[1 to 15] = [type, description];
//types are: -1 - disabled
// 0 - object mod: Modifies a static object left behind after an attack.
// 1 - ranged mod: Modifies a projectile attack.
// 2 - hit mod: Modifies a direct physical interaction with an opponent.
// 3 - ability boost: Powers up a character attribute or action.
abyssMods = array_create(16,[-1,"Not Implemented."]);
// value 1
abyssMods[@ runes.A] = [1, "Missiles send inward instead of outward."];
abyssMods[@ runes.B] = [3, "USPECIAL goes twice as high."];
abyssMods[@ runes.C] = [2, "Old USTRONG."];
abyssMods[@ runes.D] = [2, "Old FSTRONG."];
abyssMods[@ runes.E] = [2, "Old DAIR."];
abyssMods[@ runes.F] = [3, "Auto Float on Bottom Screen Barrier."];
// value 2
abyssMods[@ runes.G] = [3, "Lock onto nonhittable articles and projectiles during FSPECIAL."];
abyssMods[@ runes.H] = [0, "Beta windbox twice as strong."];
abyssMods[@ runes.I] = [1, "Shoot twice as many missiles per target of FSPECIAL."];
abyssMods[@ runes.J] = [3, "USPECIAL has no time limit."];
abyssMods[@ runes.K] = [1, "The birds bounce off the screen borders."];
// value 3
abyssMods[@ runes.L] = [3, "No bird limits."];
abyssMods[@ runes.M] = [1, "No mine limit."];
abyssMods[@ runes.N] = [1, "Shoot thrice as many missiles per target of FSPECIAL."];
abyssMods[@ runes.O] = [1, "Aim and shoot FSPECIAL through solid blocks and platforms."];



debugEvent = "init";
user_event(2);