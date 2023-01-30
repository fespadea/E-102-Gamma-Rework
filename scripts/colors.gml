// code for unlimited Alts
with asset_get("cs_playerbg_obj"){
    if(player == get_instance_player(other)){
        unlimitedAltEvent = "colors";
        user_event(0);
    }
}

// DEFAULT COLOR

// Metal
set_color_profile_slot( 0, 0, 32, 32, 32 );
set_color_profile_slot_range( 0, 151, 43, 88 );

// Main Bright
set_color_profile_slot( 0, 1, 248, 32, 0 );
set_color_profile_slot_range( 1, 2, 56, 61 );

// Accessory Bright
set_color_profile_slot( 0, 2, 248, 200, 56 );
set_color_profile_slot_range( 2, 1, 34, 56 );

// Eyes
set_color_profile_slot( 0, 3, 56, 192, 0 );
set_color_profile_slot_range( 3, 1, 74, 26 );

// Light Strip
set_color_profile_slot( 0, 4, 20, 168, 255 );
set_color_profile_slot_range( 4, 1, 29, 1 );


// ALTERNATE COLORS
set_num_palettes( 49 );

// E-101 Beta
set_color_profile_slot( 1, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 1, 1, 77, 77, 77 ); //Main Bright
set_color_profile_slot( 1, 2, 248, 200, 56 ); //Accessory Bright
set_color_profile_slot( 1, 3, 56, 192, 0 ); //Eyes
set_color_profile_slot( 1, 4, 20, 168, 255 ); //Light Strip

// E-103 Delta
set_color_profile_slot( 2, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 2, 1, 0, 34, 255 ); //Main Bright
set_color_profile_slot( 2, 2, 248, 200, 56 ); //Accessory Bright
set_color_profile_slot( 2, 3, 56, 192, 0 ); //Eyes
set_color_profile_slot( 2, 4, 20, 168, 255 ); //Light Strip

// E-104 Epsilon
set_color_profile_slot( 3, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 3, 1, 248, 117, 0 ); //Main Bright
set_color_profile_slot( 3, 2, 248, 200, 56 ); //Accessory Bright
set_color_profile_slot( 3, 3, 56, 192, 0 ); //Eyes
set_color_profile_slot( 3, 4, 20, 168, 255 ); //Light Strip

// E-105 Zeta
set_color_profile_slot( 4, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 4, 1, 95, 0, 156 ); //Main Bright
set_color_profile_slot( 4, 2, 248, 200, 56 ); //Accessory Bright
set_color_profile_slot( 4, 3, 56, 192, 0 ); //Eyes
set_color_profile_slot( 4, 4, 20, 168, 255 ); //Light Strip

// E-100 Alpha (Zero
set_color_profile_slot( 5, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 5, 1, 0, 168, 16 ); //Main Bright
set_color_profile_slot( 5, 2, 248, 32, 0 ); //Accessory Bright
set_color_profile_slot( 5, 3, 56, 192, 0 ); //Eyes
set_color_profile_slot( 5, 4, 20, 168, 255 ); //Light Strip

// E-106 Eta
set_color_profile_slot( 6, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 6, 1, 174, 209, 215 ); //Main Bright
set_color_profile_slot( 6, 2, 249, 240, 199 ); //Accessory Bright
set_color_profile_slot( 6, 3, 161, 109, 96 ); //Eyes
set_color_profile_slot( 6, 4, 20, 168, 255 ); //Light Strip

// E-107 Theta
set_color_profile_slot( 7, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 7, 1, 158, 207, 212 ); //Main Bright
set_color_profile_slot( 7, 2, 248, 200, 56 ); //Accessory Bright
set_color_profile_slot( 7, 3, 224, 0, 8 ); //Eyes
set_color_profile_slot( 7, 4, 20, 168, 255 ); //Light Strip

// E-108 Iota
set_color_profile_slot( 8, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 8, 1, 95, 126, 148 ); //Main Bright
set_color_profile_slot( 8, 2, 248, 200, 56 ); //Accessory Bright
set_color_profile_slot( 8, 3, 56, 192, 0 ); //Eyes
set_color_profile_slot( 8, 4, 20, 168, 255 ); //Light Strip

