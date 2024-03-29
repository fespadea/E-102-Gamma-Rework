set_attack_value(AT_DSTRONG, AG_CATEGORY, 0);
set_attack_value(AT_DSTRONG, AG_SPRITE, sprite_get("dstrong"));
set_attack_value(AT_DSTRONG, AG_NUM_WINDOWS, 10);
set_attack_value(AT_DSTRONG, AG_STRONG_CHARGE_WINDOW, 1);
set_attack_value(AT_DSTRONG, AG_HURTBOX_SPRITE, sprite_get("dstrong_hurt"));

set_window_value(AT_DSTRONG, 1, AG_WINDOW_LENGTH, 18);
set_window_value(AT_DSTRONG, 1, AG_WINDOW_ANIM_FRAMES, 6);
set_window_value(AT_DSTRONG, 1, AG_WINDOW_ANIM_FRAME_START, 0);

set_window_value(AT_DSTRONG, 2, AG_WINDOW_LENGTH, 3);
set_window_value(AT_DSTRONG, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_DSTRONG, 2, AG_WINDOW_ANIM_FRAME_START, 5);

set_window_value(AT_DSTRONG, 3, AG_WINDOW_LENGTH, 1);
set_window_value(AT_DSTRONG, 3, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_DSTRONG, 3, AG_WINDOW_ANIM_FRAME_START, 6);
// set_window_value(AT_DSTRONG, 3, AG_WINDOW_HAS_SFX, 1);
// set_window_value(AT_DSTRONG, 3, AG_WINDOW_SFX, sound_get("GammaElectricity"));
// set_window_value(AT_DSTRONG, 3, AG_WINDOW_SFX_FRAME, 0);

set_window_value(AT_DSTRONG, 4, AG_WINDOW_LENGTH, 2);
set_window_value(AT_DSTRONG, 4, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_DSTRONG, 4, AG_WINDOW_ANIM_FRAME_START, 7);

set_window_value(AT_DSTRONG, 5, AG_WINDOW_LENGTH, 2);
set_window_value(AT_DSTRONG, 5, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_DSTRONG, 5, AG_WINDOW_ANIM_FRAME_START, 9);

set_window_value(AT_DSTRONG, 6, AG_WINDOW_LENGTH, 1);
set_window_value(AT_DSTRONG, 6, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_DSTRONG, 6, AG_WINDOW_ANIM_FRAME_START, 11);

set_window_value(AT_DSTRONG, 7, AG_WINDOW_LENGTH, 2);
set_window_value(AT_DSTRONG, 7, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_DSTRONG, 7, AG_WINDOW_ANIM_FRAME_START, 12);

set_window_value(AT_DSTRONG, 8, AG_WINDOW_LENGTH, 2);
set_window_value(AT_DSTRONG, 8, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_DSTRONG, 8, AG_WINDOW_ANIM_FRAME_START, 14);

set_window_value(AT_DSTRONG, 9, AG_WINDOW_LENGTH, 4);
set_window_value(AT_DSTRONG, 9, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_DSTRONG, 9, AG_WINDOW_ANIM_FRAME_START, 16);

set_window_value(AT_DSTRONG, 10, AG_WINDOW_LENGTH, 27);
set_window_value(AT_DSTRONG, 10, AG_WINDOW_ANIM_FRAMES, 9);
set_window_value(AT_DSTRONG, 10, AG_WINDOW_ANIM_FRAME_START, 20);
set_window_value(AT_DSTRONG, 10, AG_WINDOW_HAS_WHIFFLAG, true);


set_num_hitboxes(AT_DSTRONG,7);

set_hitbox_value(AT_DSTRONG, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DSTRONG, 1, HG_WINDOW, 3);
set_hitbox_value(AT_DSTRONG, 1, HG_LIFETIME, 1);
set_hitbox_value(AT_DSTRONG, 1, HG_HITBOX_X, 27);
set_hitbox_value(AT_DSTRONG, 1, HG_HITBOX_Y, -42);
set_hitbox_value(AT_DSTRONG, 1, HG_WIDTH, 76);
set_hitbox_value(AT_DSTRONG, 1, HG_HEIGHT, 50);
set_hitbox_value(AT_DSTRONG, 1, HG_PRIORITY, 2);
set_hitbox_value(AT_DSTRONG, 1, HG_DAMAGE, 1);
set_hitbox_value(AT_DSTRONG, 1, HG_ANGLE, 180);
set_hitbox_value(AT_DSTRONG, 1, HG_ANGLE_FLIPPER, 7);
set_hitbox_value(AT_DSTRONG, 1, HG_BASE_KNOCKBACK, 10);
set_hitbox_value(AT_DSTRONG, 1, HG_BASE_HITPAUSE, 3);
set_hitbox_value(AT_DSTRONG, 1, HG_HITBOX_GROUP, 1);
set_hitbox_value(AT_DSTRONG, 1, HG_VISUAL_EFFECT, 20);
set_hitbox_value(AT_DSTRONG, 1, HG_HIT_SFX, asset_get("sfx_absa_singlezap1"));

