class EmptyHUD : BaseStatusBar {}

class GamePlayer : PlayerPawn {
	Default {
		Player.DisplayName "Amy";
		Player.JumpZ 16;
		Player.Startitem "GrabbyHand";
		Speed 2;
	}
	States {
	Spawn:
		AMEE A -1;
		Loop;
	See:
		AMEE ABCD 4;
		Loop;
	}
	
	override void Tick() {
		Super.Tick();
		
		vel *= 0.8;
	}
}

class Safe : Actor {
	Default {
	+SOLID;
	+NOGRAVITY;
	+SHOOTABLE;
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
	
	
// 	override bool Used(Actor user) {
// 		Self.Destroy();
// 		return true;
// 	}
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
		COFF A -1;
		Loop;
	}
}

class Lamp : Actor {
	Default {
	+NOGRAVITY;
	Height 24;
	}
	
	States {
	Spawn:
		LAMP A -1;
		Loop;
	}
}

class GrabbyHand : Weapon {
	Default {
		
	}
	
	States {
	Spawn:
		HAND A -1;
		Stop;
	Ready:
		HAND A 1 A_WeaponReady;
		Loop;
	Select:
		HAND A 1 A_Raise;
		Loop;
	Deselect:
		HAND A 1 A_Lower;
		Loop;
	Fire:
		HAND AAA 1 {
			A_OverlayPivot(OverlayID(), 0, 2);
			A_OverlayRotate(OverlayID(), 360/16, WOF_ADD);
		}
		TNT1 A 0 A_CustomPunch(10, true, CPF_NOTURN);
		HAND AAAAAAAAAAAAA 1 {
			A_OverlayPivot(OverlayID(), 0, 2);
			A_OverlayRotate(OverlayID(), 360/16, WOF_ADD);
		}
		TNT1 A 0 A_OverlayRotate(OverlayID(), 0);
		Goto Ready;
	}
}