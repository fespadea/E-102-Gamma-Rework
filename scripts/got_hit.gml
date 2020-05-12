//got hit

//don't leave people marked if FSPECIAL was canceled
if(attack == AT_FSPECIAL){
	for(var i = 0; i < 3; i++){
		if(markedPlayers[i] != 0){
			markedPlayers[i].gammaRocketMarked = false;
			markedPlayers[i] = 0;
		}
	}
	with pHitBox{
		if(orig_player == other.player && attack == AT_FSPECIAL && hbox_num == 1){
			for(var i = 0; i < 3; i++){
				if(other.markedPlayers[i] == 0){
					other.markedPlayers[i] = targetPlayer;
					targetPlayer.gammaRocketMarked = true;
					break;
				}
			}
		}
	}
	activeRockets = false;
	for(var i = 0; i < 3; i++){
		if(markedPlayers[i] != 0){
			activeRockets = true;
			break;
		}
	}
}