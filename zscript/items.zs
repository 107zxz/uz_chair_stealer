class Money : Inventory {
	Default {
		Inventory.MaxAmount 9999;
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
	}
	
	override bool Used(Actor user) {
		user.A_Quake(1, 2, 0, 400, 0);
		A_SpawnItem("MoneyPuff",0,16);
		user.GiveInventory("Money",200);
		players[0].SetPSprite(PSP_WEAPON, players[0].ReadyWeapon.ResolveState("Grab"));
		Destroy();
		return true;
	}
}
