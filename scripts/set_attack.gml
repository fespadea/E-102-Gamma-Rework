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
        sound_stop(tauntSoundInstance);
        if(unlimitedAlt = 24){ // Egg Breaker alt number
            tauntSoundInstance = sound_play(EggBreakerTauntSfx);
        } else{
            tauntSoundInstance = sound_play(normalTauntSfx);
        }
        break;
    case AT_USPECIAL:
        sound_stop(gammaFanSoundInstance);
        gammaFanSoundInstance = sound_play(gammaFanSound, true);
        times_through = 0;
        break;
}

// count = -1;
// with all{
//     other.objects[array_length(other.objects)] = self;
// }
// print("start");