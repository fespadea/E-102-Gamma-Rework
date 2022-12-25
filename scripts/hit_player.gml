//hit_player

// unlimitedAltEvent = "hit_player";
// user_event(0);

var dattackException = my_hitboxID.attack == AT_DATTACK && my_hitboxID.hbox_num < 6;
var uairException = my_hitboxID.attack == AT_UAIR && my_hitboxID.hbox_num < 5;
var ustrongException = my_hitboxID.attack == AT_USTRONG && my_hitboxID.hbox_num < 7;
var dairException = my_hitboxID.attack == AT_DAIR && my_hitboxID.hbox_num < 2;
var jabException = my_hitboxID.attack == AT_JAB && my_hitboxID.hbox_num == 4;
var ftiltException = my_hitboxID.attack == AT_FTILT && my_hitboxID.hbox_num < 2;
if(dattackException || uairException || ustrongException || dairException || jabException || ftiltException){
    hit_player_obj.should_make_shockwave = false;
}

if(my_hitboxID.attack == AT_NSPECIAL){
    if(my_hitboxID.hbox_num == 4){
        var windboxAngle = point_direction(my_hitboxID.x, my_hitboxID.y, hit_player_obj.x, hit_player_obj.y - hit_player_obj.char_height/2);
        if(!hit_player_obj.free){
            if(windboxAngle > 0 && windboxAngle < 180){
                if(windboxAngle > 90){
                    windboxAngle = 180;
                } else{
                    windboxAngle = 0;
                }
            }
        }
        var windboxPower = get_kb_formula(get_player_damage(hit_player_obj.player), hit_player_obj.knockback_adj, get_match_setting(SET_SCALING), 0, 10, 1.0);
        print(windboxPower)
        if(!my_hitboxID.isGammaKirby && runeH){
            windboxPower *= 2;
        }
        var windHSP = windboxPower*dcos(windboxAngle);
        var windVSP = -windboxPower*dsin(windboxAngle);
        with hit_player_obj{
            switch(state){
                case PS_DASH:
                case PS_DASH_START:
                case PS_WALK:
                    set_state(PS_IDLE);
                    break;
                case PS_DOUBLE_JUMP:
                case PS_FIRST_JUMP:
                case PS_WALL_JUMP:
                    set_state(PS_IDLE_AIR);
                    break;
            }
        }
        hit_player_obj.hsp += windHSP;
        hit_player_obj.vsp += windVSP;
    }
}