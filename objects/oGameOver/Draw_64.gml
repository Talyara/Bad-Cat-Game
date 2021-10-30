draw_set_color(c_white);
draw_set_font(ComicSans);

if ((instance_exists(oPlayerCorpse) || (oPlayer.outofbounds==1)) && oFlag.winner==0) {
	draw_text_transformed(800, 550, "SCORE: " + string(global.kills), 2,2,0);
	draw_text_transformed(800, 850, "Press [R] to restart!", 1,1,0);
	draw_set_color(c_red);
	draw_text_transformed(500, 400, "YOU DIED :'c", 4,4,0);
}	

if (oFlag.winner==1) {
	draw_text_transformed(800, 550, "SCORE: " + string(global.kills), 2,2,0);
	draw_text_transformed(800, 850, "Press [R] to restart!", 1,1,0);
	draw_set_color(c_lime);
	draw_text_transformed(400, 400, "YOU WON \\(^w^)/", 4,4,0);
}	

