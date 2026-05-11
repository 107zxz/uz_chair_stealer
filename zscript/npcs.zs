class Vending : Actor {
	Default {
	+SOLID
	Height 72;
	}
	States {
	Spawn:
		VEND A -1;
		Stop;
	}
	
	Actor display;
	int stock;
	
	override void BeginPlay() {
		Super.BeginPlay();
		
		bool spawned;
		[spawned, display] = A_SpawnItem("VendingPicture", 10, 46);
		
		stock = 1;
	}
	
	override bool Used(Actor user) {
		if (stock == 0) return false;
		
		if (user.CountInv("Money") < 200) {
			A_PrintBold("Not enough money!");
			return false;
		}
		
		user.TakeInventory("Money", 200);
		A_Quake(7, 4, 0, 400, 0);
		
		stock -= 1;
		if (stock == 0) {
			display.SetStateLabel("SoldOut");
		}
		return true;
	}
}

class VendingPicture : Actor {
	Default {
	+NOGRAVITY
	+WALLSPRITE
	Scale 0.20;
	}
	States {
	Spawn:
		VENP B -1 Bright;
		Stop;
	SoldOut:
		VENP A -1 Bright;
		Stop;
	}
}