// E-109 Kappa
set_color_profile_slot( 9, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 9, 1, 67, 157, 83 ); //Main Bright
set_color_profile_slot( 9, 2, 248, 200, 56 ); //Accessory Bright
set_color_profile_slot( 9, 3, 56, 192, 0 ); //Eyes
set_color_profile_slot( 9, 4, 20, 168, 255 ); //Light Strip

// E-110 Lambda
set_color_profile_slot( 10, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 10, 1, 238, 197, 167 ); //Main Bright
set_color_profile_slot( 10, 2, 248, 200, 56 ); //Accessory Bright
set_color_profile_slot( 10, 3, 56, 192, 0 ); //Eyes
set_color_profile_slot( 10, 4, 20, 168, 255 ); //Light Strip

// E-113 Xi
set_color_profile_slot( 11, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 11, 1, 255, 183, 0 ); //Main Bright
set_color_profile_slot( 11, 2, 248, 210, 56 ); //Accessory Bright
set_color_profile_slot( 11, 3, 185, 255, 99 ); //Eyes
set_color_profile_slot( 11, 4, 20, 168, 255 ); //Light Strip

// E-118 Tau
set_color_profile_slot( 12, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 12, 1, 178, 80, 141 ); //Main Bright
set_color_profile_slot( 12, 2, 178, 80, 141 ); //Accessory Bright
set_color_profile_slot( 12, 3, 56, 192, 0 ); //Eyes
set_color_profile_slot( 12, 4, 20, 168, 255 ); //Light Strip

// E-121 Phi
set_color_profile_slot( 13, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 13, 1, 111, 111, 111 ); //Main Bright
set_color_profile_slot( 13, 2, 208, 208, 208 ); //Accessory Bright
set_color_profile_slot( 13, 3, 144, 128, 40 ); //Eyes
set_color_profile_slot( 13, 4, 20, 168, 255 ); //Light Strip

// E-123 Omega
set_color_profile_slot( 14, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 14, 1, 145, 19, 0 ); //Main Bright
set_color_profile_slot( 14, 2, 255, 191, 0 ); //Accessory Bright
set_color_profile_slot( 14, 3, 255, 70, 54 ); //Eyes
set_color_profile_slot( 14, 4, 20, 168, 255 ); //Light Strip

// Egg Keeper
set_color_profile_slot( 15, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 15, 1, 107, 131, 176 ); //Main Bright
set_color_profile_slot( 15, 2, 207, 207, 207 ); //Accessory Bright
set_color_profile_slot( 15, 3, 0, 255, 255 ); //Eyes
set_color_profile_slot( 15, 4, 20, 168, 255 ); //Light Strip

// Egg-Genesis
set_color_profile_slot( 16, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 16, 1, 186, 88, 19 ); //Main Bright
set_color_profile_slot( 16, 2, 212, 114, 44 ); //Accessory Bright
set_color_profile_slot( 16, 3, 56, 192, 0 ); //Eyes
set_color_profile_slot( 16, 4, 20, 168, 255 ); //Light Strip

// Decoe
set_color_profile_slot( 17, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 17, 1, 250, 235, 116 ); //Main Bright
set_color_profile_slot( 17, 2, 250, 235, 116 ); //Accessory Bright
set_color_profile_slot( 17, 3, 199, 44, 83 ); //Eyes
set_color_profile_slot( 17, 4, 20, 168, 255 ); //Light Strip

// Bocoe
set_color_profile_slot( 18, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 18, 1, 210, 204, 219 ); //Main Bright
set_color_profile_slot( 18, 2, 210, 204, 219 ); //Accessory Bright
set_color_profile_slot( 18, 3, 40, 111, 162 ); //Eyes
set_color_profile_slot( 18, 4, 20, 168, 255 ); //Light Strip

// E-51 Intelligente
set_color_profile_slot( 19, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 19, 1, 155, 213, 203 ); //Main Bright
set_color_profile_slot( 19, 2, 112, 148, 179 ); //Accessory Bright
set_color_profile_slot( 19, 3, 230, 231, 128 ); //Eyes
set_color_profile_slot( 19, 4, 20, 168, 255 ); //Light Strip

