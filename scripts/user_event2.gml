// debugging stuff

#macro FSPECIAL_OBJECT_DETECTION_ACTIVE false

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