class SpearMine : Actor {
	Default {
		+FORCEXYBILLBOARD;
		+FLOAT;
		+NOGRAVITY;
		Monster;
	}
	
	States {
	Spawn:
		TNT1 A 0;
		TNT1 A 1 A_SpawnProjectile("MineChain", 32, 0, 0, CMF_AIMDIRECTION, 45);
		MINE B -1;
		Loop;
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