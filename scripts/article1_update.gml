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
        vsp = hover();
        if(get_player_stocks(player_id.player) < 1){
            changeState(3);
        } else if (state_timer > 30){
            if(state_timer == 31)
                spawn_hit_fx(x, y, 194);
            if(detectEnemy() != noone){
                changeState(1);
            } else{
                mineHitbox = noone;
                with pHitBox {
                    if(player_id.url == orig_player_id.url){
                        if(attack == AT_DSPECIAL && hbox_num == 1){
                            if(point_distance(x, y, other.x+4*other.spr_dir-14, other.y+12+13) < 20){
                                other.mineHitbox = self;
                                break;
                            }
                        }
                    }
                }
                if(mineHitbox != noone){
                    changeState(4);
                }
            }
        }
        break;
    case 1: // windbox state
        vsp = hover()
        if(state_timer == 1){
            create_hitbox(AT_NSPECIAL, 4, x, y).isGammaKirby = player_id == kirby;
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
        carryMine();
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
        break;
    case 4: // holding a mine
        vsp = hover();
        if(get_player_stocks(player_id.player) < 1){
            changeState(3);
        } else if(!carryMine()){
            changeState(2);
        }
        break;
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
return (article_timer % 62 > 30 ? (15 - article_timer % 31) : (article_timer % 31 - 15))/14;

#define detectEnemy()
var enemyPlayer = noone;
with oPlayer {
    if(player != other.player_id.player && !(get_player_team(player) == get_player_team(other.player_id.player) && !get_match_setting(SET_TEAMATTACK))){  
        enemyPlayer = collision_circle(other.x, other.y, 60, id, false, false);
        if(enemyPlayer != noone)
            break;
    }
}
return enemyPlayer;

#define carryMine()
if(instance_exists(mineHitbox)){
    mineHitbox.hsp = 0;
    mineHitbox.vsp = 0;
    mineHitbox.x = x + 4*spr_dir - 14*mineHitbox.spr_dir + hsp;
    mineHitbox.y = y + 12 + 13 + vsp;
    if(windboxCooldown <= 0 && detectEnemy() != noone){
        var pullWindbox = create_hitbox(AT_NSPECIAL, 4, x, y);
        pullWindbox.isGammaKirby = player_id == kirby;
        pullWindbox.hit_flipper = 9;
        spawn_hit_fx(x, y, orig_player_id.reverseWindEffect);
        sound_play(orig_player_id.sfxBirdSidespecialStartSound);
        windboxCooldown = 30;
    } else{
        windboxCooldown--;
    }
    return true;
}
return false;