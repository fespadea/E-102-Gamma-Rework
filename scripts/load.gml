sprite_change_offset("idle", 128, 160); //104,129 //24,31
sprite_change_offset("hurt", 128, 160);
sprite_change_offset("hurtground", 128, 160);
sprite_change_offset("uphurt", 128, 160);
sprite_change_offset("downhurt", 128, 158);
sprite_change_offset("bouncehurt", 40, 84);
sprite_change_offset("bighurt", 42, 74);
sprite_change_offset("crouch", 135, 170);
sprite_change_offset("walk", 132, 169);
sprite_change_offset("walkloop", 132, 169);
sprite_change_offset("walkturn", 124, 166);
sprite_change_offset("dash", 132, 146);
sprite_change_offset("dashstart", 132, 155);
sprite_change_offset("dashstop", 132, 151);
sprite_change_offset("dashturn", 132, 151);
sprite_change_offset("Gamma_hurt", 128, 160);
sprite_change_offset("crouch_hurtbox", 135, 170);
sprite_change_offset("air_hurtbox", 128, 158);

sprite_change_offset("jumpstart", 135, 170);
sprite_change_offset("jump", 128, 158);
sprite_change_offset("doublejump", 128, 158);
sprite_change_offset("fall", 123, 145);
sprite_change_offset("float", 123, 145);
sprite_change_offset("walljump", 128, 145);
sprite_change_offset("pratfall", 128, 160);
sprite_change_offset("land", 132, 170);
sprite_change_offset("landinglag", 128, 167);

sprite_change_offset("parry", 118, 150);
sprite_change_offset("roll_forward", 132, 146);
sprite_change_offset("roll_backward", 132, 146);
sprite_change_offset("airdodge", 123, 145);
sprite_change_offset("waveland", 132, 170);
sprite_change_offset("tech", 128, 158);

sprite_change_offset("jab", 128, 160);
sprite_change_offset("dattack", 132, 146);
sprite_change_offset("ftilt", 118, 112);
sprite_change_offset("dtilt", 31, 78);
sprite_change_offset("utilt", 46, 144);
sprite_change_offset("nair", 128, 158);
sprite_change_offset("fair", 128, 158);
sprite_change_offset("bair", 178, 158);
sprite_change_offset("uair", 122, 144);
sprite_change_offset("dair", 128, 158);
sprite_change_offset("dair_old", 128, 158);
sprite_change_offset("fstrong", 93, 151);
sprite_change_offset("fstrong_old", 72, 171);
sprite_change_offset("ustrong", 128, 160);
sprite_change_offset("ustrong_old", 210, 130);
sprite_change_offset("nspecial", 126, 160);
sprite_change_offset("nspecial_air", 134, 152);
sprite_change_offset("dstrong", 114, 153);
sprite_change_offset("dstrong_old", 120, 148);
sprite_change_offset("dspecial", 112, 148);
sprite_change_offset("fspecial", 119, 161);
sprite_change_offset("fspecial_backward", 119, 161);
sprite_change_offset("fspecial_air", 134, 152);
sprite_change_offset("fspecial_air_float_hurt", 134, 152);
sprite_change_offset("fspecial_air_backward", 134, 152);
sprite_change_offset("fspecial_air_float_backward_hurt", 134, 152);
sprite_change_offset("jetpack", 134, 152);
sprite_change_offset("uspecial", 128, 158);
sprite_change_offset("taunt", 118, 170);

sprite_change_offset("plat", 85, 5);

set_victory_theme( sound_get( "missionComplete" ));

//projectiles
sprite_change_offset("dspecial_proj", 7, 29);
sprite_change_offset("dspecial_proj_ground", 7, 29);
sprite_change_offset("plasma_proj", 49, 47);
sprite_change_offset("fspecial_targeting", 4, 9);
sprite_change_offset("fspecial_laser", 0, 0);
sprite_change_offset("fspecial_proj", 30, 28);
sprite_change_offset("fspecial_proj_follower", 21, 15);
sprite_change_offset("fspecial_proj_hit", 49, 47);
sprite_change_offset("nspecial_flicky", 24, 22);
sprite_change_offset("nspecial_flicky_icon", 9, 9);
sprite_change_offset("nspecial_parrot", 26, 28);
sprite_change_offset("nspecial_parrot_icon", 9, 9);
sprite_change_offset("nspecial_peacock", 22, 44);
sprite_change_offset("nspecial_peacock_icon", 9, 9);
sprite_change_offset("nspecial_swallow", 20, 22);
sprite_change_offset("nspecial_swallow_icon", 9, 9);

//marked sprites
sprite_change_offset("fspecial_marked", 40, 31);

//HUD
sprite_change_offset("dspecial_logo", 1, 46);
sprite_change_offset("dspecial_bars", 1, 46);
sprite_change_offset("dspecial_cooldown", 0, 0);
sprite_change_offset("dspecial_charge", 0, 0);

// vfx
sprite_change_offset("nspecial_reverse_wind_effect", sprite_get_width(sprite_get("nspecial_reverse_wind_effect"))/2, sprite_get_height(sprite_get("nspecial_reverse_wind_effect"))/2);
sprite_change_offset("ustrong_explosion", floor(sprite_get_width(sprite_get("ustrong_explosion"))/2), floor(sprite_get_height(sprite_get("ustrong_explosion"))/2));

// Kirby
sprite_change_offset("Gamma_nspecial_kirby_icon", 0, 6);

// Feri
sprite_change_offset("feri_costume_gamma", 84, 114);