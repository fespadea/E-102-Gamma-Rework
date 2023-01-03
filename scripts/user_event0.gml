// Unlimited Alts

/*
These are the variables to decide which bits of the synced variable you want to dedicate
to allowing more alts (from bit 0 to 31). You likely aren't using this if you don't 
know what it is, so you don't need to touch it if you don't. [Edit necessary]
*/
#macro FIRST_BIT_UNLIMITED 0
#macro LAST_BIT_UNLIMITED 31

// set this to the number of color rows you use (Rivals has a max of 8)
#macro NUM_COLOR_ROWS 5

/*
Set this to some unique value that other characters won't use.
I recommend using your character's url value.
You can't access the url value on the CSS, so you have to set it manually here.
*/
#macro URL "2885505316"

// Use these if you don't want these special alts [Edit necessary]
#macro HAS_RANDOM_ALT true
#macro HAS_EA_ALT true
#macro HAS_RAINBOW_ALT true
#macro HAS_WIREFRAME_ALT true

// Feature toggles
#macro RANDOM_ALT_ON_HIT true
#macro GHOST_MODE true
#macro INVISIBLE_MODE true
#macro CSS_BUTTON true
#macro CSS_MUNO true
#macro CSS_ALT_EFFECT_WARNING true
#macro SAME_ALT_COLOR_CHANGE true

//Alt names [Edit necessary]
var altName = [];
var altNum = 0;
altName[altNum++] = "E-102 Gamma";
altName[altNum++] = "E-101 Beta";
altName[altNum++] = "E-103 Delta";
altName[altNum++] = "E-104 Epsilon";
altName[altNum++] = "E-105 Zeta";
altName[altNum++] = "E-100 Alpha (ZERO)";
altName[altNum++] = "E-106 Eta";
altName[altNum++] = "E-107 Theta";
altName[altNum++] = "E-108 Iota";
altName[altNum++] = "E-109 Kappa";
altName[altNum++] = "E-110 Lambda";
altName[altNum++] = "E-113 Xi";
altName[altNum++] = "E-118 Tau";
altName[altNum++] = "E-121 Phi";
altName[altNum++] = "E-123 Omega";
altName[altNum++] = "Egg Keeper";
altName[altNum++] = "Egg Genesis";
altName[altNum++] = "Decoe";
altName[altNum++] = "Bocoe";
altName[altNum++] = "E-51 Intelligente";
altName[altNum++] = "E-77 Lucky";
altName[altNum++] = "Obot";
altName[altNum++] = "Cubot";
altName[altNum++] = "E-2000R";
altName[altNum++] = "Egg Breaker";
altName[altNum++] = "Dark Oak";
altName[altNum++] = "Red Pine";
altName[altNum++] = "Black Narcissus";
altName[altNum++] = "Pale Bayleaf";
altName[altNum++] = "Yellow Zelkova";
altName[altNum++] = "Bokkun";
altName[altNum++] = "Omochao";
altName[altNum++] = "Scratch";
altName[altNum++] = "Grounder";
altName[altNum++] = "Heavy";
altName[altNum++] = "Bomb";
altName[altNum++] = "Abyss";
altName[altNum++] = "Early Access";
altName[altNum++] = "Rainbow";
altName[altNum++]  = "Random"; // Only put as many names as you have alts

var numAlts = array_length(altName);

// secret alts
altName[altNum++] = "Wireframe";

var numTotalAlts = array_length(altName);

// You can manually set these values if you want
var randomAlt = -1;
var eaAlt = -1;
var rainbowAlt = -1;
var wireframeAlt = -1;
for(var i = 0; i < numTotalAlts; i++){
    switch(altName[i]){
        case "Random":
            if(HAS_RANDOM_ALT)
                randomAlt = i;
            break;
        case "Early Access":
            if(HAS_EA_ALT)
                eaAlt = i;
            break;
        case "Rainbow":
            if(HAS_RAINBOW_ALT)
                rainbowAlt = i;
            break;
        case "Wireframe":
            if(HAS_WIREFRAME_ALT)
                wireframeAlt = i;
            break;
    }
}


