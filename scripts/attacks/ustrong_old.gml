set_attack_value(AT_USTRONG_2, AG_CATEGORY, 0);
set_attack_value(AT_USTRONG_2, AG_SPRITE, sprite_get("ustrong_old"));
set_attack_value(AT_USTRONG_2, AG_NUM_WINDOWS, 3);
set_attack_value(AT_USTRONG_2, AG_STRONG_CHARGE_WINDOW, 1);
set_attack_value(AT_USTRONG_2, AG_HURTBOX_SPRITE, sprite_get("ustrong_old_hurt"));

set_window_value(AT_USTRONG_2, 1, AG_WINDOW_LENGTH, 1);
set_window_value(AT_USTRONG_2, 1, AG_WINDOW_ANIM_FRAMES, 1);

set_window_value(AT_USTRONG_2, 2, AG_WINDOW_LENGTH, 3);
set_window_value(AT_USTRONG_2, 2, AG_WINDOW_ANIM_FRAMES, 1);

set_window_value(AT_USTRONG_2, 3, AG_WINDOW_LENGTH, 30);
set_window_value(AT_USTRONG_2, 3, AG_WINDOW_ANIM_FRAMES, 10);
set_window_value(AT_USTRONG_2, 3, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_USTRONG_2, 3, AG_WINDOW_SFX, asset_get("sfx_absa_whip3"));
set_window_value(AT_USTRONG_2, 3, AG_WINDOW_SFX_FRAME, 1);
set_window_value(AT_USTRONG_2, 3, AG_WINDOW_ANIM_FRAME_START, 1);

set_window_value(AT_USTRONG_2, 4, AG_WINDOW_LENGTH, 7);
set_window_value(AT_USTRONG_2, 4, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_USTRONG_2, 4, AG_WINDOW_ANIM_FRAME_START, 0);
set_window_value(AT_USTRONG_2, 4, AG_WINDOW_HAS_WHIFFLAG, true);


set_num_hitboxes(AT_USTRONG_2,2);

set_hitbox_value(AT_USTRONG_2, 1, HG_PARENT_HITBOX, 1);
set_hitbox_value(AT_USTRONG_2, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_USTRONG_2, 1, HG_WINDOW, 3);
set_hitbox_value(AT_USTRONG_2, 1, HG_WINDOW_CREATION_FRAME, 2);
set_hitbox_value(AT_USTRONG_2, 1, HG_LIFETIME, 19);
set_hitbox_value(AT_USTRONG_2, 1, HG_EFFECT, 11);
set_hitbox_value(AT_USTRONG_2, 1, HG_HITBOX_X, 0);
set_hitbox_value(AT_USTRONG_2, 1, HG_HITBOX_Y, -40);
set_hitbox_value(AT_USTRONG_2, 1, HG_WIDTH, 60);
set_hitbox_value(AT_USTRONG_2, 1, HG_HEIGHT, 100);
set_hitbox_value(AT_USTRONG_2, 1, HG_PRIORITY, 2);
set_hitbox_value(AT_USTRONG_2, 1, HG_DAMAGE, 5);
set_hitbox_value(AT_USTRONG_2, 1, HG_ANGLE, 40);
set_hitbox_value(AT_USTRONG_2, 1, HG_BASE_KNOCKBACK, 5);
set_hitbox_value(AT_USTRONG_2, 1, HG_KNOCKBACK_SCALING, 0.75);
set_hitbox_value(AT_USTRONG_2, 1, HG_BASE_HITPAUSE, 6);
set_hitbox_value(AT_USTRONG_2, 1, HG_HITPAUSE_SCALING, 0.45);
set_hitbox_value(AT_USTRONG_2, 1, HG_VISUAL_EFFECT_X_OFFSET, 32);
set_hitbox_value(AT_USTRONG_2, 1, HG_VISUAL_EFFECT_Y_OFFSET, -10);
set_hitbox_value(AT_USTRONG_2, 1, HG_HIT_SFX, asset_get("sfx_blow_heavy1"));


set_hitbox_value(AT_USTRONG_2, 2, HG_PARENT_HITBOX, 2);
set_hitbox_value(AT_USTRONG_2, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_USTRONG_2, 2, HG_WINDOW, 3);
set_hitbox_value(AT_USTRONG_2, 2, HG_WINDOW_CREATION_FRAME, 15);
set_hitbox_value(AT_USTRONG_2, 2, HG_LIFETIME, 28);
set_hitbox_value(AT_USTRONG_2, 2, HG_EFFECT, 11);
set_hitbox_value(AT_USTRONG_2, 2, HG_HITBOX_X, 0);
set_hitbox_value(AT_USTRONG_2, 2, HG_HITBOX_Y, -80);
set_hitbox_value(AT_USTRONG_2, 2, HG_WIDTH, 60);
set_hitbox_value(AT_USTRONG_2, 2, HG_HEIGHT, 85);
set_hitbox_value(AT_USTRONG_2, 2, HG_PRIORITY, 2);
set_hitbox_value(AT_USTRONG_2, 2, HG_DAMAGE, 15);
set_hitbox_value(AT_USTRONG_2, 2, HG_ANGLE, 90);
set_hitbox_value(AT_USTRONG_2, 2, HG_BASE_KNOCKBACK, 6);
set_hitbox_value(AT_USTRONG_2, 2, HG_KNOCKBACK_SCALING, 1.2);
set_hitbox_value(AT_USTRONG_2, 2, HG_BASE_HITPAUSE, 6);
set_hitbox_value(AT_USTRONG_2, 2, HG_HITPAUSE_SCALING, 0.45);
set_hitbox_value(AT_USTRONG_2, 2, HG_VISUAL_EFFECT_X_OFFSET, 32);
set_hitbox_value(AT_USTRONG_2, 2, HG_VISUAL_EFFECT_Y_OFFSET, -10);
set_hitbox_value(AT_USTRONG_2, 2, HG_HIT_SFX, asset_get("sfx_blow_heavy1"));