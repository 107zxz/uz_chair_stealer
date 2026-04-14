#include "zscript/weapons.zs"

class EmptyHUD : BaseStatusBar {}

class GamePlayer : PlayerPawn {
	Default {
		Player.DisplayName "Amy";
		Player.JumpZ 16;
		Player.Startitem "GrabbyHand";
		Player.Startitem "NotLuger";
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
		
		vel.X *= 0.8;
		vel.Y *= 0.8;
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
	
	
// 	override bool Used(Actor user) {
// 		Self.Destroy();
// 		return true;
// 	}
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



class ToonPuff : Actor {
	Default {
		+NOBLOCKMAP
		+NOGRAVITY
		+ALLOWPARTICLES
		+RANDOMIZE
		+FORCEXYBILLBOARD
		Scale 0.3;
	}
	States {
	Spawn:
		HAND F 3 BRIGHT;
	Melee:
		HAND F 3 BRIGHT;
		Stop;
	}
}

class Ladder : Actor {
	Default {
	}
	
	States {
	Spawn:
		LADD B -1;
		Loop;
	}
}

class WoodDoor : Actor {
	Default {
		+SHOOTABLE;
		+DONTTHRUST;
		+NOBLOOD;
		+SOLID;
		PainChance 255;
		Height 80;
	}

	States {
	Spawn:
		DOOR A -1;
		Stop;
	Pain:
		TNT1 A 0 {
		
			if (AngleTo(players[0].mo) > 0.5) return;
		
			// Close all other doors
			let doorit = ThinkerIterator.Create("WoodDoor");
			Actor door;
			while (door = WoodDoor(doorit.Next())) {
				if (door.bSOLID) continue;
			
				door.bNOCLIP = true;
				door.Warp(door, 20, -25, 0, -90);
				door.bNOCLIP = false;
				door.bSOLID = true;
				door.bSHOOTABLE = true;
			}
			
			bNOCLIP = true;
			A_Warp(AAPTR_DEFAULT, -25, -20, 0, 90);
			bNOCLIP = false;
			bSOLID = false;
			bSHOOTABLE = false;
		}
		DOOR A -1;
		Goto Spawn;
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

class FireChase : Actor {
	Default {
		+CANPASS;
		+ISMONSTER;
		+NOCLIP;
		+FLOAT;
		Speed 5;
	}
	States {
	Spawn:
		FIRE AABBCC 1 BRIGHT A_Chase;
		Loop;
	Melee:
		TNT1 A 0 A_CustomMeleeAttack(666);
		Goto Spawn;
	}
}

