// debugging stuff

#macro CSS_OBJECT_DETECTION_ACTIVE false
#macro FSPECIAL_OBJECT_DETECTION_ACTIVE false
#macro PRINT_SYNCED_VAR_BINARY false

if(PRINT_SYNCED_VAR_BINARY){
    var number, oldbase, newbase, out;
    number = string_upper(string(get_synced_var(player)));
    oldbase = 10;
    newbase = 2;
    out = "";

    var len, tab;
    len = string_length(number);
    tab = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    var i, num;
    for (i=0; i<len; i+=1) {
        num[i] = string_pos(string_char_at(number, i+1), tab) - 1;
    }

    do {
        var divide, newlen;
        divide = 0;
        newlen = 0;
        for (i=0; i<len; i+=1) {
            divide = divide * oldbase + num[i];
            if (divide >= newbase) {
                num[newlen] = divide div newbase;
                newlen += 1;
                divide = divide mod newbase;
            } else if (newlen  > 0) {
                num[newlen] = 0;
                newlen += 1;
            }
        }
        len = newlen;
        out = string_char_at(tab, divide+1) + out;
    } until (len == 0);
    
    while(string_length(out) < 32){
        out = "0" + out;
    }

    print(out);
}

if(FSPECIAL_OBJECT_DETECTION_ACTIVE){
    switch(debugEvent){
        case "init":
            count = -1;
            objects = [];
            break;
        case "attack_update":
            with all {
                targetedPlayer = collision_line(other.laserX, other.laserY, other.laserX + xLength, other.laserY - yLength, self, false, false);
                if(targetedPlayer != noone){
                    other.objects[array_length(other.objects)] = targetedPlayer;
                }
            }
            break;
        case "set_attack":
            count = -1;
            objects = [];
            set_hitbox_value(AT_NAIR, 1, HG_DAMAGE, 999);
            set_hitbox_value(AT_NAIR, 1, HG_BASE_KNOCKBACK, 100);
            set_player_damage(player, 0);
            // // with all{
            // //     other.objects[array_length(other.objects)] = self;
            // // }
            print("start");
            break;
        case "update":
            count++;
            if(count < array_length(objects))
                // if(0 < count && count < 16)
                    with objects[count] {
                        if(garbageName == "hi"){
                            // print("made it")
                        }
                    }
            break;
    }
}

if(CSS_OBJECT_DETECTION_ACTIVE){
    switch(debugEvent){
        case "css_init":
            count = -1;
            objects = [];
            break;
        case "css_update":
            if(menu_rb_pressed){
                with all {
                    var overlap = position_meeting(get_instance_x(other.cursor_id), get_instance_y(other.cursor_id), self);
                    if(overlap){
                        var foundAlready = false;
                        for(var i = 0; i < array_length(other.objects); i++){
                            if(other.objects[i] == self){
                                foundAlready = true;
                                break;
                            }
                        }
                        if !foundAlready
                            other.objects[array_length(other.objects)] = self;
                    }
                }
            }
            if(menu_a_pressed){
                count = -1;
                objects = [];
                // // with all{
                // //     other.objects[array_length(other.objects)] = self;
                // // }
                print("start");
            }
            if(back_down){
                if(count < array_length(objects)-1){
                    count++;
                    // if(0 < count && count < 16)
                        with objects[count] {
                            if(garbageName == "hi"){
                                // print("made it")
                            }
                        }
                }
            }
            break;
    }
}

#define decToBin(number)
var oldbase, newbase, out;
number = string_upper(number);
oldbase = 10;
newbase = 2;
out = "";

var len, tab;
len = string_length(number);
tab = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";

var i, num;
for (i=0; i<len; i+=1) {
    num[i] = string_pos(string_char_at(number, i+1), tab) - 1;
}

do {
    var divide, newlen;
    divide = 0;
    newlen = 0;
    for (i=0; i<len; i+=1) {
        divide = divide * oldbase + num[i];
        if (divide >= newbase) {
            num[newlen] = divide div newbase;
            newlen += 1;
            divide = divide mod newbase;
        } else if (newlen  > 0) {
            num[newlen] = 0;
            newlen += 1;
        }
    }
    len = newlen;
    out = string_char_at(tab, divide+1) + out;
} until (len == 0);

while(string_length(out) < 32){
    out = "0" + out;
}

return out;