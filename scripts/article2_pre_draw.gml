// article 2 pre draw

if(!instance_exists(birdHitbox)){
    instance_destroy();
} else{
    gpu_push_state();
    gpu_set_fog(true, get_player_hud_color(player), 0, 0);
    draw_sprite_ext(birdHitbox.sprite_index, birdHitbox.image_index, birdHitbox.x, birdHitbox.y, 1.3*birdHitbox.spr_dir, 1.3, 0, get_player_hud_color(player), 0.25);
    gpu_pop_state();
}