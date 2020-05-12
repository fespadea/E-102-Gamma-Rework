switch (state){
    case PS_IDLE_AIR:
    case PS_FIRST_JUMP:
	case PS_DOUBLE_JUMP:
	case PS_WALL_JUMP:
	case PS_TUMBLE:
    	if(vsp > 0 || prev_state == PS_ATTACK_AIR){
    		if (floatActive) {
				sprite_index = sprite_get("float");
			} else {
				sprite_index = sprite_get("fall");
			}
			image_index = floor(state_timer*jump_anim_speed);
    	}
    break;

    case PS_WALK:
    	if(image_index > 0) {
    		sprite_index = sprite_get("walkloop");
    		image_index = floor(state_timer*walk_anim_speed);
    	}
    break;

	case PS_HITSTUN:
		if(state_timer == 5 && sprite_index == sprite_get("uphurt"))
			image_index++;
		if(sprite_index == sprite_get("bouncehurt")){
			if(state_timer < 10)
				image_index = 0;
			else if(state_timer < 20)
				image_index = 1;
			else if(state_timer < 30)
				image_index = 2;
			else
				image_index = 3;
		}
	break;
    
    default: break;
}

/*if state = PS_FIRST_JUMP && state = PS_IDLE_AIR{
	sprite_index = sprite_get( "doublejump" );
	image_index = floor(image_number*state_timer/(image_number*5));
}*/