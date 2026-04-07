class EmptyHUD : BaseStatusBar {}

class GamePlayer : PlayerPawn {
	Default {
		Player.DisplayName "Amy";
	}
	States {
	Spawn:
		WICH A -1;
		Loop;
	See:
		WICH A 4;
		Loop;
	}
}

class Safe : Actor {
	Default {
	+SOLID;
	+NOGRAVITY;
	Radius 12;
	}
	States {
	Spawn:
		SAFE A -1;
		Loop;
	}
}

class Table : Actor {
	Default {
	+SOLID;
	Radius 12;
	}
	States {
	Spawn:
		TABL A -1;
		Loop;
	}
}