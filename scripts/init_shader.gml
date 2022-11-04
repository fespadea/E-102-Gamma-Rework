// init shader

// set this to the number of color rows you use (Rivals has a max of 8)
#macro NUM_COLOR_ROWS 8

// Special Alts
// #macro RANDOM_ALT 33 (I've decided to always just make Random the last alt)
#macro EA_ALT 17
#macro RAINBOW_ALT 18
#macro WIREFRAME_ALT 19

/*
I don't want this to break on the SSS, and I think checking if you're on the SSS would be more 
expensive than just making this variable every time this runs.
*/
/*
These are the macros to decide which bits of the synced variable you want to dedicate
to allowing more alts (from bit 0 to 31). These should match what you put in css_init.gml.
[Edit necessary]
*/
#macro FIRST_BIT_UNLIMITED 0
#macro LAST_BIT_UNLIMITED 31
var unlimitedAlt = split_synced_var(FIRST_BIT_UNLIMITED, LAST_BIT_UNLIMITED-FIRST_BIT_UNLIMITED+1, 31-LAST_BIT_UNLIMITED)[1];

// You can get rid of this part if none of your alts change the default shading [Edit optional]
// set the shading of the color slots
if(unlimitedAlt == EA_ALT){ // EA alt (change this to check for whichever of your alts have no shading) [Edit necessary]
    // set shading to 0 for every color slot
    for(var i = 0; i < 8; i++){
        set_character_color_shading(i, 0);
    }
} else{ // normal alt
    // set shading to normal for every color slot
    for(var i = 0; i < 8; i++){
        set_character_color_shading(i, 1);
    }
}

//set the alpha color for the color rows (this can be specific to the row if you want, but it isn't by default in this template)
var alphaValue; // The variable that holds the alpha value for the color rows. You can just set this to 255 and get rid of the if statement stuff below if none of your alts mess with it.  [Edit optional]
if(unlimitedAlt == WIREFRAME_ALT){ // Wireframe alt (change the 17 to whichever alts you want to be wireframe) [Edit necessary]
    alphaValue = 0; // invisible
} else { // normal alts
    alphaValue = 255; // fully visible
}

// Your alt's color rows are set here
switch(unlimitedAlt){ // this switch statement is just here in case you want specific behavior for certain alts
    default: // any row without a specfic case
        for(var i = 0; i < NUM_COLOR_ROWS; i++){ // this is where your current color is set to the alt you have selected according to the system
            set_character_color_slot(i, get_color_profile_slot_r(unlimitedAlt, i), get_color_profile_slot_g(unlimitedAlt, i), get_color_profile_slot_b(unlimitedAlt, i), alphaValue); // the character color slots are set according to the corresponding alt that you set up in colors.gml
            set_article_color_slot(i, get_color_profile_slot_r(unlimitedAlt, i), get_color_profile_slot_g(unlimitedAlt, i), get_color_profile_slot_b(unlimitedAlt, i), alphaValue); // the article (and everything other than the player) color slots are set according to the corresponding alt that you set up in colors.gml
        }
        break;
}

// You can get rid of this if you don't have a rainbow alt [Edit optional]
// rainbow alt
if(unlimitedAlt == RAINBOW_ALT){ // make this check for your rainbow alt
    var hue;
    var color_hsv;
    var color_rgb;
    var hue_speed = 1; // this is the speed of the hue shift
    for(var i = 0; i < NUM_COLOR_ROWS; i++){ // update the rainbow slots here
        if(i != -1){ // make sure you don't change the hue for the color rows that you don't want the rainbow effect on [Edit necessary]
            color_rgb = make_color_rgb(get_color_profile_slot_r(unlimitedAlt, i), get_color_profile_slot_g(unlimitedAlt, i), get_color_profile_slot_b(unlimitedAlt, i)); // make an rgb variable from the current color of this color row
            hue = (color_get_hue(color_rgb) + hue_speed) % 255; // finds the hue and shifts it
            color_hsv = make_color_hsv(hue, color_get_saturation(color_rgb), color_get_value(color_rgb)); // creates a new gamemaker colour variable using the shifted hue
            set_color_profile_slot(unlimitedAlt, i, color_get_red(color_hsv), color_get_green(color_hsv), color_get_blue(color_hsv)); // update the alt's color slot to have the shifted hue (won't be used until the next time init_shader.gml runs)
        }
    }
}


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