set_hitbox_value(AT_DSTRONG, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DSTRONG, 2, HG_WINDOW, 4);
set_hitbox_value(AT_DSTRONG, 2, HG_LIFETIME, 2);
set_hitbox_value(AT_DSTRONG, 2, HG_HITBOX_X, 5);
set_hitbox_value(AT_DSTRONG, 2, HG_HITBOX_Y, -41);
set_hitbox_value(AT_DSTRONG, 2, HG_WIDTH, 93);
set_hitbox_value(AT_DSTRONG, 2, HG_HEIGHT, 55);
set_hitbox_value(AT_DSTRONG, 2, HG_PRIORITY, 2);
set_hitbox_value(AT_DSTRONG, 2, HG_DAMAGE, 1);
set_hitbox_value(AT_DSTRONG, 2, HG_ANGLE, 180);
set_hitbox_value(AT_DSTRONG, 2, HG_ANGLE_FLIPPER, 7);
set_hitbox_value(AT_DSTRONG, 2, HG_BASE_KNOCKBACK, 10);
set_hitbox_value(AT_DSTRONG, 2, HG_BASE_HITPAUSE, 3);
set_hitbox_value(AT_DSTRONG, 2, HG_HITPAUSE_SCALING, 0.45);
set_hitbox_value(AT_DSTRONG, 2, HG_HITBOX_GROUP, 2);
set_hitbox_value(AT_DSTRONG, 2, HG_VISUAL_EFFECT, 20);
set_hitbox_value(AT_DSTRONG, 2, HG_HIT_SFX, asset_get("sfx_absa_singlezap1"));

set_hitbox_value(AT_DSTRONG, 3, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DSTRONG, 3, HG_WINDOW, 5);
set_hitbox_value(AT_DSTRONG, 3, HG_LIFETIME, 2);
set_hitbox_value(AT_DSTRONG, 3, HG_HITBOX_X, -23);
set_hitbox_value(AT_DSTRONG, 3, HG_HITBOX_Y, -42);
set_hitbox_value(AT_DSTRONG, 3, HG_WIDTH, 76);
set_hitbox_value(AT_DSTRONG, 3, HG_HEIGHT, 50);
set_hitbox_value(AT_DSTRONG, 3, HG_PRIORITY, 2);
set_hitbox_value(AT_DSTRONG, 3, HG_DAMAGE, 1);
set_hitbox_value(AT_DSTRONG, 3, HG_ANGLE, 90);
set_hitbox_value(AT_DSTRONG, 3, HG_ANGLE_FLIPPER, 7);
set_hitbox_value(AT_DSTRONG, 3, HG_BASE_KNOCKBACK, 5);
set_hitbox_value(AT_DSTRONG, 3, HG_BASE_HITPAUSE, 3);
set_hitbox_value(AT_DSTRONG, 3, HG_HITPAUSE_SCALING, 0.45);
set_hitbox_value(AT_DSTRONG, 3, HG_HITBOX_GROUP, 3);
set_hitbox_value(AT_DSTRONG, 3, HG_VISUAL_EFFECT, 20);
set_hitbox_value(AT_DSTRONG, 3, HG_HIT_SFX, asset_get("sfx_absa_singlezap1"));

set_hitbox_value(AT_DSTRONG, 4, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DSTRONG, 4, HG_WINDOW, 6);
set_hitbox_value(AT_DSTRONG, 4, HG_LIFETIME, 1);
set_hitbox_value(AT_DSTRONG, 4, HG_HITBOX_X, -22);
set_hitbox_value(AT_DSTRONG, 4, HG_HITBOX_Y, -47);
set_hitbox_value(AT_DSTRONG, 4, HG_WIDTH, 76);
set_hitbox_value(AT_DSTRONG, 4, HG_HEIGHT, 50);
set_hitbox_value(AT_DSTRONG, 4, HG_PRIORITY, 2);
set_hitbox_value(AT_DSTRONG, 4, HG_DAMAGE, 1);
set_hitbox_value(AT_DSTRONG, 4, HG_ANGLE, 0);
set_hitbox_value(AT_DSTRONG, 4, HG_ANGLE_FLIPPER, 7);
set_hitbox_value(AT_DSTRONG, 4, HG_BASE_KNOCKBACK, 10);
set_hitbox_value(AT_DSTRONG, 4, HG_BASE_HITPAUSE, 3);
set_hitbox_value(AT_DSTRONG, 4, HG_HITPAUSE_SCALING, 0.45);
set_hitbox_value(AT_DSTRONG, 4, HG_HITBOX_GROUP, 4);
set_hitbox_value(AT_DSTRONG, 4, HG_VISUAL_EFFECT, 20);
set_hitbox_value(AT_DSTRONG, 4, HG_HIT_SFX, asset_get("sfx_absa_singlezap1"));