switch(unlimitedAltEvent){
    case "colors":
        for(var i = numAlts; i < numTotalAlts*3; i++){ // I had to multiply by 3 because I kept getting an error due to it multiplying the shade number by 3 when I tried to access it
            set_color_profile_slot( 0, i, 0, -1, -1);
        }
        break;
    case "css_init":
        // player is set to 0 online
        onlineCSS = player == 0; // true if on the online CSS

        // cssUnlimitedTimer = 0;
        // cssUnlimitedPrevTimer = 0;

        // this is necessary to prevent your alt from switching before the character has fully loaded
        allowUnlimitedSwitching = true;

        // get selected unlimited alt
        if(("savedUnlimitedAlt" + URL) in self){
            updateUnlimitedAlt(variable_instance_get(self, "savedUnlimitedAlt" + URL));
        } else{
            loadUnlimitedAlt();
            var validAlt = false;
            if(unlimitedAlt < 0){
                validAlt = false;
            } else if(unlimitedAlt < numAlts){
                validAlt = true;
            } else if(unlimitedAlt < numTotalAlts){
                validAlt = get_color_profile_slot_r(0, unlimitedAlt);
            }
            if(!validAlt){
                updateUnlimitedAlt(get_player_color(player));
            }
            variable_instance_set(self, "savedUnlimitedAlt" + URL, unlimitedAlt);
        }
        prevAlt = get_player_color(player);

        // with asset_get("cs_cpu_lvl_down_but"){
        //     print(get_instance_x(self))
        // }

        temp_x = x + 8;
        temp_y = y + 9;

        // css UI sprite
        cssUnlimitedRowButton = sprite_get("css_unlimited_row_button");

        hoverUnlimitedRowButton = false;
        holdUnlimitedRowButton = false;
        altSwitchSound = asset_get("mfx_change_color");

        unlimitedRowButtonX = 0;
        unlimitedRowButtonY = 0;

        // css alt effect warning sprite
        cssAltEffectWarning = sprite_get("css_alt_effect_warning");

        altEffectWarningX = temp_x;
        altEffectWarningY = temp_y + 34;
        
        // array to hold inputtable cheats
        unlimitedCheats = [];
        
        // cheat code menu input (left, left, A, back, A)
        codeMenuCheat = array_length(unlimitedCheats);
        unlimitedCheats[codeMenuCheat] = ["left", "left", "menu_a", "back", "menu_a"];
        
        // needed variables for input detection
        unlimitedInputs = ["left", "right", "up", "down", "start", "back", "menu_a", "menu_b", "menu_x", "menu_y", "menu_lb", "menu_rb"];
        allowNewUnlimitedInput = array_create(array_length(unlimitedCheats), true);
        unlimitedCheatProgress = array_create(array_length(unlimitedCheats), 0);
        unlimitedCheatActivated = array_create(array_length(unlimitedCheats), false);
        
        //code menu sprites
        codeButtonSprite = sprite_get("css_code_button");
        codeExitButtonSprite = sprite_get("css_code_exit_button");

        //code menu variables
        curCode = "";
        numCodeButtons = 12;
        codeButtonPosX = array_create(numCodeButtons, 0);
        codeButtonPosY = array_create(numCodeButtons, 0);
        codeButtonWidth = sprite_get_width(codeButtonSprite);
        codeButtonHeight = sprite_get_height(codeButtonSprite);
        codeButtonImageIndex = array_create(numCodeButtons, 0);
        codeButtonString = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "C/←", "0", "E"];
        codeX = 0;
        codeY = 0;
        codeWidth = 0;
        codeHeight = 0;
        maxCodeLength = 13;
        codeButtonBackSfx = asset_get("mfx_back");
        codeButtonSfx = asset_get("mfx_forward");
        codeExitButtonPosX = 0;
        codeExitButtonPosY = 0;
        codeExitButtonWidth = sprite_get_width(codeExitButtonSprite);
        codeExitButtonHeight = sprite_get_height(codeExitButtonSprite);
        codeExitButtonImageIndex = 0;
        
        // the array for the code menu cheats
        codes = [];
        altCodesMap = array_create(numTotalAlts, -1);
        
        wireFrameCheat = array_length(codes);
        codes[wireFrameCheat] = convertStringToCode("wire");
        altCodesMap[wireframeAlt] = wireFrameCheat;
        
        // array to keep track of activated codes (add all the codes to the codes array before this line)
        codeActivated = array_create(array_length(codes), false);
        
        // check if some codes were already activated
        // codeActivated[wireFrameCheat] = get_color_profile_slot_r(0, wireframeAlt);

        cpu_hover_init();
        break;
    case "css_update":
        if(!("unlimitedAlt" in self)){
            exit;
        }

        cpu_hover_update();

        var curGameAlt = get_player_color(player); // the current base game alt

        if(curGameAlt != prevAlt && allowUnlimitedSwitching){ // you switched alt
            if((curGameAlt > prevAlt && curGameAlt < prevAlt + 8) || curGameAlt < prevAlt - 8){ // You increased your alt. This accounts for going from the highest alt to the smallest alt and skipping alts because of other players.
                unlimitedAlt++; // increase your unlimited alt
                if(unlimitedAlt >= numAlts){ // if you've passed the number of unlimited alts you have
                    for(var i = unlimitedAlt; i <= numTotalAlts; i++){
                        if(i == numTotalAlts){
                            unlimitedAlt = 0; // reset your unlimited alt to the default alt
                        } else if(codeActivated[altCodesMap[i]]){
                            unlimitedAlt = i;
                            break;
                        }
                    }
                }
            } else{ // You decreased your alt. This accounts for going from the smallest alt to the highest alt and skipping alts because of other players.
                if(unlimitedAlt == 0){ // if you're the smallest unlimited alt
                    for(var i = numTotalAlts; i >= numAlts; i--){
                        if(i == numAlts){
                            unlimitedAlt = numAlts; // set the current alt to the number of alts you have (this will get decreased since you start counting alts at 0)
                        } else if(codeActivated[altCodesMap[i-1]]){
                            unlimitedAlt = i;
                            break;
                        }
                    }
                }
                unlimitedAlt--; // decrease your unlimited alt
            }
            prevAlt = curGameAlt;
            updateUnlimitedAlt(unlimitedAlt);
        }
        allowUnlimitedSwitching = false;
        // You don't need this if you don't have a rainbow alt [Edit optional]
        // if(unlimitedAlt == rainbowAlt){
        //     init_shader(); // run init_shader to update the hue
        // }

        if(get_instance_x(cursor_id) >= unlimitedRowButtonX && get_instance_x(cursor_id) <= unlimitedRowButtonX + sprite_get_width(cssUnlimitedRowButton) 
            && get_instance_y(cursor_id) >= unlimitedRowButtonY && get_instance_y(cursor_id) <= unlimitedRowButtonY + sprite_get_height(cssUnlimitedRowButton)
            && !unlimitedCheatActivated[codeMenuCheat]){
            hoverUnlimitedRowButton = true;
            suppress_cursor = true;
            if(menu_a_pressed){
                if(!holdUnlimitedRowButton){
                    holdUnlimitedRowButton = true;
                    sound_play(altSwitchSound);
                    unlimitedAlt += 16;
                    if(unlimitedAlt >= numAlts){
                        while(true){
                            if(unlimitedAlt < numTotalAlts){
                                if(codeActivated[altCodesMap[unlimitedAlt]]){
                                    break;
                                } else{
                                    unlimitedAlt += 16;
                                }
                            } else{
                                unlimitedAlt = unlimitedAlt % 16;
                                break;
                            }
                        }
                    }
                    updateUnlimitedAlt(unlimitedAlt);
                }
            } else if(menu_b_pressed){
                if(!holdUnlimitedRowButton){
                    holdUnlimitedRowButton = true;
                    sound_play(altSwitchSound);
                    unlimitedAlt -= 16;
                    if(unlimitedAlt < 0){
                        while(unlimitedAlt+16 < numTotalAlts){ // could not think of better math cause dumb
                            unlimitedAlt += 16;
                        }
                        while(unlimitedAlt >= numAlts){
                            if(!codeActivated[altCodesMap[unlimitedAlt]]){
                                unlimitedAlt -= 16;
                            }
                        }
                    }
                    updateUnlimitedAlt(unlimitedAlt);
                }
            } else if(menu_rb_pressed){
                if(!holdUnlimitedRowButton){
                    holdUnlimitedRowButton = true;
                    sound_play(altSwitchSound);
                    unlimitedAlt++;
                    if(unlimitedAlt >= numAlts){
                        for(var i = unlimitedAlt; i <= numTotalAlts; i++){
                            if(i == numTotalAlts){
                                unlimitedAlt = 0;
                            } else if(codeActivated[altCodesMap[i]]){
                                unlimitedAlt = i;
                                break;
                            }
                        }
                    }
                    updateUnlimitedAlt(unlimitedAlt);
                }
            } else if(menu_lb_pressed){
                if(!holdUnlimitedRowButton){
                    holdUnlimitedRowButton = true;
                    sound_play(altSwitchSound);
                    if(unlimitedAlt == 0){
                        for(var i = numTotalAlts; i >= numAlts; i--){
                            if(i == numAlts){
                                unlimitedAlt = numAlts;
                            } else if(codeActivated[altCodesMap[i-1]]){
                                unlimitedAlt = i;
                                break;
                            }
                        }
                    }
                    unlimitedAlt--;
                    updateUnlimitedAlt(unlimitedAlt);
                }
            }else if(!menu_a_down && !menu_b_down && !menu_lb_down && !menu_rb_down ){
                holdUnlimitedRowButton = false;
            }
        } else if(hoverUnlimitedRowButton){
            holdUnlimitedRowButton = false;
            hoverUnlimitedRowButton = false;
            suppress_cursor = false;
        }
        
        // detect inputted cheats
        for(var i = 0; i < array_length(unlimitedCheats); i++){
            if(unlimitedCheatActivated[i]){
                continue;
            }
            var cheat = unlimitedCheats[i];
            var cheatProgress = unlimitedCheatProgress[i];
            var curInput = cheat[cheatProgress];
            var prevInput = cheatProgress > 0 ? cheat[cheatProgress-1] : "";
            var curDown = variable_instance_get(self, curInput + "_down");
            var prevDown = prevInput != "" ? variable_instance_get(self, prevInput + "_down") : false;
            if(!allowNewUnlimitedInput[i]){
                allowNewUnlimitedInput[i] = !prevDown;
            }
            var allowNewInput = allowNewUnlimitedInput[i];
            for(var j = 0; j < array_length(unlimitedInputs); j++){
                var input = unlimitedInputs[j];
                if(!(input == curInput || (input == prevInput && curInput != prevInput))){
                    if(variable_instance_get(self, input + "_down")){
                        unlimitedCheatProgress[i] = 0;
                        allowNewUnlimitedInput[i] = true;
                        allowNewInput = false;
                        break;
                    }
                }
            }
            if(allowNewInput){
                if(curDown){
                    unlimitedCheatProgress[i]++;
                    allowNewUnlimitedInput[i] = false;
                }
            }
            if(unlimitedCheatProgress[i] >= array_length(cheat)){
                unlimitedCheatActivated[i] = true;
                unlimitedCheatProgress[i] = 0;
                allowNewUnlimitedInput[i] = true;
            }
        }
        
        // cheat code menu button detection
        if(unlimitedCheatActivated[codeMenuCheat]){
            if(get_instance_x(cursor_id) >= codeX && get_instance_x(cursor_id) <= codeX + codeWidth
                && get_instance_y(cursor_id) >= codeY && get_instance_y(cursor_id) <= codeY + codeHeight){
                suppress_cursor = true;
            } else{
                suppress_cursor = false;
            }
            
            if(get_instance_x(cursor_id) >= codeExitButtonPosX && get_instance_x(cursor_id) <= codeExitButtonPosX + codeExitButtonWidth
                && get_instance_y(cursor_id) >= codeExitButtonPosY && get_instance_y(cursor_id) <= codeExitButtonPosY + codeExitButtonHeight){
                if(menu_a_pressed){
                    if(codeExitButtonImageIndex != 2){
                        codeExitButtonImageIndex = 2;
                        unlimitedCheatActivated[codeMenuCheat] = false;
                        sound_play(codeButtonBackSfx);
                    }
                } else if(!menu_a_down){
                    codeExitButtonImageIndex = 1;
                }
            } else if(codeExitButtonImageIndex){
                codeExitButtonImageIndex = 0;
            }
            
            for(var i = 0; i < numCodeButtons; i++){
                if(get_instance_x(cursor_id) >= codeButtonPosX[i] && get_instance_x(cursor_id) <= codeButtonPosX[i] + codeButtonWidth
                    && get_instance_y(cursor_id) >= codeButtonPosY[i] && get_instance_y(cursor_id) <= codeButtonPosY[i] + codeButtonHeight){
                    if(menu_a_pressed){
                        if(codeButtonImageIndex[i] != 2){
                            codeButtonImageIndex[i] = 2;
                            switch(i){
                                case 9:
                                    curCode = string_copy(curCode, 1, string_length(curCode)-1);
                                    sound_play(codeButtonBackSfx);
                                    break;
                                case 11:
                                    var codeIndex = array_find_index(codes, curCode);
                                    if(codeIndex >= 0){
                                        codeActivated[codeIndex] = true;
                                    }
                                    break;
                                default:
                                    if(string_length(curCode) <= maxCodeLength){
                                        curCode += codeButtonString[i];
                                        sound_play(codeButtonSfx);
                                    } else{
                                        sound_play(codeButtonBackSfx);
                                    }
                                    break;
                            }
                        }
                    } else if(menu_b_pressed){
                        if(codeButtonImageIndex[i] != 2){
                            codeButtonImageIndex[i] = 2;
                            switch(i){
                                case 9:
                                    curCode = "";
                                    sound_play(codeButtonBackSfx);
                                    break;
                                default:
                                    break;
                            }
                        }
                    } else if(!menu_a_down && !menu_b_down){
                        codeButtonImageIndex[i] = 1;
                    }
                } else if(codeButtonImageIndex[i]){
                    codeButtonImageIndex[i] = 0;
                }
            }
        }
        
        // update unlocked alts in color slots
        set_color_profile_slot(0, wireframeAlt, codeActivated[wireFrameCheat], -1, -1);
        
        break;
    case "css_draw":
        // This is an edit of Muno's CSS template: https://pastebin.com/uquifNY8

        allowUnlimitedSwitching = true;

        init_shader();
        // if(cssUnlimitedPrevTimer == cssUnlimitedTimer-1) // avoids overwriting the game's calls to init_shader with a call that will get cancelled
        //     init_shader();
        
        // if("cssUnlimitedTimer" in self){
        //     cssUnlimitedTimer++;
        // }

        // I don't want the shader to affect anything here.
        shader_end();
        
        var positions = [124, 124, 362, 600, 838]; // hopefully the online css also starts at 124
        var myPositionObject = noone;
        with asset_get("cs_info_but") {
            if(get_instance_x(self) == positions[other.player]){
                myPositionObject = self;
            }
        }

        // base x and y values
        if(myPositionObject != noone){
            temp_x = get_instance_x(myPositionObject) - 102;
            temp_y = get_instance_y(myPositionObject) - 169;
        }

        // var cpuPositions = [108, 108, 346, 584, 822];
        // var isCPU = false;
        // var cpuButton = noone;
        // with asset_get("cs_cpu_lvl_down_but") {
        //     // print(get_instance_x(self))
        //     if(get_instance_x(self) == cpuPositions[other.player]){
        //         cpuButton = self;
        //     }
        // }
        // if(cpuButton){
        //     with cursor_id {
        //         if(instance_place(get_instance_x(cpuButton), get_instance_y(cpuButton), cpuButton)){
        //             isCPU = true;
        //         }
        //     }
        // }
        // print(isCPU)
        
        // got this from Lilac which I think got it from Dr. Flux
        if (onlineCSS){
            unlimitedRowButtonX = temp_x + 170;
            unlimitedRowButtonY = temp_y + 30;
            // unlimitedRowButtonX = temp_x + 26;
            // unlimitedRowButtonY = temp_y + 139;
        } else{
            if (get_player_hud_color(player) == 8421504 || get_match_setting(SET_TEAMS))
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
        
        // This offsets the alt name stuff when on the online CSS so that the picture thing doesn't cover it up. Set this to 0 if you don't like it. [Edit optional]
        var bottomPartOffset = onlineCSS ? -10 : 0;

        rectDraw(temp_x, temp_y + 135, temp_x + 201, temp_y + 142, c_black);

        var alt = 0;
        var maxUnlockedAlt = 0;
        for(var i = 0; i < ceil(numTotalAlts/16); i++){ // draw the rectangles for every unlimited alt
            for(var j = 0; j < min(numTotalAlts-i*16, 16); j++){
                if(alt < numAlts || codeActivated[altCodesMap[alt]]){
                    var draw_color = (alt == unlimitedAlt) ? c_white : c_gray;
                    var draw_x = temp_x + 2 + 10 * j;
                    rectDraw(draw_x, temp_y + bottomPartOffset + 137 - 5*i, draw_x + 7, temp_y + bottomPartOffset + 140 - 5*i, draw_color);
                    maxUnlockedAlt = alt;
                }
                alt++;
            }
        }


        draw_set_halign(fa_left);

        // draw the CSS button
        if(!unlimitedCheatActivated[codeMenuCheat])
            draw_sprite_ext(cssUnlimitedRowButton, holdUnlimitedRowButton ? 2 : (hoverUnlimitedRowButton ? 1 : 0), unlimitedRowButtonX, unlimitedRowButtonY, 1, 1, 0, c_white, 1);
        // draw the alt effect warning
        draw_sprite_ext(cssAltEffectWarning, get_player_color(player) == 13 ? 2 : (get_player_color(player) == 18 ? 1 : 0), altEffectWarningX, altEffectWarningY, 1, 1, 0, c_white, 1);


        //include alt. name
        // display the name of the currently selected alt
        textDraw(temp_x + 2, temp_y + bottomPartOffset + 124 - 5*(ceil(maxUnlockedAlt/16)-1), "fName", c_white, 0, 1000, 1, true, 1, "Alt. " + (unlimitedAlt < 9 ? "0" : "") + string(unlimitedAlt+1) + ": " + altName[unlimitedAlt]);
        
        if(unlimitedCheatActivated[codeMenuCheat]){
            codeX = temp_x+2;
            codeY = temp_y;
            codeWidth = 200;
            codeHeight = 142;
            draw_rectangle_color(codeX,codeY,codeX+codeWidth,codeY+codeHeight,c_dkgray,c_dkgray,c_dkgray,c_dkgray,-1);
            var codeBarX = codeX+6;
            var codeBarY = codeY+34;
            var codeBarWidth = 124;
            var codeBarHeight = 20;
            draw_roundrect_color(codeBarX, codeBarY, codeBarX+codeBarWidth, codeBarY+codeBarHeight, c_black, c_black, -1);
            var textX = codeBarX + 6;
            var textY = codeBarY  + codeBarHeight/2 - (string_height(curCode)-11)/2;
            textDraw(textX, textY, "fName", c_white, 0, codeBarWidth, 1, true, 1, curCode);
            var buttonMarginX = 10;
            var buttonMarginY = 2;
            var buttonsPerRow = numCodeButtons/4;
            var buttonsPerCol = numCodeButtons/3;
            var buttonNumber = 0;
            for(var j = 0; j < buttonsPerCol; j++){
                for(var i = 0; i < buttonsPerRow; i++){
                    var buttonX = floor(codeBarX + buttonMarginX + i*(codeBarWidth - buttonMarginX*2 - codeButtonWidth)/(buttonsPerRow-1));
                    var buttonY = floor(codeBarY + codeBarHeight + buttonMarginY + j*((codeY + codeHeight - (codeBarY + codeBarHeight)) - buttonMarginY*2 - codeButtonHeight)/(buttonsPerCol-1));
                    var buttonColor = buttonNumber == 9 ? c_blue : (buttonNumber == 11 ? c_green : c_white);
                    draw_sprite_ext(codeButtonSprite, codeButtonImageIndex[buttonNumber], buttonX, buttonY, 1, 1, 0, buttonColor, 1);
                    codeButtonPosX[buttonNumber] = buttonX;
                    codeButtonPosY[buttonNumber] = buttonY;
                    var buttonLabel = codeButtonString[buttonNumber];
                    var labelX = floor(buttonX + codeButtonWidth/2 - (string_width(buttonLabel)-2)/2);
                    var labelY = floor(buttonY + codeButtonHeight/2 - (string_height(buttonLabel)-9)/2);
                    textDraw(labelX, labelY, "fName", c_white, 0, codeButtonWidth, 1, true, 1, buttonLabel);
                    buttonNumber++;
                }
            }
            codeExitButtonPosX = codeX + 70;
            codeExitButtonPosY = codeY + 4;
            draw_sprite(codeExitButtonSprite, codeExitButtonImageIndex, codeExitButtonPosX, codeExitButtonPosY);
        }
        
        cpu_hover_draw();
        break;
    case "init_shader":
        /*
            This prevents this code from running too early when loading your character.
            The game will crash if you try to get values from the extra color profile slots too early.
        */
        // if("cursor_id" in self){
        //     if(!("cssUnlimitedTimer" in self) || !("cssUnlimitedPrevTimer" in self) || cssUnlimitedPrevTimer != cssUnlimitedTimer-1){
        //         exit;
        //     }
        //     cssUnlimitedPrevTimer++;
        // }
        if(!("unlimitedAlt" in self)){
            if("onlineCSS" in self && onlineCSS){
                var savePlayer = player;
                player = 0;
                loadUnlimitedAlt();
                player = savePlayer;
            } else{
                loadUnlimitedAlt();
            }
        }

        // You can get rid of this part if none of your alts change the default shading [Edit optional]
        // set the shading of the color slots
        if(unlimitedAlt == eaAlt){ // EA alt and rainbow alt need no shading (shading just looks bad on rainbow)
            // set shading to 0 for every color slot
            for(var i = 1; i < NUM_COLOR_ROWS; i++){
                set_character_color_shading(i, 0);
            }
        } else{ // normal alt
            // set shading to normal for every color slot
            for(var i = 0; i < NUM_COLOR_ROWS; i++){
                set_character_color_shading(i, 1);
            }
        }

        //set the alpha color for the color rows (this can be specific to the row if you want, but it isn't by default in this template)
        var alphaValue; // The variable that holds the alpha value for the color rows. You can just set this to 255 and get rid of the if statement stuff below if none of your alts mess with it.  [Edit optional]
        if(unlimitedAlt == wireframeAlt){ // Wireframe alt (change the 17 to whichever alts you want to be wireframe) [Edit necessary]
            alphaValue = 0; // invisible
        } else { // normal alts
            alphaValue = 255; // fully visible
        } 
        
        var numSameAlt = 0;
        var sameAltPlayers = [];
        for(var i = 0; i < player; i++){ // I don't assume a maximum length in case rivals increases the player limit
            sameAltPlayers[i] = false;
        }
        with oPlayer{
            if(player < other.player && ("url" in self) && url == other.url && unlimitedAlt == other.unlimitedAlt){
                sameAltPlayers[player] = true; // I'm doing this like this to avoid double counting clones
            }
        }
        for(var i = 0; i < array_length(sameAltPlayers); i++){
            if(sameAltPlayers[i]){
                numSameAlt++;
            }
        }

        // Your alt's color rows are set here
        switch(unlimitedAlt){ // this switch statement is just here in case you want specific behavior for certain alts
            default: // any row without a specfic case
                for(var i = 0; i < NUM_COLOR_ROWS; i++){ // this is where your current color is set to the alt you have selected according to the system
                    var rowColor = merge_color(make_color_rgb(get_color_profile_slot_r(unlimitedAlt, i), get_color_profile_slot_g(unlimitedAlt, i), get_color_profile_slot_b(unlimitedAlt, i)), numSameAlt % 2 ? c_black : c_white, (0.05  + 0.15*(numSameAlt % 2))*floor((numSameAlt+1)/2) + 0.2*(numSameAlt > 0));
                    // rowColorHue = color_get_hue(rowColor);
                    // rowColorSat = color_get_saturation(rowColor)/((numSameAlt%2)*floor(numSameAlt/2)+1);
                    // rowColorVal = color_get_value(rowColor)/((numSameAlt%2)*floor((numSameAlt+1)/2)+1);
                    // rowColor = make_color_hsv(rowColorHue, rowColorSat, rowColorVal);
                    set_character_color_slot(i, color_get_red(rowColor), color_get_green(rowColor), color_get_blue(rowColor), alphaValue); // the character color slots are set according to the corresponding alt that you set up in colors.gml
                    set_article_color_slot(i, color_get_red(rowColor), color_get_green(rowColor), color_get_blue(rowColor), alphaValue); // the article (and everything other than the player) color slots are set according to the corresponding alt that you set up in colors.gml
                }
                break;
        }

        // You can get rid of this if you don't have a rainbow alt [Edit optional]
        // rainbow alt
        if(unlimitedAlt == rainbowAlt){ // make this check for your rainbow alt
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
        break;
    case "init":
        // the currently selected unlimited alt
        loadUnlimitedAlt();

        // [Random alt on hit feature]
        randomAltOnHit = false; // holds whether this feature has been activated

        // [Ghost mode feature]
        ghostMode = false;

        // [Invisible mode feature]
        invisibleMode = false;

        // variable to avoid changing toggle multiple times with single press
        toggleHeld = false;

        // [Random Alt]
        // Check if the random alt is selected
        if(unlimitedAlt == randomAlt){
            unlimitedAlt = random_func(0, numAlts-1, true);
            if(unlimitedAlt >= randomAlt){
                unlimitedAlt++;
            }
            init_shader();
        }
        set_color_profile_slot(0, 8, unlimitedAlt, -1, -1);
        break;
    case "update":
        var toggleRequirement = taunt_down && down_down && jump_down;
        if(toggleRequirement && special_down){
            if(!toggleHeld){
                toggleHeld = true;
                randomAltOnHit = !randomAltOnHit; // activate "random alt on hit"
            }
        } else if(toggleRequirement && strong_down && attack_down){
            if(!toggleHeld){
                toggleHeld = true;
                ghostMode = !ghostMode; // toggle ghost mode
                invisibleMode = false;
            }
        } else if(toggleRequirement && strong_down && shield_down){
            if(!toggleHeld){
                toggleHeld = true;
                ghostMode = false;
                invisibleMode = !invisibleMode; // toggle invisible mode
            }
        } else{
            toggleHeld = false;
        }
        // You don't need this if you don't have a rainbow alt [Edit optional]
        if(unlimitedAlt == rainbowAlt){
            init_shader(); // run init_shader to update the hue
        }
        if(randomAltOnHit){
            with pHitBox {
                if(player == other.player && type == 2){
                    if(has_hit){
                        with other{
                            if(HAS_RANDOM_ALT){
                                unlimitedAlt = random_func(0, numAlts-1, true);
                                if(unlimitedAlt >= randomAlt){
                                    unlimitedAlt++;
                                }
                            } else{
                                unlimitedAlt = random_func(0, numAlts, true);
                            }
                            init_shader(); // update the alt visually
                        }
                    }
                }
            }
        }
        break;
    case "hitbox_update":
        if(player == other.player){
            other.has_hit = false;
        }
        break;
    case "attack_update":
        if(randomAltOnHit){
            if(has_hit && hitstop == hitstop_full-1){
                if(HAS_RANDOM_ALT){
                    unlimitedAlt = random_func(0, numAlts-1, true);
                    if(unlimitedAlt >= randomAlt){
                        unlimitedAlt++;
                    }
                } else{
                    unlimitedAlt = random_func(0, numAlts, true);
                }
                init_shader(); // update the alt visually
            }
        }
        break;
    // case "hit_player":
    //     // [Random alt on hit feature]
    //     // Random alt on hit
    //     if(randomAltOnHit && hit_player != player){ // if "random alt on hit" activated
    //         if(HAS_RANDOM_ALT){
    //             unlimitedAlt = random_func(0, numAlts-1, true);
    //             if(unlimitedAlt >= randomAlt){
    //                 unlimitedAlt++;
    //             }
    //         } else{
    //             unlimitedAlt = random_func(0, numAlts, true);
    //         }
    //         init_shader(); // update the alt visually
    //     }
    //     break;
    case "pre_draw":
        if(ghostMode){
            gpu_push_state();
            gpu_set_blendmode_ext(bm_src_color, bm_inv_src_color);
        } else if(invisibleMode){
            gpu_push_state();
            gpu_set_blendmode_ext(bm_zero, bm_one);
        }
        break;
    case "post_draw":
    // case "post_draw_1":
    //     var sameAltPlayers = [];
    //     for(var i = 0; i < player; i++){ // I don't assume a maximum length in case rivals increases the player limit
    //         sameAltPlayers[i] = false;
    //     }
    //     with oPlayer{
    //         if(url == other.url && player < other.player && unlimitedAlt == other.unlimitedAlt){
    //             sameAltPlayers[player] = true; // I'm doing this like this to avoid double counting clones
    //         }
    //     }
    //     var numSameAlt = 0;
    //     for(var i = 0; i < array_length(sameAltPlayers); i++){
    //         if(sameAltPlayers[i]){
    //             numSameAlt++;
    //         }
    //     }
    //     if(numSameAlt > 0){
    //         shader_start();
    //         draw_sprite_ext(sprite_index, image_index, x+draw_x, y+draw_y, (1+small_sprites)*spr_dir, (1+small_sprites), spr_angle, make_colour_rgb(150,150,150)/numSameAlt, 1);
    //         shader_end();
    //     }
    //     if(unlimitedAltEvent == "post_draw_1"){
    //         break;
    //     }
    // case "post_draw_2":
        if(ghostMode || invisibleMode){
            gpu_pop_state();
        }
        break;
    case "results_pre_draw":
        unlimitedAlt = get_color_profile_slot_r(0, 8);
        init_shader();
        break;
}




#define loadUnlimitedAlt
var syncedVar = get_synced_var(player);
unlimitedAlt = (syncedVar >> FIRST_BIT_UNLIMITED) & ((1 << (LAST_BIT_UNLIMITED-FIRST_BIT_UNLIMITED+1))-1);


#define updateUnlimitedAlt(newUnlimitedAlt)
var prevUnlimitedAlt = unlimitedAlt;
unlimitedAlt = newUnlimitedAlt;
if(("savedUnlimitedAlt" + URL) in self){
    variable_instance_set(self, "savedUnlimitedAlt" + URL, unlimitedAlt);
}
var syncedVar = get_synced_var(player);
var newSyncedVar = 0;
newSyncedVar += syncedVar >> (LAST_BIT_UNLIMITED+1) << (LAST_BIT_UNLIMITED+1);
newSyncedVar += (unlimitedAlt & ((1 << (LAST_BIT_UNLIMITED-FIRST_BIT_UNLIMITED+1))-1)) << FIRST_BIT_UNLIMITED;
newSyncedVar += syncedVar & ((1 << (FIRST_BIT_UNLIMITED))-1);
set_synced_var(player, newSyncedVar);
if(!("cursor_id" in self)){
    init_shader();
    with oPlayer {
        if(player > other.player && ("url" in self) && url == other.url && (unlimitedAlt == other.unlimitedAlt || unlimitedAlt == prevUnlimitedAlt)){
            init_shader();
        }
    }
}

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


#define cpu_hover_init()
cpu_hovering_player = -1; //the current player that's hovering the cpu. -1 for nobody
cpu_is_hovered = -1; //whether the cpu is hovered currently.
cpu_hover_time = 0; //the timer for the cpu hover indicator
cpu_color_swap_time = 0; //the timer for the cpu indicator's smooth color swap
cpuh_prev_color = c_gray;
cpuh_new_color = c_gray;

var c = [-4,-4,-4,-4,-4];
with (asset_get("cs_playercursor_obj")) { //this sets the cursor array
    c[get_instance_player(self)] = self;
}
cursors = c;

x = floor(x); //hehe
y = floor(y);
plate_bounds = [x,y,x+219,y+207]; //boundaries of the player plate
portrait_bounds = [x+10,y+10,x+210,y+151]; //boundaries of the player portrait. unused but useful
cpu_hover_sprite = sprite_get("cpu_controllingplayer_outline"); //the outline sprite.


#define cpu_hover_draw()
if (cpu_hover_time > 0) {
    var prog = min(cpu_hover_time/10, 1);
    var colprog = min(cpu_color_swap_time/5, 1);
    var col = merge_color(cpuh_prev_color, cpuh_new_color, colprog);
    draw_sprite_ext(cpu_hover_sprite, 0, x - 4, y - 6, 2, 2, 0, col, prog);
    draw_set_alpha(prog);
    draw_debug_text(plate_bounds[2]-17, plate_bounds[3]+1, `P${cpu_hovering_player}`);
    draw_set_alpha(1);
}

#define convertStringToCode(codeString)
codeString = string_lower(codeString);
var code = "";
for(var i = 1; i <= string_length(codeString); i++){
    switch string_char_at(codeString, i){
        default:
            code += "0";
            break;
        case " ":
            code += "1";
            break;
        case "a":
        case "b":
        case "c":
            code += "2";
            break;
        case "d":
        case "e":
        case "f":
            code += "3";
            break;
        case "g":
        case "h":
        case "i":
            code += "4";
            break;
        case "j":
        case "k":
        case "l":
            code += "5";
            break;
        case "m":
        case "n":
        case "o":
            code += "6";
            break;
        case "p":
        case "q":
        case "r":
        case "s":
            code += "7";
            break;
        case "t":
        case "u":
        case "v":
            code += "8";
            break;
        case "w":
        case "x":
        case "y":
        case "z":
            code += "9";
            break;
    }
}
return code;