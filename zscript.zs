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
	
	override bool Used(Actor user) {
		Self.Destroy();
		return true;
	}
}

class Table : Actor {
	Default {
	+SOLID;
	Radius 12;
	Height 25;
	}
	States {
	Spawn:
		TABL A -1;
		Loop;
	}
}

class Coffee : PowerupGiver {
	Default {
		+NOGRAVITY;
		+Inventory.AUTOACTIVATE;
		Powerup.Duration -5;
		Powerup.Type "PowerSpeed";
	}

	States {
	Spawn:
		COFF A -1 Bright;
		Loop;
	}
}