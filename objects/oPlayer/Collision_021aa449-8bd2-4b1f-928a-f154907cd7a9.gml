/// TRK Z oEnemy
damagedelay--;			// zniža časovnik za 1
if (damagedelay < 0) {	// if (časovnik je manj kot 0)
	damagedelay = 30;	// nastavi časovnik na 30
	global.hp--;		// zmanjša število življenj za 1
}	

	pflash = 5;
///Smrt

// if (ŠTEVILO ŽIVLJENJ <= 0)
if (global.hp <= 0) {
	with (oEyeLeft) instance_destroy();					// uniči oEyeLeft
	with (oEyeRight) instance_destroy();				// uniči oEyeRight
	
	instance_change(oPlayerCorpse,true);				// spremeni oPlayer v oPlayerCorpse, 
														// ohrani ID primera
	
	direction = point_direction(other.x,other.y,x,y);	// zazna smer, ki kaže do sredine oEnemy, 
														// s katerim je trčil
	
	hsp = lengthdir_x(6,direction);			// premakne za 6px stran od oEnemy po x osi
	vsp = lengthdir_y(4,direction) -2;		// premakne za 4px stran od oEnemy in 2px navzgor po y osi
	
	image_xscale = sign(hsp);				//spremeni SMER SLIKE, da bo enaka SMERI PREMIKANJA PO X OSI
}	


