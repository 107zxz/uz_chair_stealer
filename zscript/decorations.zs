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

class Table : Actor {
	Default {
	+SOLID;
	+NOBLOOD;
	Radius 24;
	Height 32;
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
		Radius 48;
		Height 24;
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

class Vase : Actor {
	States {
	Spawn:
		VASE A -1;
		Loop;
	}
}


