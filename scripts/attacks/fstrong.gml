set_attack_value(AT_FSTRONG, AG_SPRITE, sprite_get("fstrong"));
set_attack_value(AT_FSTRONG, AG_NUM_WINDOWS, 4);
set_attack_value(AT_FSTRONG, AG_STRONG_CHARGE_WINDOW, 1);
set_attack_value(AT_FSTRONG, AG_HURTBOX_SPRITE, sprite_get("fstrong_hurt"));

set_window_value(AT_FSTRONG, 1, AG_WINDOW_LENGTH, 14);
set_window_value(AT_FSTRONG, 1, AG_WINDOW_ANIM_FRAMES, 7);

set_window_value(AT_FSTRONG, 2, AG_WINDOW_LENGTH, 10);
set_window_value(AT_FSTRONG, 2, AG_WINDOW_ANIM_FRAMES, 5);
set_window_value(AT_FSTRONG, 2, AG_WINDOW_ANIM_FRAME_START, 7);
// set_window_value(AT_FSTRONG, 2, AG_WINDOW_HAS_SFX, 1);
// set_window_value(AT_FSTRONG, 2, AG_WINDOW_SFX, sound_get("GammaElectricity"));
set_window_value(AT_FSTRONG, 2, AG_WINDOW_HAS_WHIFFLAG, 10);

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
// set_hitbox_value(AT_FSTRONG, 3, HG_PROJECTILE_HSPEED, 6); // Set in attack_update.gml
set_hitbox_value(AT_FSTRONG, 3, HG_PROJECTILE_VSPEED, 0);
set_hitbox_value(AT_FSTRONG, 3, HG_HIT_SFX, asset_get("sfx_clairen_hit_med"));