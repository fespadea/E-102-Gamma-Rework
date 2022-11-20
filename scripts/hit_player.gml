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