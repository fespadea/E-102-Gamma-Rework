//draw_hud

//Dspecial HUD
draw_sprite(sprite_get("dspecial_bars"), 0, temp_x, temp_y);
if(move_cooldown[AT_DSPECIAL])
    draw_sprite_ext(sprite_get("dspecial_cooldown"), 0, temp_x + 33, temp_y-40, move_cooldown[AT_DSPECIAL]*57/80, 1, 0, -1, 1);
if(mine_charge)
    draw_sprite_ext(sprite_get("dspecial_charge"), 0, temp_x + 33, temp_y-18, mine_charge*73/100, 1, 0, -1, 1);
draw_sprite(sprite_get("dspecial_logo"), 0, temp_x, temp_y);