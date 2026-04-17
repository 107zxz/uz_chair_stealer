// Does what it says, which right now isn't much
class SpearMine : Actor {
	Default {
		+FORCEXYBILLBOARD;
		+NOGRAVITY;
		Monster;
		-SOLID;
		PainChance 255;
		Speed 6;
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
			A_MonsterRail();
		}
		MINE A 30 BRIGHT {
			A_FaceTarget();
			target.Vel3DFromAngle((target.pos-pos).Length()/4, target.AngleTo(self), target.PitchTo(self));
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