// css update

cpu_hover_update();

var curGameAlt = get_player_color(player); // the current base game alt
unlimitedAlt = split_synced_var(FIRST_BIT_UNLIMITED, LAST_BIT_UNLIMITED-FIRST_BIT_UNLIMITED+1, 31-LAST_BIT_UNLIMITED)[1]; // the currently selected alt

if(curGameAlt != prevAlt){ // you switched alt
    if((curGameAlt > prevAlt && curGameAlt < prevAlt + 8) || curGameAlt < prevAlt - 8){ // You increased your alt. This accounts for going from the highest alt to the smallest alt and skipping alts because of other players.
        unlimitedAlt++; // increase your unlimited alt
        if(unlimitedAlt == array_length(altName)){ // if you've passed the number of unlimited alts you have
            unlimitedAlt = 0; // reset your unlimited alt to the default alt
        }

    } else{ // You decreased your alt. This accounts for going from the smallest alt to the highest alt and skipping alts because of other players.
        if(unlimitedAlt == 0){ // if you're the smallest unlimited alt
            unlimitedAlt = array_length(altName); // set the current alt to the number of alts you have (this will get decreased since you start counting alts at 0)
        }
        unlimitedAlt--; // decrease your unlimited alt
    }
    prevAlt = curGameAlt;
    updateUnlimitedAlt();
}
// You don't need this if you don't have a rainbow alt [Edit optional]
// rainbow alt [Edit necessary]
#macro RAINBOW_ALT 38
if(unlimitedAlt == RAINBOW_ALT){
    init_shader(); // run init_shader to update the hue
}


if (player == 0){ // got this from Lilac which I think got it from Dr. Flux
    unlimitedRowButtonX = temp_x + 172;
    unlimitedRowButtonY = temp_y + 30;
} else{
    if (get_player_hud_color(player) == 8421504)
    {
        unlimitedRowButtonX = temp_x + 52;
        unlimitedRowButtonY = temp_y + 169;
    }
    else
    {
        unlimitedRowButtonX = temp_x + 67;
        unlimitedRowButtonY = temp_y + 169;
    }
}

if(get_instance_x(cursor_id) >= unlimitedRowButtonX && get_instance_x(cursor_id) <= unlimitedRowButtonX + sprite_get_width(cssUnlimitedRowButton) 
	&& get_instance_y(cursor_id) >= unlimitedRowButtonY && get_instance_y(cursor_id) <= unlimitedRowButtonY + sprite_get_height(cssUnlimitedRowButton)){
    hoverUnlimitedRowButton = true;
    suppress_cursor = true;
    if(menu_a_pressed){
        if(!holdUnlimitedRowButton){
            holdUnlimitedRowButton = true;
            sound_play(altSwitchSound);
            unlimitedAlt += 16;
            if(unlimitedAlt >= array_length(altName)){
                unlimitedAlt = unlimitedAlt % 16;
            }
            updateUnlimitedAlt();
        }
    } else if(menu_b_pressed){
        if(!holdUnlimitedRowButton){
            holdUnlimitedRowButton = true;
            sound_play(altSwitchSound);
            unlimitedAlt -= 16;
            if(unlimitedAlt < 0){
                while(unlimitedAlt+16 < array_length(altName)){ // could not think of better math cause dumb
                    unlimitedAlt += 16;
                }
            }
            updateUnlimitedAlt();
        }
    } else if(menu_rb_pressed){
        if(!holdUnlimitedRowButton){
            holdUnlimitedRowButton = true;
            sound_play(altSwitchSound);
            unlimitedAlt++;
            if(unlimitedAlt == array_length(altName)){
                unlimitedAlt = 0;
            }
            updateUnlimitedAlt();
        }
    } else if(menu_lb_pressed){
        if(!holdUnlimitedRowButton){
            holdUnlimitedRowButton = true;
            sound_play(altSwitchSound);
            if(unlimitedAlt == 0){
                unlimitedAlt = array_length(altName); 
            }
            unlimitedAlt--;
            updateUnlimitedAlt();
        }
    }else if(!menu_a_down && !menu_b_down && !menu_lb_down && !menu_rb_down ){
        holdUnlimitedRowButton = false;
    }
} else{
    holdUnlimitedRowButton = false;
    hoverUnlimitedRowButton = false;
    suppress_cursor = false;
}

#define updateUnlimitedAlt
var syncedVar = get_synced_var(player);
var newSyncedVar = 0;
newSyncedVar += syncedVar >> (LAST_BIT_UNLIMITED+1) << (LAST_BIT_UNLIMITED+1);
newSyncedVar += (unlimitedAlt & ((1 << (LAST_BIT_UNLIMITED-FIRST_BIT_UNLIMITED+1))-1)) << FIRST_BIT_UNLIMITED;
newSyncedVar += syncedVar & ((1 << (FIRST_BIT_UNLIMITED))-1);
set_synced_var(player, newSyncedVar);
init_shader();


#define split_synced_var
///args chunk_lengths...
var num_chunks = argument_count;
var chunk_arr = array_create(argument_count);
var synced_var = get_synced_var(player);
var chunk_offset = 0
for (var i = 0; i < num_chunks; i++) {
    var chunk_len = argument[i]; //print(chunk_len);
    var chunk_mask = (1 << chunk_len)-1
    chunk_arr[i] = (synced_var >> chunk_offset) & chunk_mask;
    //print(`matching shift = ${chunk_len}`);
    chunk_offset += chunk_len;
}
// print(chunk_arr);
return chunk_arr;

#define cpu_hover_update()
var p = player;
var is_cpu = (get_player_hud_color(p) == 8421504);

if (is_cpu) {
    var pb = plate_bounds, cs = cursors;
    if (cpu_is_hovered) {
        var c = cs[@cpu_hovering_player]
        cursor_id = c;
        var cx = get_instance_x(c),
            cy = get_instance_y(c);
        if (cpu_hover_time < 10) cpu_hover_time++;
        if (cpu_color_swap_time < 5) cpu_color_swap_time++;
        if (cx != clamp(cx, pb[0],pb[2]) || cy != clamp(cy, pb[1],pb[3])) {
            cpu_is_hovered = false;
            c = cs[@p];
            cursor_id = c;
        }
    } else {
        var hplayer = get_new_hovering_player();
        if (cpu_hover_time > 0) cpu_hover_time--;
        if (hplayer != -1) {
            cpuh_new_color = get_player_hud_color(hplayer);
            if (cpu_hover_time > 0) {
                cpuh_prev_color = get_player_hud_color(cpu_hovering_player);
                cpu_color_swap_time = 0;
            } else { //if the player indicator is not being displayed already
                cpuh_prev_color = cpuh_new_color;
                cpu_color_swap_time = 10;
            }
            cpu_is_hovered = true;
            cpu_hovering_player = hplayer;
            cursor_id = cs[@hplayer];
        }
    }
} else {
    cursor_id = cursors[player];
    cpu_is_hovered = false;
    cpu_hover_time = 0;
}

#define get_new_hovering_player()
var pb = plate_bounds, cs = cursors;
for (var i = 1; i <= 4; i++) {
    var c = cs[@i];
    var cx = get_instance_x(c);
    var cy = get_instance_y(c);
    if cx == clamp(cx, pb[@0], pb[@2]) && cy == clamp(cy, pb[@1], pb[@3]) {
        return i;
    } 
}
return -1;