// E-77 Lucky
set_color_profile_slot( 20, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 20, 1, 235, 209, 9 ); //Main Bright
set_color_profile_slot( 20, 2, 240, 217, 234 ); //Accessory Bright
set_color_profile_slot( 20, 3, 129, 89, 196 ); //Eyes
set_color_profile_slot( 20, 4, 20, 168, 255 ); //Light Strip

// Orbot
set_color_profile_slot( 21, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 21, 1, 57, 57, 57 ); //Main Bright
set_color_profile_slot( 21, 2, 251, 25, 0 ); //Accessory Bright
set_color_profile_slot( 21, 3, 146, 255, 255 ); //Eyes
set_color_profile_slot( 21, 4, 20, 168, 255 ); //Light Strip

// Cubot
set_color_profile_slot( 22, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 22, 1, 57, 57, 57 ); //Main Bright
set_color_profile_slot( 22, 2, 255, 214, 0 ); //Accessory Bright
set_color_profile_slot( 22, 3, 146, 255, 255 ); //Eyes
set_color_profile_slot( 22, 4, 20, 168, 255 ); //Light Strip

// E-2000R
set_color_profile_slot( 23, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 23, 1, 158, 155, 63 ); //Main Bright
set_color_profile_slot( 23, 2, 177, 72, 71 ); //Accessory Bright
set_color_profile_slot( 23, 3, 209, 209, 31 ); //Eyes
set_color_profile_slot( 23, 4, 20, 168, 255 ); //Light Strip

// Egg Breaker
set_color_profile_slot( 24, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 24, 1, 199, 33, 17 ); //Main Bright
set_color_profile_slot( 24, 2, 76, 124, 184 ); //Accessory Bright
set_color_profile_slot( 24, 3, 43, 115, 52 ); //Eyes
set_color_profile_slot( 24, 4, 20, 168, 255 ); //Light Strip

// Dark Oak
set_color_profile_slot( 25, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 25, 1, 70, 56, 90 ); //Main Bright
set_color_profile_slot( 25, 2, 185, 187, 216 ); //Accessory Bright
set_color_profile_slot( 25, 3, 14, 51, 16 ); //Eyes
set_color_profile_slot( 25, 4, 20, 168, 255 ); //Light Strip

// Red Pine
set_color_profile_slot( 26, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 26, 1, 133, 44, 44 ); //Main Bright
set_color_profile_slot( 26, 2, 135, 56, 57 ); //Accessory Bright
set_color_profile_slot( 26, 3, 236, 108, 69 ); //Eyes
set_color_profile_slot( 26, 4, 20, 168, 255 ); //Light Strip

// Black Narcissus
set_color_profile_slot( 27, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 27, 1, 53, 58, 70 ); //Main Bright
set_color_profile_slot( 27, 2, 49, 55, 66 ); //Accessory Bright
set_color_profile_slot( 27, 3, 12, 12, 12 ); //Eyes
set_color_profile_slot( 27, 4, 20, 168, 255 ); //Light Strip

// Pale Bayleaf
set_color_profile_slot( 28, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 28, 1, 88, 115, 104 ); //Main Bright
set_color_profile_slot( 28, 2, 98, 128, 115 ); //Accessory Bright
set_color_profile_slot( 28, 3, 19, 57, 89 ); //Eyes
set_color_profile_slot( 28, 4, 20, 168, 255 ); //Light Strip

// Yellow Zelkova
set_color_profile_slot( 29, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 29, 1, 207, 149, 0 ); //Main Bright
set_color_profile_slot( 29, 2, 163, 163, 131 ); //Accessory Bright
set_color_profile_slot( 29, 3, 13, 86, 0 ); //Eyes
set_color_profile_slot( 29, 4, 20, 168, 255 ); //Light Strip

// Bokkun
set_color_profile_slot( 30, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 30, 1, 31, 28, 61 ); //Main Bright
set_color_profile_slot( 30, 2, 77, 64, 143 ); //Accessory Bright
set_color_profile_slot( 30, 3, 232, 255, 113 ); //Eyes
set_color_profile_slot( 30, 4, 20, 168, 255 ); //Light Strip

// Omochao
set_color_profile_slot( 31, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 31, 1, 67, 102, 177 ); //Main Bright
set_color_profile_slot( 31, 2, 177, 218, 241 ); //Accessory Bright
set_color_profile_slot( 31, 3, 219, 135, 20 ); //Eyes
set_color_profile_slot( 31, 4, 20, 168, 255 ); //Light Strip

