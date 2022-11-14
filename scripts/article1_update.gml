//article1_update

if(place_meeting(x, y, player_id.plasmaFieldObj)){
    despawn();
    exit;
}

var orig_player_id = player_id;
if(kirby != -1){
    player_id = kirby;
}

switch(state){
    case 0: // idle state
        vsp = hover()
        if(get_player_stocks(player_id.player) < 1){
            changeState(3);
        } else if (state_timer > 30){
            if(state_timer == 31)
                spawn_hit_fx(x, y, 194);
            var enemyPlayer = noone;
            with oPlayer {
                if(player != other.player_id.player && !(get_player_team(player) == get_player_team(other.player_id.player) && !get_match_setting(SET_TEAMATTACK))){  
                    enemyPlayer = collision_circle(other.x, other.y, 60, id, false, false);
                    if(enemyPlayer != noone)
                        break;
                }
            }
            if(enemyPlayer != noone){
                changeState(1);
            }
        }
        break;
    case 1: // windbox state
        vsp = hover()
        if(state_timer == 1){ // also create a vfx eventually
            with oPlayer {
                if(player != other.player_id.player && !(get_player_team(player) == get_player_team(other.player_id.player) && !get_match_setting(SET_TEAMATTACK))){
                    if(collision_circle(other.x, other.y, 60, id, false, false)){
                        var windboxAngle = degtorad(point_direction(other.x, other.y, x, y - char_height/2));
                        var windboxPower = sqrt(sqr(hsp)+sqr(vsp))/10+2;
                        if(other.player_id != other.kirby && other.player_id.runeH){
                            windboxPower *= 2;
                        }
                        var windHSP = windboxPower*cos(windboxAngle);
                        var windVSP = -windboxPower*sin(windboxAngle);
                        switch(state){
                            case PS_DASH:
                            case PS_DASH_START:
                                set_state(PS_IDLE);
                                break;
                            case PS_DOUBLE_JUMP:
                            case PS_FIRST_JUMP:
                            case PS_WALL_JUMP:
                                set_state(PS_IDLE_AIR);;
                        }
                        var enemyDistance = min(120/point_distance(x, y, x, y-char_height/2), 2);
                        hsp += windHSP*enemyDistance*enemyDistance;
                        vsp += windVSP*enemyDistance;
                    }
                }
            }
            spawn_hit_fx(x, y, 195);
            sound_play(orig_player_id.sfxBirdSidespecialStartSound);
        } else if(state_timer > 20){
            if(get_player_stocks(player_id.player) < 1)
                changeState(3);
            else 
                changeState(2);
        }
        break;
    case 2: // return to gamma state
        hsp = lerp(0, (player_id.x - x), min(1, state_timer/2000));
        vsp = lerp(0, (player_id.y - player_id.char_height/2 - y), min(1, state_timer/2000)) + hover();
        if(hsp > 0) {
            spr_dir = 1;
        } else if(hsp < 0) {
            spr_dir = -1;
        }
        if(point_distance(x, y, player_id.x, player_id.y - player_id.char_height/2) < 20){
            despawn();
            exit;
        }
        if(get_player_stocks(player_id.player) < 1)
            changeState(3);
        break;
    case 3: // gamma died, time to leave
        var percentSpeed = ease_quadIn(0, 1, state_timer, 100);
        hsp = lerp(2, 5, percentSpeed/2)*spr_dir;
        vsp = lerp(-2, -20, percentSpeed) + hover();
        if(y < orig_player_id.TOP_BLASTZONE_Y_POS){
            despawn();
            exit;
        }
}

player_id = orig_player_id;

article_timer++;
state_timer++;
image_index = floor(article_timer/5);

#define changeState(newState)
state = newState;
state_timer = 0;

#define despawn()
if(player_id == kirby){
    kirby.betaArticleInstance = -1;
} else{
    player_id.noFlicky = true;
}
instance_destroy();

#define hover()
return (state_timer % 62 > 30 ? (15 - state_timer % 31) : (state_timer % 31 - 15))/14