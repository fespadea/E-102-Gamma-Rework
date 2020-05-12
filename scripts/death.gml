// called when the character gets KO'd

sound_play( sound_get( "failed" ) );

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