// Scratch
set_color_profile_slot( 32, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 32, 1, 121, 121, 151 ); //Main Bright
set_color_profile_slot( 32, 2, 139, 150, 228 ); //Accessory Bright
set_color_profile_slot( 32, 3, 17, 20, 3 ); //Eyes
set_color_profile_slot( 32, 4, 20, 168, 255 ); //Light Strip

// Grounder
set_color_profile_slot( 33, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 33, 1, 47, 117, 132 ); //Main Bright
set_color_profile_slot( 33, 2, 39, 133, 130 ); //Accessory Bright
set_color_profile_slot( 33, 3, 17, 20, 3 ); //Eyes
set_color_profile_slot( 33, 4, 20, 168, 255 ); //Light Strip

// Heavy
set_color_profile_slot( 34, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 34, 1, 166, 178, 201 ); //Main Bright
set_color_profile_slot( 34, 2, 166, 178, 201 ); //Accessory Bright
set_color_profile_slot( 34, 3, 129, 162, 169 ); //Eyes
set_color_profile_slot( 34, 4, 20, 168, 255 ); //Light Strip

// Bomb
set_color_profile_slot( 35, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 35, 1, 220, 49, 50 ); //Main Bright
set_color_profile_slot( 35, 2, 78, 102, 108 ); //Accessory Bright
set_color_profile_slot( 35, 3, 166, 178, 203 ); //Eyes
set_color_profile_slot( 35, 4, 20, 168, 255 ); //Light Strip

// Abyss
set_color_profile_slot( 36, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 36, 1, 79, 61, 94 ); //Main Bright
set_color_profile_slot( 36, 2, 220, 113, 255 ); //Accessory Bright
set_color_profile_slot( 36, 3, 255, 127, 0 ); //Eyes
set_color_profile_slot( 36, 4, 78, 23, 141 ); //Light Strip

// Early Access
set_color_profile_slot( 37, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 37, 1, 83, 122, 62 ); //Main Bright
set_color_profile_slot( 37, 2, 167, 186, 74 ); //Accessory Bright
set_color_profile_slot( 37, 3, 211, 226, 154 ); //Eyes
set_color_profile_slot( 37, 4, 35, 67, 49 ); //Light Strip

// Rainbow
set_color_profile_slot( 38, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 38, 1, 248, 32, 0 ); //Main Bright
set_color_profile_slot( 38, 2, 248, 200, 56 ); //Accessory Bright
set_color_profile_slot( 38, 3, 56, 192, 0 ); //Eyes
set_color_profile_slot( 38, 4, 20, 168, 255 ); //Light Strip

// Random
set_color_profile_slot( 39, 0, 255, 255, 255 ); //Metal
set_color_profile_slot( 39, 1, 255, 255, 255 ); //Main Bright
set_color_profile_slot( 39, 2, 255, 255, 255 ); //Accessory Bright
set_color_profile_slot( 39, 3, 255, 255, 255 ); //Eyes
set_color_profile_slot( 39, 4, 255, 255, 255 ); //Light Strip

// Random Alt On Hit
set_color_profile_slot( 40, 0, 255, 255, 255 ); //Metal
set_color_profile_slot( 40, 1, 255, 255, 255 ); //Main Bright
set_color_profile_slot( 40, 2, 255, 255, 255 ); //Accessory Bright
set_color_profile_slot( 40, 3, 255, 255, 255 ); //Eyes
set_color_profile_slot( 40, 4, 255, 255, 255 ); //Light Strip

// Wireframe
set_color_profile_slot( 41, 0, 32, 32, 32 ); //Metal
set_color_profile_slot( 41, 1, 248, 32, 0 ); //Main Bright
set_color_profile_slot( 41, 2, 248, 200, 56 ); //Accessory Bright
set_color_profile_slot( 41, 3, 56, 192, 0 ); //Eyes
set_color_profile_slot( 41, 4, 20, 168, 255 ); //Light Strip

