draw_self();

if (pflash > 0) {
	pflash--;
	shader_set(shWhite);
	draw_self();
	shader_reset();
}