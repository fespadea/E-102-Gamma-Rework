//post-draw

// unlimitedAltEvent = "post_draw" is called in user_event1
fspecialEvent = "post_draw";
user_event(1);


//Bird overlay for nspecial
if(attack == AT_NSPECIAL && special_down && (state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR)){
    if(!noPeacock){
        draw_sprite_ext(nspecialPeacockIconSprite, 0, x+10, y-10, 1, 1, 0, c_gray, .7);
        draw_sprite_ext(nspecialPeacockIconSprite, 0, x-10, y-10, -1, 1, 0, c_gray, .7);
    } else if(down_down && ((spr_dir == 1 && !left_down) || (spr_dir == -1 && right_down))){
        draw_sprite_ext(nspecialPeacockIconSprite, 0, x+10, y-10, 1, 1, 0, -1, 1);
        draw_sprite_ext(nspecialPeacockIconSprite, 0, x-10, y-10, -1, 1, 0, -1, .7);
    } else if(down_down && ((spr_dir == 1 && left_down) || (spr_dir == -1 && !right_down))){
        draw_sprite_ext(nspecialPeacockIconSprite, 0, x+10, y-10, 1, 1, 0, -1, .7);
        draw_sprite_ext(nspecialPeacockIconSprite, 0, x-10, y-10, -1, 1, 0, -1, 1);
    } else {
        draw_sprite_ext(nspecialPeacockIconSprite, 0, x+10, y-10, 1, 1, 0, -1, .7);
        draw_sprite_ext(nspecialPeacockIconSprite, 0, x-10, y-10, -1, 1, 0, -1, .7);
    }
    if(!noSwallow){
        draw_sprite_ext(nspecialSwallowIconSprite, 0, x+40, y-40, 1, 1, 0, c_gray, .7);
        draw_sprite_ext(nspecialSwallowIconSprite, 0, x-40, y-40, -1, 1, 0, c_gray, .7);
    } else if(right_down && !down_down){
        draw_sprite_ext(nspecialSwallowIconSprite, 0, x+40, y-40, 1, 1, 0, -1, 1);
        draw_sprite_ext(nspecialSwallowIconSprite, 0, x-40, y-40, -1, 1, 0, -1, .7);
    } else if(left_down && !down_down){
        draw_sprite_ext(nspecialSwallowIconSprite, 0, x+40, y-40, 1, 1, 0, -1, .7);
        draw_sprite_ext(nspecialSwallowIconSprite, 0, x-40, y-40, -1, 1, 0, -1, 1);
    } else {
        draw_sprite_ext(nspecialSwallowIconSprite, 0, x+40, y-40, 1, 1, 0, -1, .7);
        draw_sprite_ext(nspecialSwallowIconSprite, 0, x-40, y-40, -1, 1, 0, -1, .7);
    }
    if(!noParrot)
        draw_sprite_ext(nspecialParrotIconSprite, 0, x, y-90, 1, 1, 0, c_gray, .9);
    else if(up_down && !right_down && !left_down && !down_down)
        draw_sprite_ext(nspecialParrotIconSprite, 0, x, y-90, 1, 1, 0,  -1, 1);
    else
        draw_sprite_ext(nspecialParrotIconSprite, 0, x, y-90, 1, 1, 0, -1, .7);
    if(!noFlicky)
        draw_sprite_ext(nspecialFlickyIconSprite, 0, x, y-char_height/2, spr_dir, 1, 0, c_gray, .9);
    else if(joy_pad_idle)
        draw_sprite_ext(nspecialFlickyIconSprite, 0, x, y-char_height/2, spr_dir, 1, 0,  -1, 1);
    else
        draw_sprite_ext(nspecialFlickyIconSprite, 0, x, y-char_height/2, spr_dir, 1, 0, -1, .7);
}



if "abysspostdrawenabled" not in self abysspostdrawenabled = true; // tell buddy you have post draw code
if "abyssPostDrawing" in self && abyssPostDrawing abyssPostDraw(); // actually do post draw code
#define abyssPostDraw 
/// abyssPostDraw()
/// draws text and images the player recieved from the abyss buddy.
if ("abyss_postDrawArray" in self && ds_list_valid(abyss_postDrawArray))  {
    if (ds_list_size(abyss_postDrawArray) > 0) {
        for (var _i = 0; _i < ds_list_size(abyss_postDrawArray);_i++) {
            var _text = abyss_postDrawArray[| _i];
            if draw_get_halign() != _text[6] {
                draw_set_halign(_text[6]);
            }
            switch (_text[0]) {
                case 0:
                    draw_debug_text(floor(_text[1]),floor(_text[2]),(_text[3]));
                    break;
                case 1:
                    draw_sprite_ext(_text[3],_text[5],_text[1],_text[2],1,1,0,_text[4],1);
                    break;
                case 2:
                    draw_text_plus(floor(_text[1]),floor(_text[2]),string(_text[3]),floor(_text[5]),floor(_text[4]));
                    break;
                case 3:
                    if draw_get_font() != 1 draw_set_font(1);
                    draw_text_ext_color(floor(_text[1]),floor(_text[2]),string(_text[3]),16,floor(_text[5]),_text[4],_text[4],_text[4],_text[4], 1);
                    break;
                default:
                break;
            }
        }
    }
    //finished drawing, so clear the table for the next frame.
    ds_list_clear(abyss_postDrawArray);
}
#define draw_text_plus
/// draw_text_plus(x, y, text, font, color = c_white)
/// draws outlined text in any in-game font.

if draw_get_font() != argument[3] {
    draw_set_font(argument[3]);
}
draw_text_color(argument[0]+2,argument[1],argument[2],c_black,c_black,c_black,c_black,1);
draw_text_color(argument[0]-2,argument[1],argument[2],c_black,c_black,c_black,c_black,1);
draw_text_color(argument[0],argument[1]-2,argument[2],c_black,c_black,c_black,c_black,1);
draw_text_color(argument[0],argument[1]+2,argument[2],c_black,c_black,c_black,c_black,1);
draw_text_color(argument[0]+2,argument[1]-2,argument[2],c_black,c_black,c_black,c_black,1);
draw_text_color(argument[0]-2,argument[1]-2,argument[2],c_black,c_black,c_black,c_black,1);
draw_text_color(argument[0]+2,argument[1]+2,argument[2],c_black,c_black,c_black,c_black,1);
draw_text_color(argument[0]-2,argument[1]+2,argument[2],c_black,c_black,c_black,c_black,1);
draw_text_color(argument[0],argument[1],argument[2],argument_count > 4 ? argument[4] : c_white,argument_count > 4 ? argument[4] : c_white,argument_count > 4 ? argument[4] : c_white,argument_count > 4 ? argument[4] : c_white,1);