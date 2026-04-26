class Vending : Actor {
	Default {
		Height 72;
	}
	States {
	Spawn:
		VEND A -1;
		Stop;
	}
}