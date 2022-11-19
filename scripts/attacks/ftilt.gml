set_attack_value(AT_FTILT, AG_CATEGORY, 0);
set_attack_value(AT_FTILT, AG_SPRITE, sprite_get("ftilt"));
set_attack_value(AT_FTILT, AG_NUM_WINDOWS, 3);
set_attack_value(AT_FTILT, AG_HURTBOX_SPRITE, sprite_get("ftilt_hurt"));

set_window_value(AT_FTILT, 1, AG_WINDOW_LENGTH, 5);
set_window_value(AT_FTILT, 1, AG_WINDOW_ANIM_FRAMES, 1);

set_window_value(AT_FTILT, 2, AG_WINDOW_LENGTH, 15);
set_window_value(AT_FTILT, 2, AG_WINDOW_ANIM_FRAMES, 5);
set_window_value(AT_FTILT, 2, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FTILT, 2, AG_WINDOW_SFX, asset_get("sfx_ell_drill_loop"));
set_window_value(AT_FTILT, 2, AG_WINDOW_SFX_FRAME, 1);
set_window_value(AT_FTILT, 2, AG_WINDOW_ANIM_FRAME_START, 1);

set_window_value(AT_FTILT, 3, AG_WINDOW_LENGTH, 5);
set_window_value(AT_FTILT, 3, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_FTILT, 3, AG_WINDOW_ANIM_FRAME_START, 6);

set_num_hitboxes(AT_FTILT, 2);

set_hitbox_value(AT_FTILT, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_FTILT, 1, HG_WINDOW, 2);
set_hitbox_value(AT_FTILT, 1, HG_HITBOX_GROUP, -1);
set_hitbox_value(AT_FTILT, 1, HG_TECHABLE, 1);
set_hitbox_value(AT_FTILT, 1, HG_WINDOW_CREATION_FRAME, 1);
set_hitbox_value(AT_FTILT, 1, HG_LIFETIME, 24);
set_hitbox_value(AT_FTILT, 1, HG_HITBOX_X, 45);
set_hitbox_value(AT_FTILT, 1, HG_HITBOX_Y, -50);
set_hitbox_value(AT_FTILT, 1, HG_WIDTH, 77);
set_hitbox_value(AT_FTILT, 1, HG_HEIGHT, 40);
set_hitbox_value(AT_FTILT, 1, HG_PRIORITY, 2);
set_hitbox_value(AT_FTILT, 1, HG_DAMAGE, 1);
set_hitbox_value(AT_FTILT, 1, HG_ANGLE, 80);
set_hitbox_value(AT_FTILT, 1, HG_BASE_KNOCKBACK, 2);
// set_hitbox_value(AT_FTILT, 1, HG_KNOCKBACK_SCALING, 0.25);
set_hitbox_value(AT_FTILT, 1, HG_BASE_HITPAUSE, 0.55);
set_hitbox_value(AT_FTILT, 1, HG_HITPAUSE_SCALING, 0.45);
set_hitbox_value(AT_FTILT, 1, HG_VISUAL_EFFECT_X_OFFSET, 22);
set_hitbox_value(AT_FTILT, 1, HG_VISUAL_EFFECT_Y_OFFSET, -10);
set_hitbox_value(AT_FTILT, 1, HG_HIT_SFX, asset_get("sfx_ell_drill_stab"));

set_hitbox_value(AT_FTILT, 2, HG_PARENT_HITBOX, 2);
set_hitbox_value(AT_FTILT, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_FTILT, 2, HG_WINDOW, 3);
set_hitbox_value(AT_FTILT, 2, HG_HITBOX_GROUP, -1);
set_hitbox_value(AT_FTILT, 2, HG_TECHABLE, 1);
set_hitbox_value(AT_FTILT, 2, HG_WINDOW_CREATION_FRAME, 1);
set_hitbox_value(AT_FTILT, 2, HG_LIFETIME, 24);
set_hitbox_value(AT_FTILT, 2, HG_HITBOX_X, 45);
set_hitbox_value(AT_FTILT, 2, HG_HITBOX_Y, -50);
set_hitbox_value(AT_FTILT, 2, HG_WIDTH, 77);
set_hitbox_value(AT_FTILT, 2, HG_HEIGHT, 40);
set_hitbox_value(AT_FTILT, 2, HG_PRIORITY, 4);
set_hitbox_value(AT_FTILT, 2, HG_DAMAGE, 3);
set_hitbox_value(AT_FTILT, 2, HG_ANGLE, 45);
set_hitbox_value(AT_FTILT, 2, HG_BASE_KNOCKBACK, 3.5);
set_hitbox_value(AT_FTILT, 2, HG_KNOCKBACK_SCALING, 0.65);
set_hitbox_value(AT_FTILT, 2, HG_BASE_HITPAUSE, 0.55);
set_hitbox_value(AT_FTILT, 2, HG_HITPAUSE_SCALING, 0.45);
set_hitbox_value(AT_FTILT, 2, HG_VISUAL_EFFECT_X_OFFSET, 22);
set_hitbox_value(AT_FTILT, 2, HG_VISUAL_EFFECT_Y_OFFSET, -10);
set_hitbox_value(AT_FTILT, 2, HG_HIT_SFX, asset_get("sfx_ell_drill_stab"));