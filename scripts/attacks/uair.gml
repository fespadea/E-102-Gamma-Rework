set_attack_value(AT_UAIR, AG_CATEGORY, 1);
set_attack_value(AT_UAIR, AG_SPRITE, sprite_get("uair"));
set_attack_value(AT_UAIR, AG_NUM_WINDOWS, 7);
set_attack_value(AT_UAIR, AG_HAS_LANDING_LAG, 1);
set_attack_value(AT_UAIR, AG_LANDING_LAG, 8);
set_attack_value(AT_UAIR, AG_HURTBOX_SPRITE, sprite_get("uair_hurt"));

set_window_value(AT_UAIR, 1, AG_WINDOW_LENGTH, 12);
set_window_value(AT_UAIR, 1, AG_WINDOW_ANIM_FRAMES, 5);
set_window_value(AT_UAIR, 1, AG_WINDOW_ANIM_FRAME_START, 0);

set_window_value(AT_UAIR, 2, AG_WINDOW_LENGTH, 1);
set_window_value(AT_UAIR, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_UAIR, 2, AG_WINDOW_ANIM_FRAME_START, 5);
// set_window_value(AT_UAIR, 2, AG_WINDOW_HAS_SFX, 1);
// set_window_value(AT_UAIR, 2, AG_WINDOW_SFX, sound_get("GammaElectricity"));
// set_window_value(AT_UAIR, 2, AG_WINDOW_SFX_FRAME, 0);

set_window_value(AT_UAIR, 3, AG_WINDOW_LENGTH, 2);
set_window_value(AT_UAIR, 3, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_UAIR, 3, AG_WINDOW_ANIM_FRAME_START, 6);

set_window_value(AT_UAIR, 4, AG_WINDOW_LENGTH, 2);
set_window_value(AT_UAIR, 4, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_UAIR, 4, AG_WINDOW_ANIM_FRAME_START, 8);

set_window_value(AT_UAIR, 5, AG_WINDOW_LENGTH, 2);
set_window_value(AT_UAIR, 5, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_UAIR, 5, AG_WINDOW_ANIM_FRAME_START, 10);

set_window_value(AT_UAIR, 6, AG_WINDOW_LENGTH, 4);
set_window_value(AT_UAIR, 6, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_UAIR, 6, AG_WINDOW_ANIM_FRAME_START, 12);

set_window_value(AT_UAIR, 7, AG_WINDOW_LENGTH, 10);
set_window_value(AT_UAIR, 7, AG_WINDOW_ANIM_FRAMES, 6);
set_window_value(AT_UAIR, 7, AG_WINDOW_ANIM_FRAME_START, 16);
set_window_value(AT_UAIR, 7, AG_WINDOW_HAS_WHIFFLAG, true);

set_num_hitboxes(AT_UAIR,5);

set_hitbox_value(AT_UAIR, 1, HG_PARENT_HITBOX, 2);
set_hitbox_value(AT_UAIR, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_UAIR, 1, HG_WINDOW, 2);
set_hitbox_value(AT_UAIR, 1, HG_LIFETIME, 1);
set_hitbox_value(AT_UAIR, 1, HG_HITBOX_X, 41);
set_hitbox_value(AT_UAIR, 1, HG_HITBOX_Y, -21);
set_hitbox_value(AT_UAIR, 1, HG_HITBOX_GROUP, -1);


