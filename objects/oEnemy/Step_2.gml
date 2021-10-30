/// SMRT
if (hp <= 0) {												// if (nasprotnik več nima življenj)
	with (instance_create_layer(x,y,layer,oEnemyCorpse)) {	// ustvari truplo na isti poziciji
		direction = other.hitfrom;
		hsp = lengthdir_x(5,direction);
		vsp = lengthdir_x(5,direction) - 3;
		image_xscale = sign(hsp);							// obrne truplo v isto smer kot oEnemy
	}
	instance_destroy();										// uniči ta primer oEnemy
}	