// Random Rainbow
set_color_profile_slot( 42, 0, 255, 255, 255 ); //Metal
set_color_profile_slot( 42, 1, 255, 255, 255 ); //Main Bright
set_color_profile_slot( 42, 2, 255, 255, 255 ); //Accessory Bright
set_color_profile_slot( 42, 3, 255, 255, 255 ); //Eyes
set_color_profile_slot( 42, 4, 255, 255, 255 ); //Light Strip

// True Random
set_color_profile_slot( 43, 0, 255, 255, 255 ); //Metal
set_color_profile_slot( 43, 1, 255, 255, 255 ); //Main Bright
set_color_profile_slot( 43, 2, 255, 255, 255 ); //Accessory Bright
set_color_profile_slot( 43, 3, 255, 255, 255 ); //Eyes
set_color_profile_slot( 43, 4, 255, 255, 255 ); //Light Strip

// True Random Alt On Hit
set_color_profile_slot( 44, 0, 255, 255, 255 ); //Metal
set_color_profile_slot( 44, 1, 255, 255, 255 ); //Main Bright
set_color_profile_slot( 44, 2, 255, 255, 255 ); //Accessory Bright
set_color_profile_slot( 44, 3, 255, 255, 255 ); //Eyes
set_color_profile_slot( 44, 4, 255, 255, 255 ); //Light Strip

// True Random Rainbow
set_color_profile_slot( 45, 0, 255, 255, 255 ); //Metal
set_color_profile_slot( 45, 1, 255, 255, 255 ); //Main Bright
set_color_profile_slot( 45, 2, 255, 255, 255 ); //Accessory Bright
set_color_profile_slot( 45, 3, 255, 255, 255 ); //Eyes
set_color_profile_slot( 45, 4, 255, 255, 255 ); //Light Strip

// Full Random
set_color_profile_slot( 46, 0, 255, 255, 255 ); //Metal
set_color_profile_slot( 46, 1, 255, 255, 255 ); //Main Bright
set_color_profile_slot( 46, 2, 255, 255, 255 ); //Accessory Bright
set_color_profile_slot( 46, 3, 255, 255, 255 ); //Eyes
set_color_profile_slot( 46, 4, 255, 255, 255 ); //Light Strip

// Full Random Alt On Hit
set_color_profile_slot( 47, 0, 255, 255, 255 ); //Metal
set_color_profile_slot( 47, 1, 255, 255, 255 ); //Main Bright
set_color_profile_slot( 47, 2, 255, 255, 255 ); //Accessory Bright
set_color_profile_slot( 47, 3, 255, 255, 255 ); //Eyes
set_color_profile_slot( 47, 4, 255, 255, 255 ); //Light Strip

// Full Random Rainbow
set_color_profile_slot( 48, 0, 255, 255, 255 ); //Metal
set_color_profile_slot( 48, 1, 255, 255, 255 ); //Main Bright
set_color_profile_slot( 48, 2, 255, 255, 255 ); //Accessory Bright
set_color_profile_slot( 48, 3, 255, 255, 255 ); //Eyes
set_color_profile_slot( 48, 4, 255, 255, 255 ); //Light Strip


/* This is a comment used by that one RoA colors.gml generator tool to store palette data. You can safely keep it in your colors.gml if you plan to re-use the tool later, or safely remove it if you don't.
=== BEGIN JSON PALETTE ===
{"formatversion":1,"data":[{"name":"Metal","colors":[{"r":32,"g":32,"b":32,"main":true},{"r":56,"g":64,"b":96},{"r":112,"g":120,"b":128},{"r":176,"g":176,"b":176},{"r":255,"g":255,"b":255}]},{"name":"Main Bright","colors":[{"r":"248","g":"32","b":"0","main":true},{"r":247,"g":149,"b":136},{"r":153,"g":17,"b":0},{"r":94,"g":11,"b":0}]},{"name":"Accessory Bright","colors":[{"r":"248","g":"200","b":"56","main":true},{"r":193,"g":150,"b":21},{"r":244,"g":217,"b":137},{"r":107,"g":83,"b":11}]},{"name":"Eyes","colors":[{"r":"56","g":"192","b":"0","main":true},{"r":206,"g":255,"b":186}]},{"name":"Light Strip","colors":[{"r":20,"g":168,"b":255,"main":true},{"r":91,"g":195,"b":255}]}]}
=== END JSON PALETTE ===
*/
