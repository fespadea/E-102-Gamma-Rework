set_attack_value(AT_JAB, AG_SPRITE, sprite_get("jab"));
set_attack_value(AT_JAB, AG_NUM_WINDOWS, 9);
set_attack_value(AT_JAB, AG_HURTBOX_SPRITE, sprite_get("jab_hurt"));

set_window_value(AT_JAB, 1, AG_WINDOW_LENGTH, 12);
set_window_value(AT_JAB, 1, AG_WINDOW_ANIM_FRAMES, 8);
set_window_value(AT_JAB, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_JAB, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_weak1"));
set_window_value(AT_JAB, 1, AG_WINDOW_SFX_FRAME, 8);

set_window_value(AT_JAB, 2, AG_WINDOW_LENGTH, 6);
set_window_value(AT_JAB, 2, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_JAB, 2, AG_WINDOW_ANIM_FRAME_START, 8);

set_window_value(AT_JAB, 3, AG_WINDOW_LENGTH, 21);
set_window_value(AT_JAB, 3, AG_WINDOW_ANIM_FRAMES, 7);
set_window_value(AT_JAB, 3, AG_WINDOW_ANIM_FRAME_START, 9);
set_window_value(AT_JAB, 3, AG_WINDOW_HAS_WHIFFLAG, true);
set_window_value(AT_JAB, 3, AG_WINDOW_CANCEL_TYPE, 1);
set_window_value(AT_JAB, 3, AG_WINDOW_CANCEL_FRAME, 3);

set_window_value(AT_JAB, 4, AG_WINDOW_LENGTH, 15);
set_window_value(AT_JAB, 4, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_JAB, 4, AG_WINDOW_ANIM_FRAME_START, 16);
set_window_value(AT_JAB, 4, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_JAB, 4, AG_WINDOW_SFX, asset_get("sfx_swipe_weak1"));
set_window_value(AT_JAB, 4, AG_WINDOW_SFX_FRAME, 10);

set_window_value(AT_JAB, 5, AG_WINDOW_LENGTH, 3);
set_window_value(AT_JAB, 5, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_JAB, 5, AG_WINDOW_ANIM_FRAME_START, 18);

set_window_value(AT_JAB, 6, AG_WINDOW_LENGTH, 21);
set_window_value(AT_JAB, 6, AG_WINDOW_ANIM_FRAMES, 7);
set_window_value(AT_JAB, 6, AG_WINDOW_ANIM_FRAME_START, 18);
set_window_value(AT_JAB, 6, AG_WINDOW_HAS_WHIFFLAG, true);
set_window_value(AT_JAB, 6, AG_WINDOW_CANCEL_TYPE, 1);
set_window_value(AT_JAB, 6, AG_WINDOW_CANCEL_FRAME, 3);

set_window_value(AT_JAB, 7, AG_WINDOW_LENGTH, 6);
set_window_value(AT_JAB, 7, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_JAB, 7, AG_WINDOW_ANIM_FRAME_START, 25);
set_window_value(AT_JAB, 7, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_JAB, 7, AG_WINDOW_SFX, asset_get("sfx_swipe_medium1"));
set_window_value(AT_JAB, 7, AG_WINDOW_SFX_FRAME, 1);

set_window_value(AT_JAB, 8, AG_WINDOW_LENGTH, 6);
set_window_value(AT_JAB, 8, AG_WINDOW_ANIM_FRAMES, 5);
set_window_value(AT_JAB, 8, AG_WINDOW_ANIM_FRAME_START, 27);

set_window_value(AT_JAB, 9, AG_WINDOW_LENGTH, 21);
set_window_value(AT_JAB, 9, AG_WINDOW_ANIM_FRAMES, 7);
set_window_value(AT_JAB, 9, AG_WINDOW_ANIM_FRAME_START, 32);
set_window_value(AT_JAB, 9, AG_WINDOW_HAS_WHIFFLAG, true);


set_num_hitboxes(AT_JAB, 4);

set_hitbox_value(AT_JAB, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_JAB, 1, HG_WINDOW, 2);
set_hitbox_value(AT_JAB, 1, HG_HITBOX_GROUP, -1);
set_hitbox_value(AT_JAB, 1, HG_WINDOW_CREATION_FRAME, 0);
set_hitbox_value(AT_JAB, 1, HG_LIFETIME, 6);
set_hitbox_value(AT_JAB, 1, HG_HITBOX_X, 35);
set_hitbox_value(AT_JAB, 1, HG_HITBOX_Y, -50);
set_hitbox_value(AT_JAB, 1, HG_WIDTH, 70);
set_hitbox_value(AT_JAB, 1, HG_HEIGHT, 40);
set_hitbox_value(AT_JAB, 1, HG_PRIORITY, 2);
set_hitbox_value(AT_JAB, 1, HG_DAMAGE, 5);
set_hitbox_value(AT_JAB, 1, HG_ANGLE, 92);
set_hitbox_value(AT_JAB, 1, HG_BASE_KNOCKBACK, 5);
set_hitbox_value(AT_JAB, 1, HG_BASE_HITPAUSE, 3);
set_hitbox_value(AT_JAB, 1, HG_VISUAL_EFFECT, 135);
set_hitbox_value(AT_JAB, 1, HG_VISUAL_EFFECT_X_OFFSET, 24);
set_hitbox_value(AT_JAB, 1, HG_HIT_SFX, asset_get("sfx_blow_weak1"));

set_hitbox_value(AT_JAB, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_JAB, 2, HG_WINDOW, 4);
set_hitbox_value(AT_JAB, 2, HG_HITBOX_GROUP, -1);
set_hitbox_value(AT_JAB, 2, HG_WINDOW_CREATION_FRAME, 8);
set_hitbox_value(AT_JAB, 2, HG_LIFETIME, 7);
set_hitbox_value(AT_JAB, 2, HG_HITBOX_X, 45);
set_hitbox_value(AT_JAB, 2, HG_HITBOX_Y, -45);
set_hitbox_value(AT_JAB, 2, HG_WIDTH, 55);
set_hitbox_value(AT_JAB, 2, HG_HEIGHT, 35);
set_hitbox_value(AT_JAB, 2, HG_PRIORITY, 2);
set_hitbox_value(AT_JAB, 2, HG_DAMAGE, 3);
set_hitbox_value(AT_JAB, 2, HG_ANGLE, 90);
set_hitbox_value(AT_JAB, 2, HG_BASE_KNOCKBACK, 4.55);
set_hitbox_value(AT_JAB, 2, HG_BASE_HITPAUSE, 7);
set_hitbox_value(AT_JAB, 2, HG_VISUAL_EFFECT, 135);
set_hitbox_value(AT_JAB, 2, HG_VISUAL_EFFECT_X_OFFSET, 24);
set_hitbox_value(AT_JAB, 2, HG_HIT_SFX, asset_get("sfx_blow_weak1"));

set_hitbox_value(AT_JAB, 3, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_JAB, 3, HG_WINDOW, 7);
set_hitbox_value(AT_JAB, 3, HG_HITBOX_GROUP, -1);
set_hitbox_value(AT_JAB, 3, HG_LIFETIME, 5);
set_hitbox_value(AT_JAB, 3, HG_WINDOW_CREATION_FRAME, 0);
set_hitbox_value(AT_JAB, 3, HG_HITBOX_X, 50);
set_hitbox_value(AT_JAB, 3, HG_HITBOX_Y, -45);
set_hitbox_value(AT_JAB, 3, HG_WIDTH, 53);
set_hitbox_value(AT_JAB, 3, HG_HEIGHT, 45);
set_hitbox_value(AT_JAB, 3, HG_PRIORITY, 4);
set_hitbox_value(AT_JAB, 3, HG_DAMAGE, 1);
set_hitbox_value(AT_JAB, 3, HG_ANGLE, 90);
set_hitbox_value(AT_JAB, 3, HG_BASE_KNOCKBACK, .65);
set_hitbox_value(AT_JAB, 3, HG_KNOCKBACK_SCALING, .5);
set_hitbox_value(AT_JAB, 3, HG_BASE_HITPAUSE, 3);
set_hitbox_value(AT_JAB, 3, HG_HITPAUSE_SCALING, .25);
set_hitbox_value(AT_JAB, 3, HG_VISUAL_EFFECT, 20);
set_hitbox_value(AT_JAB, 3, HG_VISUAL_EFFECT_X_OFFSET, 0);
set_hitbox_value(AT_JAB, 3, HG_HIT_SFX, asset_get("sfx_blow_weak1"));

set_hitbox_value(AT_JAB, 4, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_JAB, 4, HG_WINDOW, 8);
set_hitbox_value(AT_JAB, 4, HG_HITBOX_GROUP, -1);
set_hitbox_value(AT_JAB, 4, HG_LIFETIME, 3);
set_hitbox_value(AT_JAB, 4, HG_WINDOW_CREATION_FRAME, 0);
set_hitbox_value(AT_JAB, 4, HG_HITBOX_X, 50);
set_hitbox_value(AT_JAB, 4, HG_HITBOX_Y, -45);
set_hitbox_value(AT_JAB, 4, HG_WIDTH, 53);
set_hitbox_value(AT_JAB, 4, HG_HEIGHT, 45);
set_hitbox_value(AT_JAB, 4, HG_PRIORITY, 4);
set_hitbox_value(AT_JAB, 4, HG_DAMAGE, 3);
set_hitbox_value(AT_JAB, 4, HG_ANGLE, 90);
set_hitbox_value(AT_JAB, 4, HG_BASE_KNOCKBACK, 7);
// set_hitbox_value(AT_JAB, 4, HG_KNOCKBACK_SCALING, .55);
set_hitbox_value(AT_JAB, 4, HG_BASE_HITPAUSE, 3);
set_hitbox_value(AT_JAB, 4, HG_HITPAUSE_SCALING, .25);
set_hitbox_value(AT_JAB, 4, HG_VISUAL_EFFECT_X_OFFSET, 0);
set_hitbox_value(AT_JAB, 4, HG_HIT_SFX, asset_get("sfx_absa_singlezap2"));