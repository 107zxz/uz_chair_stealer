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

class MoneyPuff : Actor {
	Default {
		+NOBLOCKMAP
		+NOGRAVITY
		+ALLOWPARTICLES
		+RANDOMIZE
		+FORCEXYBILLBOARD
		Scale 0.15;
		
		RenderStyle "Translucent";
	}
	States {
	Spawn:
		MONY A 3 BRIGHT;
		MONY A 3 BRIGHT { Alpha = 0.5;  }
		Stop;
	}
}
