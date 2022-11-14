set_attack_value(AT_UAIR, AG_CATEGORY, 1);
set_attack_value(AT_UAIR, AG_SPRITE, sprite_get("uair"));
set_attack_value(AT_UAIR, AG_NUM_WINDOWS, 3);
set_attack_value(AT_UAIR, AG_HAS_LANDING_LAG, 1);
set_attack_value(AT_UAIR, AG_LANDING_LAG, 8);
set_attack_value(AT_UAIR, AG_HURTBOX_SPRITE, sprite_get("uair_hurt"));

set_window_value(AT_UAIR, 1, AG_WINDOW_LENGTH, 12);
set_window_value(AT_UAIR, 1, AG_WINDOW_ANIM_FRAMES, 5);
set_window_value(AT_UAIR, 1, AG_WINDOW_ANIM_FRAME_START, 0);

set_window_value(AT_UAIR, 2, AG_WINDOW_LENGTH, 11);
set_window_value(AT_UAIR, 2, AG_WINDOW_ANIM_FRAMES, 11);
set_window_value(AT_UAIR, 2, AG_WINDOW_ANIM_FRAME_START, 5);
// set_window_value(AT_UAIR, 2, AG_WINDOW_HAS_SFX, 1);
// set_window_value(AT_UAIR, 2, AG_WINDOW_SFX, sound_get("GammaElectricity"));
// set_window_value(AT_UAIR, 2, AG_WINDOW_SFX_FRAME, 0);
set_window_value(AT_UAIR, 2, AG_WINDOW_HAS_WHIFFLAG, 10);

set_window_value(AT_UAIR, 3, AG_WINDOW_LENGTH, 10);
set_window_value(AT_UAIR, 3, AG_WINDOW_ANIM_FRAMES, 6);
set_window_value(AT_UAIR, 3, AG_WINDOW_ANIM_FRAME_START, 16);
set_window_value(AT_UAIR, 3, AG_WINDOW_HAS_WHIFFLAG, 10);

set_num_hitboxes(AT_UAIR,5);

set_hitbox_value(AT_UAIR, 1, HG_PARENT_HITBOX, 2);
set_hitbox_value(AT_UAIR, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_UAIR, 1, HG_WINDOW, 2);
set_hitbox_value(AT_UAIR, 1, HG_WINDOW_CREATION_FRAME, 0);
set_hitbox_value(AT_UAIR, 1, HG_LIFETIME, 1);
set_hitbox_value(AT_UAIR, 1, HG_HITBOX_X, 35);
set_hitbox_value(AT_UAIR, 1, HG_HITBOX_Y, -35);
set_hitbox_value(AT_UAIR, 1, HG_HITBOX_GROUP, -1);


set_hitbox_value(AT_UAIR, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_UAIR, 2, HG_WINDOW, 2);
set_hitbox_value(AT_UAIR, 2, HG_WINDOW_CREATION_FRAME, 1);
set_hitbox_value(AT_UAIR, 2, HG_LIFETIME, 2);
set_hitbox_value(AT_UAIR, 2, HG_HITBOX_X, 35);
set_hitbox_value(AT_UAIR, 2, HG_HITBOX_Y, -50);
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
set_hitbox_value(AT_UAIR, 3, HG_WINDOW, 2);
set_hitbox_value(AT_UAIR, 3, HG_WINDOW_CREATION_FRAME, 3);
set_hitbox_value(AT_UAIR, 3, HG_LIFETIME, 2);
set_hitbox_value(AT_UAIR, 3, HG_HITBOX_X, 28);
set_hitbox_value(AT_UAIR, 3, HG_HITBOX_Y, -70);
set_hitbox_value(AT_UAIR, 3, HG_HITBOX_GROUP, -1);

set_hitbox_value(AT_UAIR, 4, HG_PARENT_HITBOX, 2);
set_hitbox_value(AT_UAIR, 4, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_UAIR, 4, HG_WINDOW, 2);
set_hitbox_value(AT_UAIR, 4, HG_WINDOW_CREATION_FRAME, 5);
set_hitbox_value(AT_UAIR, 4, HG_LIFETIME, 2);
set_hitbox_value(AT_UAIR, 4, HG_HITBOX_X, 23);
set_hitbox_value(AT_UAIR, 4, HG_HITBOX_Y, -78);
set_hitbox_value(AT_UAIR, 4, HG_HITBOX_GROUP, -1);

set_hitbox_value(AT_UAIR, 5, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_UAIR, 5, HG_WINDOW, 2);
set_hitbox_value(AT_UAIR, 5, HG_WINDOW_CREATION_FRAME, 7);
set_hitbox_value(AT_UAIR, 5, HG_LIFETIME, 4);
set_hitbox_value(AT_UAIR, 5, HG_HITBOX_X, 15);
set_hitbox_value(AT_UAIR, 5, HG_HITBOX_Y, -80);
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