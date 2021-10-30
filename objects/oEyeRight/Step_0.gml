
//Shoots a Laser Every 11 Frames
firingdelay -= 1;
if (mouse_check_button(mb_left)) && (firingdelay < 0) {
	firingdelay = 11;
	with (instance_create_layer(x,y,"Lasers",oLaser)) {
		speed = 20;
		direction = other.image_angle + random_range(-3,3);
		image_angle = direction;
	}
}	

//Makes sure Eyes don't turn upside-down
if (image_angle > 90) && (image_angle < 270) {
	image_yscale = -1;
}
else {
	image_yscale = 1;
}
