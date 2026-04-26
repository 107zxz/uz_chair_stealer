// Does what it says, which right now isn't much
class SpearMine : Actor {
	Default {
		+FORCEXYBILLBOARD;
		+NOGRAVITY;
		+DONTTHRUST;
		+NOBLOOD;
		Monster;
		-SOLID;
		Height 32;
		Radius 64;
		PainChance 255;
		Speed 0;
		Health 999999999;
	}
	
	States {
	Spawn:
		MINE B 10 A_Look;
		Loop;
	See:
		MINE B 3 A_Chase;
		Loop;
	Pain:
		Goto Pissile;
	Pissile:
		MINE A 5 A_FaceTarget;
		MINE A 10 BRIGHT {
			A_FaceTarget();
		}
		MINE A 20 BRIGHT {
			A_FaceTarget();
			A_MonsterRail();
// 			target.Vel3DFromAngle((target.pos-pos).Length()/4, target.AngleTo(self), target.PitchTo(self));
			target.Vel3DFromAngle((target.pos-pos).Length()/3, target.AngleTo(self), target.PitchTo(self));
			target.GiveInventory("HyperLight", 1);
			
			// Spawn a gem!
			//A_SpawnItem("HyperLight", 32, 32);
		}
		Goto See;
	}
}

class MineChain : Actor {
	Default {
		+ROLLSPRITE;
		+WALLSPRITE;
		+NOGRAVITY;
	}

	States {
	Spawn:
		CAIN A -1;
		Stop;
	}
}

// Zap Gremlin
class ZapZoob : Actor {
	Default {
		Monster;
		+NOBLOOD;
		+NOTAUTOAIMED;
		+AMBUSH;
		Speed 10;
		Radius 10;
		Height 8;
	}
	
	void ShootTheNine() {
		A_FaceMaster();
		A_CustomRailgun(0, 0, "yellow", "cyan");
	}
	
	States {
	Spawn:
		ZOOB A 6 BRIGHT {
			bXFLIP=false;
			ShootTheNine();
		}
		ZOOB A 6 BRIGHT {
			bXFLIP=true;
			A_Look();
		}
		Loop;
	Melee:
		ZOOB A 10 BRIGHT {
			Thrust();
			AddZ(32);
		}
		Goto See;
	Missile:
		ZOOB A 4 BRIGHT Thrust;
	See:
		ZOOB A 4 BRIGHT {
			bXFLIP=false;
			A_FaceMaster();
			ShootTheNine();
			A_Chase();
		}
		ZOOB A 4 BRIGHT {
			bXFLIP=true;
			A_Chase();
		}
		Loop;
	Death:
		ZOOB A 9 A_Quake(7, 4, 0, 400, 0);
		HAND F 10 BRIGHT;
		TNT1 A 0 Destroy();
		Stop;
	}
}

class ZoobRadiator : Actor {
	Default {
		+SHOOTABLE;
		+NOBLOOD
		Health 1;
		Height 32;
		Radius 16;
	}
	
	States {
	Spawn:
		RADI A -1;
		Loop;
	Death:
		FIRE A 3 BRIGHT A_KillChildren;
		FIRE B 3 BRIGHT;
		FIRE C 3 BRIGHT;
		TNT1 A 0 {
			A_SpawnItemEx("HyperLight");
			
			Destroy();
		}
		Stop;
	}
	
	override void BeginPlay() {
		Super.BeginPlay();
		
		A_SpawnItemEx("ZapZoob", 64, 0, 0, 0, 0, 0, 0, SXF_SETMASTER);
	}
}
