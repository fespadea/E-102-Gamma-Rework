//draw_hud

//Dspecial HUD
draw_sprite(sprite_get("dspecial_bars"), 0, temp_x, temp_y);
if(move_cooldown[AT_DSPECIAL])
    draw_sprite_ext(sprite_get("dspecial_cooldown"), 0, temp_x + 16, temp_y-20, move_cooldown[AT_DSPECIAL]*56/80, 1, 0, -1, 1);
if(mine_charge)
    draw_sprite_ext(sprite_get("dspecial_charge"), 0, temp_x + 16, temp_y-9, mine_charge*72/100, 1, 0, -1, 1);
draw_sprite(sprite_get("dspecial_logo"), 0, temp_x, temp_y);