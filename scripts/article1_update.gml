//article1_update

if(place_meeting(x, y, player_id.plasmaFieldObj)){
    despawn();
    exit;
}

switch(state){
    case 0: // idle state
        if(get_player_stocks(player_id.player) < 1){
            changeState(3);
        } else if (state_timer > 30){
            if(state_timer == 31)
                spawn_hit_fx(x, y, 194);
            var enemyPlayer = noone;
            with oPlayer { // I'm making the player object do this so that I can exclude them
                if(player != other.player_id.player && !(get_player_team(player) == get_player_team(other.player) && get_match_setting(SET_TEAMATTACK) == false)){  
                    enemyPlayer = collision_circle(other.x, other.y, 60, id, false, false);
                    break;
                }
            }
            if(enemyPlayer != noone){
                changeState(1);
            }
        }
        break;
    case 1: // windbox state
        if(state_timer == 1){ // also create a vfx eventually
            with oPlayer {
                if(player != other.player_id.player && !(get_player_team(player) == get_player_team(other.player) && get_match_setting(SET_TEAMATTACK) == false)){
                    if(collision_circle(other.x, other.y, 60, id, false, false)){
                        var windboxAngle = degtorad(point_direction(other.x, other.y, x, y - char_height/2));
                        var windboxPower = sqrt(sqr(hsp)+sqr(vsp))/10+2;
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
            sound_play(player_id.sfxBirdSidespecialStartSound);
        } else if(state_timer > 20){
            if(get_player_stocks(player_id.player) < 1)
                changeState(3);
            else 
                changeState(2);
        }
        break;
    case 2: // return to gamma state
        hsp = lerp(0, (player_id.x - x), min(1, state_timer/2000));
        vsp = lerp(0, (player_id.y - player_id.char_height/2 - y), min(1, state_timer/2000));
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
        vsp = lerp(-2, -20, percentSpeed);
        if(y < player_id.TOP_BLASTZONE_Y_POS){
            despawn();
            exit;
        }
}

article_timer++;
state_timer++;
image_index = floor(article_timer/5);

#define changeState(newState)
state = newState;
state_timer = 0;

#define despawn()
player_id.noFlicky = true;
instance_destroy();