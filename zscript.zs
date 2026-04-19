version "4.14.3"

#include "zscript/weapons.zs"
#include "zscript/decorations.zs"
#include "zscript/enemies.zs"
#include "zscript/hud.zs"


class GamePlayer : PlayerPawn {
	Default {
		Player.DisplayName "Amy";
		Player.JumpZ 16;
		Player.Startitem "NotLuger";
		Player.Startitem "HyperLight";
		MeleeRange 80;
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
		Height 60;
		Radius 15;
	}

	States {
	Spawn:
		DOOR A -1;
		Stop;
	Pain:
		TNT1 A 0 {
		
			let door_angle = absangle(angle, AngleTo(players[0].mo));
			if (door_angle > 90) return;
		
			// Close all other doors
			let doorit = ThinkerIterator.Create("WoodDoor");
			Actor door;
			while (door = WoodDoor(doorit.Next())) {
				if (door.bSOLID) continue;
			
				door.bNOCLIP = true;
				door.Warp(door, 21, -20, 0, -90);
				door.bNOCLIP = false;
				door.bSOLID = true;
				door.bSHOOTABLE = true;
			}
			
			bNOCLIP = true;
			bSOLID = false;
			A_Warp(AAPTR_DEFAULT, -20, -21, 0, 90);
			bNOCLIP = false;
			
			bSHOOTABLE = false;
			
			// Spawn something nice :)
			A_SpawnItem("HyperLight", 30, 32);
		}
		DOOR A -1;
		Goto Spawn;
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

