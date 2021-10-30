/// DOGODEK Step
image_index = global.hp;	// indeks slike = št. življenj

xTo = follow.x;				// nastavi x na x kamere
yTo = follow.y;				// nastavi y na y kamere

x += (xTo - x) - 948;		// postavi na desni rob kamere
y += (yTo - y) - 528;		// postavi na zgornji rob kamere

if (instance_exists(follow)) {}