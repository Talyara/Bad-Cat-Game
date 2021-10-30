/// TRK Z NASPROTNIKOM oEnemy
with (other) {					// obratuje z oEnemy
	hp--;						// zmanjša hp za 1
	hitfrom = other.direction;	// hitfrom je enak smeri ...
}								// ... od oEnemy do oLaser

instance_destroy();

	flash = 3;