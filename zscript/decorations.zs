class Lamp : Actor {
	Default {
	+NOGRAVITY;
	+BRIGHT;
	Height 24;
	}
	
	States {
	Spawn:
		LAMP A -1;
		Loop;
	}
}

class Bulb : Actor {
	Default {
	+NOGRAVITY;
	+BRIGHT;
	Height 18;
	Radius 2;
	}
	
	States {
	Spawn:
		BULB A -1;
		Loop;
	}
}


class Safe : Actor {
	Default {
	+SOLID;
	+NOGRAVITY;
	+SHOOTABLE;
	+NOBLOOD;
	Painchance 255;
	Radius 12;
	}
	States {
	Spawn:
		SAFE A -1;
		Loop;
	Pain:
		TNT1 A 0 A_Remove(AAPTR_DEFAULT);
		Stop;
	}
}

class Table : Actor {
	Default {
	+SOLID;
	+NOBLOOD;
	Radius 12;
	Height 25;
	}
	States {
	Spawn:
		TABL A -1;
		Loop;
	}
}


class Bed : Actor {
	Default {
		+SOLID;
	}
		
	States {
	Spawn:
		BEDD A -1;
		Loop;
	}
}

class Shelf : Actor {
	Default {
		+SOLID;
	}
		
	States {
	Spawn:
		SHEL A -1;
		Loop;
	}
}

class Window : Actor {
	Default {
		+NOGRAVITY;
	}
		
	States {
	Spawn:
		WIND A -1;
		Loop;
	}
}

class WindowSmashed : Actor {
	Default {
		+NOGRAVITY;
	}
		
	States {
	Spawn:
		WIND B -1;
		Loop;
	}
}

class WifiExtender : Actor {
	States {
	Spawn:
		WIFI A -1 BRIGHT;
		Loop;
	}
}


