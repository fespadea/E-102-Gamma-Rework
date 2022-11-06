set_attack_value(AT_DSTRONG, AG_SPRITE, sprite_get("dstrong"));
set_attack_value(AT_DSTRONG, AG_NUM_WINDOWS, 3);
set_attack_value(AT_DSTRONG, AG_STRONG_CHARGE_WINDOW, 1);
set_attack_value(AT_DSTRONG, AG_HURTBOX_SPRITE, sprite_get("dstrong_hurt"));

set_window_value(AT_DSTRONG, 1, AG_WINDOW_LENGTH, 14);
set_window_value(AT_DSTRONG, 1, AG_WINDOW_ANIM_FRAMES, 7);

set_window_value(AT_DSTRONG, 2, AG_WINDOW_LENGTH, 3);
set_window_value(AT_DSTRONG, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_DSTRONG, 2, AG_WINDOW_ANIM_FRAME_START, 6);

set_window_value(AT_DSTRONG, 3, AG_WINDOW_LENGTH, 6);
set_window_value(AT_DSTRONG, 3, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_DSTRONG, 3, AG_WINDOW_ANIM_FRAME_START, 7);
set_window_value(AT_DSTRONG, 3, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_DSTRONG, 3, AG_WINDOW_SFX_FRAME, 1);
set_window_value(AT_DSTRONG, 3, AG_WINDOW_SFX, asset_get("sfx_abyss_explosion_big"));

set_window_value(AT_DSTRONG, 4, AG_WINDOW_LENGTH, 18);
set_window_value(AT_DSTRONG, 4, AG_WINDOW_ANIM_FRAMES, 6);
set_window_value(AT_DSTRONG, 4, AG_WINDOW_ANIM_FRAME_START, 9);


set_num_hitboxes(AT_DSTRONG, 2);

set_hitbox_value(AT_DSTRONG, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DSTRONG, 1, HG_PARENT_HITBOX, 1);
set_hitbox_value(AT_DSTRONG, 1, HG_WINDOW, 3);
set_hitbox_value(AT_DSTRONG, 1, HG_LIFETIME, get_window_value(AT_DSTRONG, get_hitbox_value(AT_DSTRONG, 1, HG_WINDOW), AG_WINDOW_LENGTH));
set_hitbox_value(AT_DSTRONG, 1, HG_HITBOX_X, 70);
set_hitbox_value(AT_DSTRONG, 1, HG_HITBOX_Y, -45);
set_hitbox_value(AT_DSTRONG, 1, HG_WIDTH, 85);
set_hitbox_value(AT_DSTRONG, 1, HG_HEIGHT, 43);
set_hitbox_value(AT_DSTRONG, 1, HG_PRIORITY, 2);
set_hitbox_value(AT_DSTRONG, 1, HG_DAMAGE, 10);
set_hitbox_value(AT_DSTRONG, 1, HG_ANGLE, 40);
set_hitbox_value(AT_DSTRONG, 1, HG_BASE_KNOCKBACK, 4.25);
set_hitbox_value(AT_DSTRONG, 1, HG_KNOCKBACK_SCALING, 0.85);
set_hitbox_value(AT_DSTRONG, 1, HG_BASE_HITPAUSE, 4);
set_hitbox_value(AT_DSTRONG, 1, HG_HITPAUSE_SCALING, .6);
set_hitbox_value(AT_DSTRONG, 1, HG_VISUAL_EFFECT, 139);
set_hitbox_value(AT_DSTRONG, 1, HG_VISUAL_EFFECT_X_OFFSET, 24);
set_hitbox_value(AT_DSTRONG, 1, HG_HIT_SFX, asset_get("sfx_boss_fireball_land"));

set_hitbox_value(AT_DSTRONG, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DSTRONG, 2, HG_PARENT_HITBOX, 2);
set_hitbox_value(AT_DSTRONG, 2, HG_WINDOW, 3);
set_hitbox_value(AT_DSTRONG, 2, HG_LIFETIME, get_window_value(AT_DSTRONG, get_hitbox_value(AT_DSTRONG, 2, HG_WINDOW), AG_WINDOW_LENGTH));
set_hitbox_value(AT_DSTRONG, 2, HG_HITBOX_X, -60);
set_hitbox_value(AT_DSTRONG, 2, HG_HITBOX_Y, -45);
set_hitbox_value(AT_DSTRONG, 2, HG_WIDTH, 85);
set_hitbox_value(AT_DSTRONG, 2, HG_HEIGHT, 43);
set_hitbox_value(AT_DSTRONG, 2, HG_PRIORITY, 2);
set_hitbox_value(AT_DSTRONG, 2, HG_DAMAGE, 10);
set_hitbox_value(AT_DSTRONG, 2, HG_ANGLE, 140);
set_hitbox_value(AT_DSTRONG, 2, HG_BASE_KNOCKBACK, 4.25);
set_hitbox_value(AT_DSTRONG, 2, HG_KNOCKBACK_SCALING, 0.85);
set_hitbox_value(AT_DSTRONG, 2, HG_BASE_HITPAUSE, 4);
set_hitbox_value(AT_DSTRONG, 2, HG_HITPAUSE_SCALING, .6);
set_hitbox_value(AT_DSTRONG, 2, HG_VISUAL_EFFECT, 139);
set_hitbox_value(AT_DSTRONG, 2, HG_VISUAL_EFFECT_X_OFFSET, 24);
set_hitbox_value(AT_DSTRONG, 2, HG_HIT_SFX, asset_get("sfx_boss_fireball_land"));