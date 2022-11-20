// called when the character gets KO'd

sound_play(failedSound);

//destroy mines
if(activeMines){
    with pHitBox {
        if(other.player == player){
            if(attack == AT_DSPECIAL && hbox_num == 1){
                length = 0;
            }
        }
    }
}

move_cooldown[AT_USPECIAL] = 0;

fspecialEvent = "death";
user_event(1);