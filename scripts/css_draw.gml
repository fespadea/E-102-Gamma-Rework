// css draw

// This is an edit of Muno's CSS template: https://pastebin.com/uquifNY8

// This offsets the alt name stuff when on the online CSS so that the picture thing doesn't cover it up. Set this to 0 if you don't like it. [Edit optional]
var bottomPartOffset = onlineCSS ? -10 : 0;

rectDraw(temp_x, temp_y + 135, temp_x + 201, temp_y + 142, c_black);
// print("draw" + string(unlimitedAlt));

for(var i = 0; i < ceil(array_length(altName)/16); i++){ // draw the rectangles for every unlimited alt
    for(var j = 0; j < min(array_length(altName)-i*16, 16); j++){
        var draw_color = (j+16*i == unlimitedAlt) ? c_white : c_gray;
        var draw_x = temp_x + 2 + 10 * j;
        rectDraw(draw_x, temp_y + bottomPartOffset + 137 - 5*i, draw_x + 7, temp_y + bottomPartOffset + 140 - 5*i, draw_color);
    }
}


draw_set_halign(fa_left);

draw_sprite_ext(cssUnlimitedScrollButton, 0, unlimitedUpButtonX, unlimitedUpButtonY, 1, 1, 0, holdUnlimitedUpButton ? c_gray : -1, 1);
draw_sprite_ext(cssUnlimitedScrollButton, 0, unlimitedDownButtonX, unlimitedDownButtonY, 1, -1, 0, holdUnlimitedDownButton ? c_gray : -1, 1);
var unlimitedButtonDivisonY = unlimitedUpButtonY+(unlimitedDownButtonY-unlimitedUpButtonY)/2+1;
var unlimitedButtonDivisonX = unlimitedUpButtonX;
draw_sprite_ext(cssUnlimitedScrollButtonDivision, 0, unlimitedButtonDivisonX, unlimitedButtonDivisonY, 1, -1, 0, -1, 1);

//include alt. name
// display the name of the currently selected alt
textDraw(temp_x + 2, temp_y + bottomPartOffset + 124 - 5*(ceil(array_length(altName)/16)-1), "fName", c_white, 0, 1000, 1, true, 1, "Alt. " + (unlimitedAlt < 9 ? "0" : "") + string(unlimitedAlt+1) + ": " + altName[unlimitedAlt]);


#define textDraw(x, y, font, color, lineb, linew, scale, outline, alpha, string)

draw_set_font(asset_get(argument[2]));

if argument[7]{ //outline. doesn't work lol
    for (var i = -1; i < 2; i++){
        for (var j = -1; j < 2; j++){
            draw_text_ext_transformed_color(argument[0] + i * 2, argument[1] + j * 2, argument[9], argument[4], argument[5], argument[6], argument[6], 0, c_black, c_black, c_black, c_black, 1);
        }
    }
}

draw_text_ext_transformed_color(argument[0], argument[1], argument[9], argument[4], argument[5], argument[6], argument[6], 0, argument[3], argument[3], argument[3], argument[3], argument[8]);

return string_width_ext(argument[9], argument[4], argument[5]);



#define rectDraw(x1, y1, x2, y2, color)

draw_rectangle_color(argument[0], argument[1], argument[2], argument[3], argument[4], argument[4], argument[4], argument[4], false);

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

#define generate_synced_var
///args chunks...
///Given pairs of chunks and their lengths in bits, compiles them into one value.
//arg format: chunk, bit_length, chunk, bit_length, etc.
var output = 0;
var num_chunks = argument_count/2;
if num_chunks != floor(num_chunks) {
    print("error generating synced var - function formatted wrong.");
    return 0;
}
var total_len = 0;
for (var i = num_chunks-1; i >= 0; i--) {
    var pos = (i*2);
    var shift = (pos-1 >= 0) ? argument[pos-1] : 0;
    total_len += argument[pos+1];
    output = output | argument[pos];
    output = output << shift;
}
if total_len > 32 {
    print(`error generating synced var - bit length surpassed 32! (${total_len} bits.)`);
    return 0;
}
return real(output);