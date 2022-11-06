//draw_hud

//Dspecial HUD
draw_sprite(dspecialBarsSprite, 0, temp_x-15, temp_y);
if(move_cooldown[AT_DSPECIAL])
    draw_sprite_ext(dspecialCooldownSprite, 0, temp_x + 18, temp_y-22, move_cooldown[AT_DSPECIAL]*37/80, 1, 0, -1, 1);
if(mine_charge)
    draw_sprite_ext(dspecialChargeSprite, 0, temp_x + 18, temp_y-10, mine_charge*53/100, 1, 0, -1, 1);
draw_sprite(dspecialLogoSprite, 0, temp_x-15, temp_y);