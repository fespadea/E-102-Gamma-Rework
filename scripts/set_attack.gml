//set_attack

switch(attack){
    case AT_NSPECIAL: //make nspecial loop
        set_window_value(AT_NSPECIAL, 1, AG_WINDOW_TYPE, 9);
        break;
    case AT_FSPECIAL: //set up variables for fspecial
        targeterRotation = 0;
        rocketsShot = 0;
        break;
    case AT_TAUNT: //change taunt sfx depending on alt (set here instead of init cause of changing alt mid-match)
        if(unlimitedAlt = 23){ // Egg Breaker alt number
            set_window_value(AT_TAUNT, 1, AG_WINDOW_SFX, EggBreakerTauntSfx);
            sound_stop(EggBreakerTauntSfx);
        } else{
            set_window_value(AT_TAUNT, 1, AG_WINDOW_SFX, normalTauntSfx);
            sound_stop(normalTauntSfx);
        }
}