set_hitbox_value(AT_UAIR, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_UAIR, 2, HG_WINDOW, 3);
set_hitbox_value(AT_UAIR, 2, HG_LIFETIME, 2);
set_hitbox_value(AT_UAIR, 2, HG_HITBOX_X, 41);
set_hitbox_value(AT_UAIR, 2, HG_HITBOX_Y, -36);
set_hitbox_value(AT_UAIR, 2, HG_WIDTH, 77);
set_hitbox_value(AT_UAIR, 2, HG_HEIGHT, 40);
set_hitbox_value(AT_UAIR, 2, HG_PRIORITY, 2);
set_hitbox_value(AT_UAIR, 2, HG_DAMAGE, 1);
set_hitbox_value(AT_UAIR, 2, HG_ANGLE, 95);
set_hitbox_value(AT_UAIR, 2, HG_BASE_KNOCKBACK, 3);
set_hitbox_value(AT_UAIR, 2, HG_BASE_HITPAUSE, 3);
set_hitbox_value(AT_UAIR, 2, HG_HITPAUSE_SCALING, 1);
set_hitbox_value(AT_UAIR, 2, HG_VISUAL_EFFECT, 20);
set_hitbox_value(AT_UAIR, 2, HG_VISUAL_EFFECT_X_OFFSET, 5);
set_hitbox_value(AT_UAIR, 2, HG_VISUAL_EFFECT_Y_OFFSET, 0);
set_hitbox_value(AT_UAIR, 2, HG_HITBOX_GROUP, -1);
set_hitbox_value(AT_UAIR, 2, HG_HIT_SFX, asset_get("sfx_absa_singlezap1"));

set_hitbox_value(AT_UAIR, 3, HG_PARENT_HITBOX, 2);
set_hitbox_value(AT_UAIR, 3, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_UAIR, 3, HG_WINDOW, 4);
set_hitbox_value(AT_UAIR, 3, HG_LIFETIME, 2);
set_hitbox_value(AT_UAIR, 3, HG_HITBOX_X, 34);
set_hitbox_value(AT_UAIR, 3, HG_HITBOX_Y, -56);
set_hitbox_value(AT_UAIR, 3, HG_HITBOX_GROUP, -1);

set_hitbox_value(AT_UAIR, 4, HG_PARENT_HITBOX, 2);
set_hitbox_value(AT_UAIR, 4, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_UAIR, 4, HG_WINDOW, 5);
set_hitbox_value(AT_UAIR, 4, HG_LIFETIME, 2);
set_hitbox_value(AT_UAIR, 4, HG_HITBOX_X, 29);
set_hitbox_value(AT_UAIR, 4, HG_HITBOX_Y, -64);
set_hitbox_value(AT_UAIR, 4, HG_HITBOX_GROUP, -1);

set_hitbox_value(AT_UAIR, 5, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_UAIR, 5, HG_WINDOW, 6);
set_hitbox_value(AT_UAIR, 5, HG_LIFETIME, 4);
set_hitbox_value(AT_UAIR, 5, HG_HITBOX_X, 21);
set_hitbox_value(AT_UAIR, 5, HG_HITBOX_Y, -66);
set_hitbox_value(AT_UAIR, 5, HG_WIDTH, 85);
set_hitbox_value(AT_UAIR, 5, HG_HEIGHT, 55);
set_hitbox_value(AT_UAIR, 5, HG_PRIORITY, 2);
set_hitbox_value(AT_UAIR, 5, HG_DAMAGE, 8);
set_hitbox_value(AT_UAIR, 5, HG_ANGLE, 90);
set_hitbox_value(AT_UAIR, 5, HG_BASE_KNOCKBACK, 6.5);
set_hitbox_value(AT_UAIR, 5, HG_KNOCKBACK_SCALING, 0.95);
set_hitbox_value(AT_UAIR, 5, HG_BASE_HITPAUSE, 7);
set_hitbox_value(AT_UAIR, 5, HG_HITPAUSE_SCALING, 1.25);
set_hitbox_value(AT_UAIR, 5, HG_VISUAL_EFFECT, 21);
set_hitbox_value(AT_UAIR, 5, HG_VISUAL_EFFECT_X_OFFSET, 5);
set_hitbox_value(AT_UAIR, 5, HG_VISUAL_EFFECT_Y_OFFSET, 0);
set_hitbox_value(AT_UAIR, 5, HG_HITBOX_GROUP, -1);
set_hitbox_value(AT_UAIR, 5, HG_HIT_SFX, asset_get("sfx_absa_harderhit"));