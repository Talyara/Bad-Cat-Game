/// IZPIŠE TOČKE
if instance_exists(oPlayer) 					// if (igralec obstaja)
	&& (global.kills > 0) {						// IN (je vsaj en nasprotnik mrtev)
	draw_set_color(c_white);					// uporabi belo barvo
	draw_set_font(ComicSans);					// določi pisavo
	draw_text_transformed						// izpiše v zgornjem desnem kotu ...
		(1480, 12, string(global.kills) 		// ... število mrtvih nasprotnikov ...
		+ " Pointless Murders >:3c", 1,1,0);	// ... in tekst
}	

