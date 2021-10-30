/// IZSTRELI LASER VSAKIH 13 TIKOV
firingdelay -= 1;					// zmanjša zakasnitev za 1
if	(mouse_check_button(mb_left))	// if (pritisnjen levi gumb na miški)
  && (firingdelay < 0) {			//	&& zakasnitev je manj kot 0
	firingdelay = 13;			// nastavi zakasnitev na 13
	with (instance_create_layer(x,y,"Lasers",oLaser)) {		// ustvari laser
		speed = 20;											// hitrost laserja	
		direction = other.image_angle + random_range(-3,3);	// smer laserja je enaka smeri slike očesa
		image_angle = direction;							// smer slike laserja je enaka smeri slike očesa
	}
}	

//Makes sure Eyes don't turn upside-down
if (image_angle > 90) && (image_angle < 270) {
	image_yscale = -1;
}
else {
	image_yscale = 1;
}	
