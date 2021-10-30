draw_self();

if (oPlayer.pflash > 0) {
	shader_set(shWhite);
	draw_self();
	shader_reset();
}