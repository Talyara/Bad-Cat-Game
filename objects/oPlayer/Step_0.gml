/// BERE VHODNE PODATKE

key_left =	keyboard_check(vk_left)			// leva tipka
			or keyboard_check(ord("A"));	// tipka A
			
key_right = keyboard_check(vk_right) 		// desna tipka
			or keyboard_check(ord("D"));	// tipka D
			
key_jump = keyboard_check(vk_space) 		// tipka za presledek
			or keyboard_check(vk_up) 		// tipka navzgor
			or keyboard_check(ord("W"));	// tipka W

/// RAČUNA HITROST
var move = key_right - key_left;	// določi smer gibanja

hsp = move * walksp;			// vodoravna hitrost v smeri gibanja
vsp += grv;						// navpični hitrosi doda gravitacijo

/// SKOK
if  (key_jump)										// if (tipka za skok)
	&& (	(place_meeting(x,y+1,oWall)				// and (	((1px pod mano je zid)
			&& !place_meeting(x,y,oWall)	)		//			and (nisem znotraj zida))
		or place_meeting(x,y+1,oEnemyCorpse)	) {	//		or (1px pod mano je truplo)
	vsp = -14;										// poveča navpično hitrost oz. skoči
}	

/// VODORAVNI TRK
if (place_meeting(x+hsp,y,oWall)) {					// if (čez 1 tik bo v zidu)
	while (!place_meeting(x+sign(hsp),y,oWall)) {	// dokler je vsaj 1px od zida v smeri gibanja po x osi
		x += sign(hsp);								// se premika 1px v smeri gibanja po x osi
	}
	hsp = 0;										// se ustavi (po x osi)
}

/// PREMIK PO VODORAVNI OSI
x += hsp;				// x koordinati prišteje vodoravno hitrost

/// NAVPIČNI TRK
if (sign(vsp)) {												// if (se premika navzdol)
	if	(	place_meeting(x,y+vsp,oWall)						// if (	(čez 1 tik bo v zidu)
			&& !place_meeting(x,y,oWall))						//		and (trenutno ni v zidu))
		or place_meeting(x,y+vsp,oEnemyCorpse){					//	  or (čez 1 tik bo v truplu)
			
		while !(place_meeting(x,y+sign(vsp),oWall)				// dokler je vsaj 1px od zida ...
				or place_meeting(x,y+sign(vsp),oEnemyCorpse)) {	// ... ali trupla v smeri gibanja po y osi
			y += sign(vsp);										// se premika 1px v smeri gibanja po y osi
		}
		vsp = 0;												// se ustavi (po y osi)
	}
}

/// PREMIK PO NAVPIČNI OSI
y += vsp;				// y koordinati prišteje navpično hitrost


/// Animacija

// if	(NI	(na tleh)			or			(na nasprotnikovem truplu))
if (!(place_meeting(x,y+1,oWall) or place_meeting(x,y+1,oEnemyCorpse))) { 
	sprite_index = sPlayerA;					// določi sprite V ZRAKU
	image_speed = 0;							// NI animirano
	if (sign(vsp) > 0) image_index = 1;			// if (se premika navzdol) uporabi 2. sliko
	else image_index = 0;						// else uporabi 1. sliko
}
else { // if JE na tleh
	image_speed = 1;							// JE animirano
	if (hsp == 0) sprite_index = sPlayer;		// if (stoji pri miru) določi sprite STOJEČE
	else sprite_index = sPlayerR;				// else določi sprite V TEKU
}	

if (hsp != 0) image_xscale = sign(hsp);			// ko se premika, spremeni SMER SLIKE
												// da bo enaka SMERI PREMIKANJA PO X OSI
