/*
// THIS FILE CONTAINS EXAMPLES FOR ALL ATTACK, WINDOW, AND HITBOX INDEXES

//attack properties
set_attack_value(attack, AG_CATEGORY, 0);
set_attack_value(attack, AG_SPRITE, 0);
set_attack_value(attack, AG_AIR_SPRITE, 0);
set_attack_value(attack, AG_HURTBOX_SPRITE, 0);
set_attack_value(attack, AG_HURTBOX_AIR_SPRITE, 0);
set_attack_value(attack, AG_NUM_WINDOWS, 0);
set_attack_value(attack, AG_HAS_LANDING_LAG, 0);
set_attack_value(attack, AG_OFF_LEDGE, 0);
set_attack_value(attack, AG_LANDING_LAG, 0);
set_attack_value(attack, AG_STRONG_CHARGE_WINDOW, 0);
set_attack_value(attack, AG_USES_CUSTOM_GRAVITY, 0);

//attack window properties
set_window_value(attack, window_num, AG_WINDOW_TYPE, 0);
set_window_value(attack, window_num, AG_WINDOW_LENGTH, 0);
set_window_value(attack, window_num, AG_WINDOW_ANIM_FRAMES, 0);
set_window_value(attack, window_num, AG_WINDOW_ANIM_FRAME_START, 0);
set_window_value(attack, window_num, AG_WINDOW_HSPEED, 0);
set_window_value(attack, window_num, AG_WINDOW_VSPEED, 0);
set_window_value(attack, window_num, AG_WINDOW_HSPEED_TYPE, 0);
set_window_value(attack, window_num, AG_WINDOW_VSPEED_TYPE, 0);
set_window_value(attack, window_num, AG_WINDOW_HAS_CUSTOM_FRICTION, 0);
set_window_value(attack, window_num, AG_WINDOW_CUSTOM_AIR_FRICTION, 0);
set_window_value(attack, window_num, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0);
set_window_value(attack, window_num, AG_WINDOW_CUSTOM_GRAVITY, 0);
set_window_value(attack, window_num, AG_WINDOW_HAS_WHIFFLAG, 0);
set_window_value(attack, window_num, AG_WINDOW_INVINCIBILITY, 0);
set_window_value(attack, window_num, AG_WINDOW_HITPAUSE_FRAME, 0);
set_window_value(attack, window_num, AG_WINDOW_CANCEL_TYPE, 0);
set_window_value(attack, window_num, AG_WINDOW_CANCEL_FRAME, 0);
set_window_value(attack, window_num, AG_WINDOW_HAS_SFX, 0);
set_window_value(attack, window_num, AG_WINDOW_SFX, 0);
set_window_value(attack, window_num, AG_WINDOW_SFX_FRAME, 0);

//attack hitbox properties
set_num_hitboxes(attack, HG_NUM_HITBOXES, 0);

//individual hitbox properties
set_hitbox_value(attack, hitbox_num, HG_PARENT_HITBOX, 0);
set_hitbox_value(attack, hitbox_num, HG_HITBOX_TYPE, 0);
set_hitbox_value(attack, hitbox_num, HG_WINDOW, 0);
set_hitbox_value(attack, hitbox_num, HG_WINDOW_CREATION_FRAME, 0);
set_hitbox_value(attack, hitbox_num, HG_LIFETIME, 0);
set_hitbox_value(attack, hitbox_num, HG_HITBOX_X, 0);
set_hitbox_value(attack, hitbox_num, HG_HITBOX_Y, 0);
set_hitbox_value(attack, hitbox_num, HG_WIDTH, 0);
set_hitbox_value(attack, hitbox_num, HG_HEIGHT, 0);
set_hitbox_value(attack, hitbox_num, HG_SHAPE, 0);
set_hitbox_value(attack, hitbox_num, HG_PRIORITY, 0);
set_hitbox_value(attack, hitbox_num, HG_DAMAGE, 0);
set_hitbox_value(attack, hitbox_num, HG_ANGLE, 0);
set_hitbox_value(attack, hitbox_num, HG_BASE_KNOCKBACK, 0);
set_hitbox_value(attack, hitbox_num, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(attack, hitbox_num, HG_EFFECT, 0);
set_hitbox_value(attack, hitbox_num, HG_BASE_HITPAUSE, 0);
set_hitbox_value(attack, hitbox_num, HG_HITPAUSE_SCALING, 0);
set_hitbox_value(attack, hitbox_num, HG_VISUAL_EFFECT, 0);
set_hitbox_value(attack, hitbox_num, HG_VISUAL_EFFECT_X_OFFSET, 0);
set_hitbox_value(attack, hitbox_num, HG_VISUAL_EFFECT_Y_OFFSET, 0);
set_hitbox_value(attack, hitbox_num, HG_HIT_SFX, 0);
set_hitbox_value(attack, hitbox_num, HG_ANGLE_FLIPPER, 0);
set_hitbox_value(attack, hitbox_num, HG_EXTRA_HITPAUSE, 0);
set_hitbox_value(attack, hitbox_num, HG_GROUNDEDNESS, 0);
set_hitbox_value(attack, hitbox_num, HG_EXTRA_CAMERA_SHAKE, 0);
set_hitbox_value(attack, hitbox_num, HG_IGNORES_PROJECTILES, 0);
set_hitbox_value(attack, hitbox_num, HG_HIT_LOCKOUT, 0);
set_hitbox_value(attack, hitbox_num, HG_EXTENDED_PARRY_STUN, 0);
set_hitbox_value(attack, hitbox_num, HG_HITBOX_GROUP, 0);
set_hitbox_value(attack, hitbox_num, HG_HITSTUN_MULTIPLIER, 0);
set_hitbox_value(attack, hitbox_num, HG_DRIFT_MULTIPLIER, 0);
set_hitbox_value(attack, hitbox_num, HG_SDI_MULTIPLIER, 0);
set_hitbox_value(attack, hitbox_num, HG_TECHABLE, 0);
set_hitbox_value(attack, hitbox_num, HG_FORCE_FLINCH, 0);
set_hitbox_value(attack, hitbox_num, HG_FINAL_BASE_KNOCKBACK , 0);
set_hitbox_value(attack, hitbox_num, HG_THROWS_ROCK, 0);

//projectile properties
set_hitbox_value(attack, hitbox_num, HG_PROJECTILE_SPRITE, 0);
set_hitbox_value(attack, hitbox_num, HG_PROJECTILE_MASK, 0);
set_hitbox_value(attack, hitbox_num, HG_PROJECTILE_ANIM_SPEED, 0);
set_hitbox_value(attack, hitbox_num, HG_PROJECTILE_HSPEED, 0);
set_hitbox_value(attack, hitbox_num, HG_PROJECTILE_VSPEED, 0);
set_hitbox_value(attack, hitbox_num, HG_PROJECTILE_GRAVITY, 0);
set_hitbox_value(attack, hitbox_num, HG_PROJECTILE_GROUND_FRICTION, 0);
set_hitbox_value(attack, hitbox_num, HG_PROJECTILE_AIR_FRICTION, 0);
set_hitbox_value(attack, hitbox_num, HG_PROJECTILE_WALL_BEHAVIOR, 0);
set_hitbox_value(attack, hitbox_num, HG_PROJECTILE_GROUND_BEHAVIOR, 0);
set_hitbox_value(attack, hitbox_num, HG_PROJECTILE_ENEMY_BEHAVIOR, 0);
set_hitbox_value(attack, hitbox_num, HG_PROJECTILE_LIFESPAN, 0);
set_hitbox_value(attack, hitbox_num, HG_PROJECTILE_PARRY_STUN, 0);
set_hitbox_value(attack, hitbox_num, HG_PROJECTILE_DOES_NOT_REFLECT, 0);
set_hitbox_value(attack, hitbox_num, HG_PROJECTILE_IS_TRANSCENDENT, 0);
set_hitbox_value(attack, hitbox_num, HG_PROJECTILE_DESTROY_EFFECT, 0);
*/