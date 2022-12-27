switch (state){
    case PS_IDLE_AIR:
    case PS_FIRST_JUMP:
	case PS_DOUBLE_JUMP:
	case PS_WALL_JUMP:
	case PS_TUMBLE:
    	if(vsp > 0 || prev_state == PS_ATTACK_AIR){
    		if (floatActive) {
				sprite_index = floatSprite;
			} else {
				sprite_index = fallSprite;
			}
			image_index = floor(state_timer*jump_anim_speed);
    	}
    break;

    case PS_WALK:
    	if(image_index > 0) {
    		sprite_index = walkLoopSprite;
    		image_index = floor(state_timer*walk_anim_speed);
    	}
    break;

	case PS_HITSTUN:
		if(state_timer == 5 && sprite_index == upHurtSprite)
			image_index++;
		if(sprite_index == bounceHurtSprite){
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

	case PS_ATTACK_GROUND:
	case PS_ATTACK_AIR:
		switch(attack){
			case AT_DSPECIAL:
				if(window == 2){
					image_index = 5 + ((mine_charge % 12 > 5) ? 1 : 0);
				}
				break;
			case AT_FSTRONG:
				if(window == 1){
					if(strong_charge > 0)
						image_index = 7 + floor(strong_charge/3) % 5;
				}
				break;
			case AT_FSPECIAL:
				fspecialEvent = "animation";
				user_event(1);
				break;
		}
    
    default: break;
}

/*if state = PS_FIRST_JUMP && state = PS_IDLE_AIR{
	sprite_index = sprite_get( "doublejump" );
	image_index = floor(image_number*state_timer/(image_number*5));
}*/