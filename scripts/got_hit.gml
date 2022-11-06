//got hit

//don't leave people marked if FSPECIAL was canceled
if(attack == AT_FSPECIAL){
	for(var i = 0; i < array_length(markedPlayers); i++){
		if(instance_exists(markedPlayers[i])){
			markedPlayers[i].gammaRocketMarked[player] = false;
		}
	}
	markedPlayers = [];
	with pHitBox{
		if(orig_player == other.player && attack == AT_FSPECIAL && hbox_num == 1){
			if(instance_exists(targetPlayer)){
				other.markedPlayers[array_length(other.markedPlayers)] = targetPlayer;
				targetPlayer.gammaRocketMarked[other.player] = true;
			}
		}
	}
	activeRockets = array_length(markedPlayers) > 0;
}