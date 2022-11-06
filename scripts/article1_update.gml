//article1_update

if (state == 0){ //idle state
    if(get_player_stocks(player_id.player) < 1){
        changeState(3);
    } else if (state_timer > 30){
        if(state_timer == 31)
            spawn_hit_fx(x, y, 194);
        with player_id { // I'm making the player object do this so that I can exclude them
            other.enemyPlayer = collision_circle(other.x, other.y, 60, oPlayer, false, true);
        }
        if(enemyPlayer != noone){
            changeState(1);
        }
    }
} else if (state == 1){ // windbox state
    if(state_timer == 1){ // also create a vfx eventually
        var windboxAngle = degtorad(point_direction(x, y, enemyPlayer.x, enemyPlayer.y - enemyPlayer.char_height/2));
        var windboxPower = sqrt(sqr(enemyPlayer.hsp)+sqr(enemyPlayer.vsp))/10+5;
        var windHSP = windboxPower*cos(windboxAngle);
        var windVSP = -windboxPower*sin(windboxAngle);
        switch(enemyPlayer.state){
            case PS_DASH:
            case PS_DASH_START:
                enemyPlayer.state = PS_WALK;
                break;
            case PS_DOUBLE_JUMP:
            case PS_FIRST_JUMP:
            case PS_WALL_JUMP:
                enemyPlayer.state = PS_IDLE_AIR;
        }
        spawn_hit_fx(x, y, 195);
        sound_play(asset_get("sfx_bird_sidespecial_start"));
    } else if(state_timer > 20){
        if(get_player_stocks(player_id.player) < 1)
            changeState(3);
        else 
            changeState(2);
    }
    var enemyDistance = min(120/point_distance(x, y, enemyPlayer.x, enemyPlayer.y-enemyPlayer.char_height/2), 2);
    enemyPlayer.hsp += windHSP*enemyDistance*enemyDistance;
    enemyPlayer.vsp += windVSP*enemyDistance;
} else if (state == 2){ // return to gamma state
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
} else if (state == 3){ // gamma died, time to leave
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