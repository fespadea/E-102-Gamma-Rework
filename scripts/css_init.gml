// css init

// player is set to 0 online
onlineCSS = player == 0; // true if on the online CSS



/*
These are the variables to decide which bits of the synced variable you want to dedicate
to allowing more alts (from bit 0 to 31). You likely aren't using this if you don't 
know what it is, so you don't need to touch it if you don't. [Edit necessary]
*/
FIRST_BIT_UNLIMITED = 0;
LAST_BIT_UNLIMITED = 31;

// get selected unlimited alt
if(init == 1 || "markLoaded" in self){
    unlimitedAlt = 0;
    updateUnlimitedAlt();
} else{
    unlimitedAlt = split_synced_var(FIRST_BIT_UNLIMITED, LAST_BIT_UNLIMITED-FIRST_BIT_UNLIMITED+1, 31-LAST_BIT_UNLIMITED)[1];
}
prevAlt = get_player_color(player);
init_shader();
markLoaded = 0;

// base x and y values
temp_x = x + 8;
temp_y = y + 9;

// css UI sprites
cssUnlimitedScrollButton = sprite_get("css_unlimited_scroll_button");
sprite_change_offset( "css_unlimited_scroll_button", 0,  0);
cssUnlimitedScrollButtonDivision = sprite_get("css_unlimited_scroll_button_division");
sprite_change_offset( "css_unlimited_scroll_button_division", 0,  0);

holdUnlimitedUpButton = false;
holdUnlimitedDownButton = false;
altSwitchSound = asset_get("mfx_change_color");

unlimitedUpButtonX = temp_x+182;
unlimitedUpButtonY = temp_y+88;
unlimitedDownButtonX = unlimitedUpButtonX;
unlimitedDownButtonY = unlimitedUpButtonY+34;

//Alt names [Edit necessary]
altName = [];
i = 0;
altName[i++]  = "E-102 Gamma";
altName[i++]  = "E-101 Beta";
altName[i++]  = "E-103 Delta";
altName[i++]  = "E-104 Epsilon";
altName[i++]  = "E-105 Zeta";
altName[i++]  = "E-100 Alpha (ZERO)";
altName[i++]  = "E-106 Eta";
altName[i++]  = "E-108 Iota";
altName[i++]  = "E-109 Kappa";
altName[i++]  = "E-110 Lambda";
altName[i++] = "E-113 Xi";
altName[i++] = "E-118 Tau";
altName[i++] = "E-121 Phi";
altName[i++] = "E-123 Omega";
altName[i++] = "Egg Keeper";
altName[i++] = "Egg Genesis";
altName[i++] = "Decoe";
altName[i++] = "Bocoe";
altName[i++] = "E-51 Intelligente";
altName[i++] = "E-77 Lucky";
altName[i++] = "Obot";
altName[i++] = "Cubot";
altName[i++] = "E-2000R";
altName[i++] = "Egg Breaker";
altName[i++] = "Dark Oak";
altName[i++] = "Red Pine";
altName[i++] = "Black Narcissus";
altName[i++] = "Pale Bayleaf";
altName[i++] = "Yellow Zelkova";
altName[i++] = "Bokkun";
altName[i++] = "Omochao";
altName[i++] = "Scratch";
altName[i++] = "Grounder";
altName[i++] = "Heavy";
altName[i++] = "Bomb";
altName[i++] = "Abyss";
altName[i++] = "Early Access";
altName[i++] = "Rainbow";
altName[i++] = "Wireframe";
altName[array_length(altName)]  = "Random"; // Only put as many names as you have alts




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