set_hitbox_value(AT_DSTRONG, 5, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DSTRONG, 5, HG_WINDOW, 7);
set_hitbox_value(AT_DSTRONG, 5, HG_LIFETIME, 2);
set_hitbox_value(AT_DSTRONG, 5, HG_HITBOX_X, 28);
set_hitbox_value(AT_DSTRONG, 5, HG_HITBOX_Y, -47);
set_hitbox_value(AT_DSTRONG, 5, HG_WIDTH, 76);
set_hitbox_value(AT_DSTRONG, 5, HG_HEIGHT, 50);
set_hitbox_value(AT_DSTRONG, 5, HG_PRIORITY, 2);
set_hitbox_value(AT_DSTRONG, 5, HG_DAMAGE, 1);
set_hitbox_value(AT_DSTRONG, 5, HG_ANGLE, 90);
set_hitbox_value(AT_DSTRONG, 5, HG_ANGLE_FLIPPER, 7);
set_hitbox_value(AT_DSTRONG, 5, HG_BASE_KNOCKBACK, 5);
set_hitbox_value(AT_DSTRONG, 5, HG_BASE_HITPAUSE, 3);
set_hitbox_value(AT_DSTRONG, 5, HG_HITPAUSE_SCALING, 0.45);
set_hitbox_value(AT_DSTRONG, 5, HG_HITBOX_GROUP, 5);
set_hitbox_value(AT_DSTRONG, 5, HG_VISUAL_EFFECT, 20);
set_hitbox_value(AT_DSTRONG, 5, HG_HIT_SFX, asset_get("sfx_absa_singlezap1"));

set_hitbox_value(AT_DSTRONG, 6, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DSTRONG, 6, HG_WINDOW, 8);
set_hitbox_value(AT_DSTRONG, 6, HG_LIFETIME, 2);
set_hitbox_value(AT_DSTRONG, 6, HG_HITBOX_X, 27);
set_hitbox_value(AT_DSTRONG, 6, HG_HITBOX_Y, -42);
set_hitbox_value(AT_DSTRONG, 6, HG_WIDTH, 76);
set_hitbox_value(AT_DSTRONG, 6, HG_HEIGHT, 50);
set_hitbox_value(AT_DSTRONG, 6, HG_PRIORITY, 2);
set_hitbox_value(AT_DSTRONG, 6, HG_DAMAGE, 1);
set_hitbox_value(AT_DSTRONG, 6, HG_ANGLE, 180);
set_hitbox_value(AT_DSTRONG, 6, HG_ANGLE_FLIPPER, 7);
set_hitbox_value(AT_DSTRONG, 6, HG_BASE_KNOCKBACK, 10);
set_hitbox_value(AT_DSTRONG, 6, HG_BASE_HITPAUSE, 3);
set_hitbox_value(AT_DSTRONG, 6, HG_HITPAUSE_SCALING, 0.45);
set_hitbox_value(AT_DSTRONG, 6, HG_HITBOX_GROUP, 6);
set_hitbox_value(AT_DSTRONG, 6, HG_VISUAL_EFFECT, 20);
set_hitbox_value(AT_DSTRONG, 6, HG_HIT_SFX, asset_get("sfx_absa_singlezap1"));

set_hitbox_value(AT_DSTRONG, 7, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DSTRONG, 7, HG_WINDOW, 9);
set_hitbox_value(AT_DSTRONG, 7, HG_LIFETIME, 4);
set_hitbox_value(AT_DSTRONG, 7, HG_HITBOX_X, -23);
set_hitbox_value(AT_DSTRONG, 7, HG_HITBOX_Y, -42);
set_hitbox_value(AT_DSTRONG, 7, HG_WIDTH, 76);
set_hitbox_value(AT_DSTRONG, 7, HG_HEIGHT, 50);
set_hitbox_value(AT_DSTRONG, 7, HG_PRIORITY, 3);
set_hitbox_value(AT_DSTRONG, 7, HG_DAMAGE, 8);
set_hitbox_value(AT_DSTRONG, 7, HG_ANGLE, 90);
set_hitbox_value(AT_DSTRONG, 7, HG_BASE_KNOCKBACK, 7);
set_hitbox_value(AT_DSTRONG, 7, HG_KNOCKBACK_SCALING, 1.25);
set_hitbox_value(AT_DSTRONG, 7, HG_BASE_HITPAUSE, 6);
set_hitbox_value(AT_DSTRONG, 7, HG_HITPAUSE_SCALING, 1.25);
set_hitbox_value(AT_DSTRONG, 7, HG_HITBOX_GROUP, 7);
set_hitbox_value(AT_DSTRONG, 7, HG_VISUAL_EFFECT, 197);
set_hitbox_value(AT_DSTRONG, 7, HG_VISUAL_EFFECT_X_OFFSET, 32);
set_hitbox_value(AT_DSTRONG, 7, HG_VISUAL_EFFECT_Y_OFFSET, -10);
set_hitbox_value(AT_DSTRONG, 7, HG_HIT_SFX, asset_get("sfx_absa_uair"));
