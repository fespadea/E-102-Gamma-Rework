set_attack_value(AT_FSTRONG_2, AG_SPRITE, sprite_get("fstrong_old"));
set_attack_value(AT_FSTRONG_2, AG_NUM_WINDOWS, 5);
set_attack_value(AT_FSTRONG_2, AG_STRONG_CHARGE_WINDOW, 1);
set_attack_value(AT_FSTRONG_2, AG_HURTBOX_SPRITE, sprite_get("fstrong_old_hurt"));

set_window_value(AT_FSTRONG_2, 1, AG_WINDOW_LENGTH, 12);
set_window_value(AT_FSTRONG_2, 1, AG_WINDOW_ANIM_FRAMES, 6);

set_window_value(AT_FSTRONG_2, 2, AG_WINDOW_LENGTH, 3);
set_window_value(AT_FSTRONG_2, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_FSTRONG_2, 2, AG_WINDOW_ANIM_FRAME_START, 5);

set_window_value(AT_FSTRONG_2, 3, AG_WINDOW_LENGTH, 10);
set_window_value(AT_FSTRONG_2, 3, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_FSTRONG_2, 3, AG_WINDOW_ANIM_FRAME_START, 6);
set_window_value(AT_FSTRONG_2, 3, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FSTRONG_2, 3, AG_WINDOW_SFX, asset_get("sfx_abyss_explosion_big"));

set_window_value(AT_FSTRONG_2, 4, AG_WINDOW_LENGTH, 10);
set_window_value(AT_FSTRONG_2, 4, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_FSTRONG_2, 4, AG_WINDOW_ANIM_FRAME_START, 8);

set_window_value(AT_FSTRONG_2, 5, AG_WINDOW_LENGTH, 10);
set_window_value(AT_FSTRONG_2, 5, AG_WINDOW_ANIM_FRAMES, 6);
set_window_value(AT_FSTRONG_2, 5, AG_WINDOW_ANIM_FRAME_START, 10);
set_window_value(AT_FSTRONG_2, 5, AG_WINDOW_HAS_WHIFFLAG, true);

set_num_hitboxes(AT_FSTRONG_2, 2);

set_hitbox_value(AT_FSTRONG_2, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_FSTRONG_2, 1, HG_WINDOW, 3);
set_hitbox_value(AT_FSTRONG_2, 1, HG_LIFETIME, get_window_value(AT_FSTRONG_2, 3, AG_WINDOW_LENGTH));
set_hitbox_value(AT_FSTRONG_2, 1, HG_HITBOX_X, 60);
set_hitbox_value(AT_FSTRONG_2, 1, HG_HITBOX_Y, -40);
set_hitbox_value(AT_FSTRONG_2, 1, HG_WIDTH, 85);
set_hitbox_value(AT_FSTRONG_2, 1, HG_HEIGHT, 65);
set_hitbox_value(AT_FSTRONG_2, 1, HG_PRIORITY, 2);
set_hitbox_value(AT_FSTRONG_2, 1, HG_DAMAGE, 13);
set_hitbox_value(AT_FSTRONG_2, 1, HG_ANGLE, 45);
set_hitbox_value(AT_FSTRONG_2, 1, HG_BASE_KNOCKBACK, 5);
set_hitbox_value(AT_FSTRONG_2, 1, HG_KNOCKBACK_SCALING, 1.1);
set_hitbox_value(AT_FSTRONG_2, 1, HG_BASE_HITPAUSE, 4);
set_hitbox_value(AT_FSTRONG_2, 1, HG_HITPAUSE_SCALING, .6);
set_hitbox_value(AT_FSTRONG_2, 1, HG_VISUAL_EFFECT, 139);
set_hitbox_value(AT_FSTRONG_2, 1, HG_VISUAL_EFFECT_X_OFFSET, 24);
set_hitbox_value(AT_FSTRONG_2, 1, HG_HIT_SFX, asset_get("sfx_boss_fireball_land"));

set_hitbox_value(AT_FSTRONG_2, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_FSTRONG_2, 2, HG_WINDOW, 4);
set_hitbox_value(AT_FSTRONG_2, 2, HG_LIFETIME, get_window_value(AT_FSTRONG_2, 4, AG_WINDOW_LENGTH));
set_hitbox_value(AT_FSTRONG_2, 2, HG_HITBOX_X, 100);
set_hitbox_value(AT_FSTRONG_2, 2, HG_HITBOX_Y, -40);
set_hitbox_value(AT_FSTRONG_2, 2, HG_WIDTH, 65);
set_hitbox_value(AT_FSTRONG_2, 2, HG_HEIGHT, 65);
set_hitbox_value(AT_FSTRONG_2, 2, HG_PRIORITY, 2);
set_hitbox_value(AT_FSTRONG_2, 2, HG_DAMAGE, 5);
set_hitbox_value(AT_FSTRONG_2, 2, HG_ANGLE, 50);
set_hitbox_value(AT_FSTRONG_2, 2, HG_BASE_KNOCKBACK, 4);
set_hitbox_value(AT_FSTRONG_2, 2, HG_KNOCKBACK_SCALING, 0.45);
set_hitbox_value(AT_FSTRONG_2, 2, HG_BASE_HITPAUSE, 4);
set_hitbox_value(AT_FSTRONG_2, 2, HG_HITPAUSE_SCALING, .6);
set_hitbox_value(AT_FSTRONG_2, 2, HG_VISUAL_EFFECT, 139);
set_hitbox_value(AT_FSTRONG_2, 2, HG_VISUAL_EFFECT_X_OFFSET, 24);
set_hitbox_value(AT_FSTRONG_2, 2, HG_HIT_SFX, asset_get("sfx_boss_fireball_land"));