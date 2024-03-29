set_attack_value(AT_DATTACK, AG_CATEGORY, 2);
set_attack_value(AT_DATTACK, AG_SPRITE, sprite_get("dattack"));
set_attack_value(AT_DATTACK, AG_NUM_WINDOWS, 8);
set_attack_value(AT_DATTACK, AG_HURTBOX_SPRITE, sprite_get("dattack_hurt"));
set_attack_value(AT_DATTACK, AG_OFF_LEDGE, 1);
set_attack_value(AT_DATTACK, AG_USES_CUSTOM_GRAVITY, false);

for(var i = 1; i <= get_attack_value(AT_DATTACK, AG_NUM_WINDOWS); i++){
    set_window_value(AT_DATTACK, i, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
    set_window_value(AT_DATTACK, i, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0);
    set_window_value(AT_DATTACK, i, AG_WINDOW_CUSTOM_GRAVITY, gravity_speed*0.75);
}

set_window_value(AT_DATTACK, 1, AG_WINDOW_LENGTH, 5);
set_window_value(AT_DATTACK, 1, AG_WINDOW_ANIM_FRAMES, 5);
set_window_value(AT_DATTACK, 1, AG_WINDOW_ANIM_FRAME_START, 0);
set_window_value(AT_DATTACK, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_DATTACK, 1, AG_WINDOW_SFX, asset_get("sfx_ell_drill_loop"));
set_window_value(AT_DATTACK, 1, AG_WINDOW_SFX_FRAME, 0);
set_window_value(AT_DATTACK, 1, AG_WINDOW_HSPEED_TYPE, 2);
set_window_value(AT_DATTACK, 1, AG_WINDOW_HSPEED, dash_speed);

set_window_value(AT_DATTACK, 2, AG_WINDOW_LENGTH, 1);
set_window_value(AT_DATTACK, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_DATTACK, 2, AG_WINDOW_ANIM_FRAME_START, 4);

set_window_value(AT_DATTACK, 3, AG_WINDOW_LENGTH, 2);
set_window_value(AT_DATTACK, 3, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_DATTACK, 3, AG_WINDOW_ANIM_FRAME_START, 5);

set_window_value(AT_DATTACK, 4, AG_WINDOW_LENGTH, 1);
set_window_value(AT_DATTACK, 4, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_DATTACK, 4, AG_WINDOW_ANIM_FRAME_START, 6);

set_window_value(AT_DATTACK, 5, AG_WINDOW_LENGTH, 1);
set_window_value(AT_DATTACK, 5, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_DATTACK, 5, AG_WINDOW_ANIM_FRAME_START, 7);

set_window_value(AT_DATTACK, 6, AG_WINDOW_LENGTH, 1);
set_window_value(AT_DATTACK, 6, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_DATTACK, 6, AG_WINDOW_ANIM_FRAME_START, 8);

set_window_value(AT_DATTACK, 7, AG_WINDOW_LENGTH, 1);
set_window_value(AT_DATTACK, 7, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_DATTACK, 7, AG_WINDOW_ANIM_FRAME_START, 9);

set_window_value(AT_DATTACK, 8, AG_WINDOW_LENGTH, 12);
set_window_value(AT_DATTACK, 8, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_DATTACK, 8, AG_WINDOW_ANIM_FRAME_START, 10);
set_window_value(AT_DATTACK, 8, AG_WINDOW_HAS_WHIFFLAG, true);

set_num_hitboxes(AT_DATTACK,7);

set_hitbox_value(AT_DATTACK, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DATTACK, 1, HG_WINDOW, 2);
set_hitbox_value(AT_DATTACK, 1, HG_WINDOW_CREATION_FRAME, 0);
set_hitbox_value(AT_DATTACK, 1, HG_LIFETIME, 1);
set_hitbox_value(AT_DATTACK, 1, HG_HITBOX_X, 15);
set_hitbox_value(AT_DATTACK, 1, HG_HITBOX_Y, -25);
set_hitbox_value(AT_DATTACK, 1, HG_WIDTH, 75);
set_hitbox_value(AT_DATTACK, 1, HG_HEIGHT, 60);
set_hitbox_value(AT_DATTACK, 1, HG_PRIORITY, 5);
set_hitbox_value(AT_DATTACK, 1, HG_DAMAGE, 1.7);
set_hitbox_value(AT_DATTACK, 1, HG_ANGLE, 40);
set_hitbox_value(AT_DATTACK, 1, HG_BASE_KNOCKBACK, 3.25);
set_hitbox_value(AT_DATTACK, 1, HG_KNOCKBACK_SCALING, 0.01);
set_hitbox_value(AT_DATTACK, 1, HG_BASE_HITPAUSE, 5);
set_hitbox_value(AT_DATTACK, 1, HG_HITPAUSE_SCALING, 0.2);
set_hitbox_value(AT_DATTACK, 1, HG_HITBOX_GROUP, -1);
set_hitbox_value(AT_DATTACK, 1, HG_HIT_SFX, asset_get("sfx_ell_drill_stab"));

set_hitbox_value(AT_DATTACK, 2, HG_PARENT_HITBOX, 1);
set_hitbox_value(AT_DATTACK, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DATTACK, 2, HG_WINDOW, 3);
set_hitbox_value(AT_DATTACK, 2, HG_WINDOW_CREATION_FRAME, 0);
set_hitbox_value(AT_DATTACK, 2, HG_LIFETIME, 1);
set_hitbox_value(AT_DATTACK, 2, HG_HITBOX_X, 15);
set_hitbox_value(AT_DATTACK, 2, HG_HITBOX_Y, -25);
set_hitbox_value(AT_DATTACK, 2, HG_HITBOX_GROUP, -1);

set_hitbox_value(AT_DATTACK, 3, HG_PARENT_HITBOX, 1);
set_hitbox_value(AT_DATTACK, 3, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DATTACK, 3, HG_WINDOW, 4);
set_hitbox_value(AT_DATTACK, 3, HG_WINDOW_CREATION_FRAME, 0);
set_hitbox_value(AT_DATTACK, 3, HG_LIFETIME, 1);
set_hitbox_value(AT_DATTACK, 3, HG_HITBOX_X, 15);
set_hitbox_value(AT_DATTACK, 3, HG_HITBOX_Y, -25);
set_hitbox_value(AT_DATTACK, 3, HG_HITBOX_GROUP, -1);

set_hitbox_value(AT_DATTACK, 4, HG_PARENT_HITBOX, 1);
set_hitbox_value(AT_DATTACK, 4, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DATTACK, 4, HG_WINDOW, 5);
set_hitbox_value(AT_DATTACK, 4, HG_WINDOW_CREATION_FRAME, 0);
set_hitbox_value(AT_DATTACK, 4, HG_LIFETIME, 1);
set_hitbox_value(AT_DATTACK, 4, HG_HITBOX_X, 15);
set_hitbox_value(AT_DATTACK, 4, HG_HITBOX_Y, -25);
set_hitbox_value(AT_DATTACK, 4, HG_HITBOX_GROUP, -1);

set_hitbox_value(AT_DATTACK, 5, HG_PARENT_HITBOX, 1);
set_hitbox_value(AT_DATTACK, 5, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DATTACK, 5, HG_WINDOW, 6);
set_hitbox_value(AT_DATTACK, 5, HG_WINDOW_CREATION_FRAME, 0);
set_hitbox_value(AT_DATTACK, 5, HG_LIFETIME, 1);
set_hitbox_value(AT_DATTACK, 5, HG_HITBOX_X, 15);
set_hitbox_value(AT_DATTACK, 5, HG_HITBOX_Y, -25);
set_hitbox_value(AT_DATTACK, 5, HG_HITBOX_GROUP, -1);

set_hitbox_value(AT_DATTACK, 6, HG_PARENT_HITBOX, 6);
set_hitbox_value(AT_DATTACK, 6, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DATTACK, 6, HG_WINDOW, 7);
set_hitbox_value(AT_DATTACK, 6, HG_WINDOW_CREATION_FRAME, 0);
set_hitbox_value(AT_DATTACK, 6, HG_LIFETIME, 1);
set_hitbox_value(AT_DATTACK, 6, HG_HITBOX_X, 15);
set_hitbox_value(AT_DATTACK, 6, HG_HITBOX_Y, -25);
set_hitbox_value(AT_DATTACK, 6, HG_WIDTH, 75);
set_hitbox_value(AT_DATTACK, 6, HG_HEIGHT, 60);
set_hitbox_value(AT_DATTACK, 6, HG_PRIORITY, 6);
set_hitbox_value(AT_DATTACK, 6, HG_DAMAGE, 7);
set_hitbox_value(AT_DATTACK, 6, HG_ANGLE, 60);
set_hitbox_value(AT_DATTACK, 6, HG_BASE_KNOCKBACK, 5);
set_hitbox_value(AT_DATTACK, 6, HG_KNOCKBACK_SCALING, 0.75);
set_hitbox_value(AT_DATTACK, 6, HG_BASE_HITPAUSE, 5);
set_hitbox_value(AT_DATTACK, 6, HG_HITPAUSE_SCALING, 1.25);
set_hitbox_value(AT_DATTACK, 6, HG_HITBOX_GROUP, -1);
set_hitbox_value(AT_DATTACK, 6, HG_HIT_SFX, asset_get("sfx_ell_drill_stab"));