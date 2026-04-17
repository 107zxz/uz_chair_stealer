// Does what it says, which right now isn't much
class SpearMine : Actor {
	Default {
		+FORCEXYBILLBOARD;
		+NOGRAVITY;
		+DONTTHRUST;
		Monster;
		-SOLID;
		Height 8;
		Radius 64;
		PainChance 255;
		Speed 0;
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
			target.Vel3DFromAngle((target.pos-pos).Length()/4, target.AngleTo(self), target.PitchTo(self));
			
			// Spawn a gem!
			A_SpawnItem("HyperLight", 32, 32);
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