//Calculate Movement
vsp += grv;

/// VODORAVNI TRK: SE OBRNE
if (place_meeting(x+hsp,y,oWall)) {					// if (čez 1 tik bo v zidu)
	while (!place_meeting(x+sign(hsp),y,oWall)) {	// dokler je vsaj 1px od zida v smeri gibanja po x osi
		x += sign(hsp);								// se premika 1px v smeri gibanja po x osi
	}
	hsp = -hsp;										// se obrne (po x osi)
}

/// ROB PLATFORME: SE OBRNE
if (!place_meeting(x+hsp+sign(hsp)*60,y+1,oWall)) {	// if (čez 1 tik ne bo več nad zidom)
	hsp = -hsp;										// se obrne (po x osi)
	}

x += hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,oWall)) {
	while (!place_meeting(x,y+sign(vsp),oWall)) {
		y += sign(vsp);
	}
	vsp = 0;
}

y += vsp;


//Animation
if (!place_meeting(x,y+1,oWall)) { // (if not on ground)
	sprite_index = sEnemyA;
	image_speed = 0;
	// Up or down image
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else { // is on ground
	image_speed = 1;
	if (hsp == 0) {
		sprite_index = sEnemy;
	}
	else {
		sprite_index = sEnemyR;
	}
}	
if (hsp != 0) image_xscale = sign(hsp);
