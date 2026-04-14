class GrabbyHand : Weapon {
	Default {
		Weapon.SlotNumber 1;
	}
	
	States {
	Spawn:
		HAND A -1;
		Stop;
	Ready:
		HAND A 1 A_WeaponReady;
		Loop;
	Select:
		TNT1 A 0 A_Raise;
		TNT1 A 0 A_Raise;
		TNT1 A 0 A_Raise;
		TNT1 A 0 A_Raise;
		HAND A 1 A_Raise;
		Loop;
	Deselect:
		TNT1 A 0 A_Lower;
		TNT1 A 0 A_Lower;
		TNT1 A 0 A_Lower;
		TNT1 A 0 A_Lower;
		HAND A 1 A_Lower;
		Loop;
// 	Fire:
// 		HAND AAA 1 {
// 			A_OverlayPivot(OverlayID(), 0, 2);
// 			A_OverlayRotate(OverlayID(), 360/16, WOF_ADD);
// 		}
// 		TNT1 A 0 A_CustomPunch(10, true, CPF_NOTURN);
// 		HAND AAAAAAAAAAAAA 1 {
// 			A_OverlayPivot(OverlayID(), 0, 2);
// 			A_OverlayRotate(OverlayID(), 360/16, WOF_ADD);
// 		}
// 		TNT1 A 0 A_OverlayRotate(OverlayID(), 0);
// 		Goto Ready;
	Fire:
		HAND A 2;
		HAND C 2 {
// 			A_Overlay(-100, "Flash");
			A_Quake(1.5, 4, 0, 400, 0);
			A_CustomPunch(10, true, 0, "ToonPuff");
		}
		HAND B 7 {
			
		}
		HAND BCAAA 2;
		Goto Ready;
// 	Flash:
// 		HAND F 3 BRIGHT A_Light1;
// 		Goto LightDone;
	}
}

class NotLuger : Weapon {
	Default {
		Weapon.SlotNumber 2;
	}

	States {
	Spawn:
		LUGA A -1;
		Stop;
	Ready:
		LUGE B 1 A_WeaponReady;
		Loop;
	Select:
		TNT1 A 0 A_Raise;
		TNT1 A 0 A_Raise;
		TNT1 A 0 A_Raise;
		TNT1 A 0 A_Raise;
		LUGE B 1 A_Raise;
		Loop;
	Deselect:
		TNT1 A 0 A_Lower;
		TNT1 A 0 A_Lower;
		TNT1 A 0 A_Lower;
		TNT1 A 0 A_Lower;
		LUGE B 1 A_Lower;
		Loop;
	Fire:
		LUGE B 1 Offset(32,32) {
			A_Overlay(-100, "Flash");
			A_Quake(3, 4, 0, 400, 0);
			A_FireBullets(0, 0, 0, 30, "ToonPuff");
		}
		LUGE C 0 Offset(0,30) {
			A_Overlay(100, "Spin");
		}
		LUGE CCCCCCCCCCCC 2 A_Quake(0.6, 2, 0, 400, 0);
		LUGE B 12 Offset(-1,32);
// 		LUGE B 1 Offset(12,32);
		Goto Ready;
	Spin:
		LUGE S 2 BRIGHT {
			A_OverlayFlags(OverlayID(), PSPF_RENDERSTYLE|PSPF_FORCEALPHA, true); //enable renderstyle and alpha change
			A_OverlayFlags(OverlayID(), PSPF_FLIP, false);
			A_OverlayRenderstyle(OverlayID(), STYLE_Translucent); //set additive renderstyle
			A_OverlayAlpha(OverlayID(), frandom(0.5, 1.0)); //randomize alpha
		}
		LUGE S 2 BRIGHT {
			A_OverlayAlpha(OverlayID(), frandom(0.5, 1.0)); //randomize alpha
			A_OverlayFlags(OverlayID(), PSPF_FLIP, true);
		}
		LUGE S 2 BRIGHT {
			A_OverlayAlpha(OverlayID(), frandom(0.5, 1.0)); //randomize alpha
			A_OverlayFlags(OverlayID(), PSPF_FLIP, false);
		}
		LUGE S 2 BRIGHT {
			A_OverlayAlpha(OverlayID(), frandom(0.5, 1.0)); //randomize alpha
			A_OverlayFlags(OverlayID(), PSPF_FLIP, true);
		}
		LUGE S 2 BRIGHT {
			A_OverlayAlpha(OverlayID(), frandom(0.5, 1.0)); //randomize alpha
			A_OverlayFlags(OverlayID(), PSPF_FLIP, false);
		}
		LUGE S 2 BRIGHT {
			A_OverlayAlpha(OverlayID(), frandom(0.5, 1.0)); //randomize alpha
			A_OverlayFlags(OverlayID(), PSPF_FLIP, true);
		}
		LUGE S 2 BRIGHT {
			A_OverlayAlpha(OverlayID(), frandom(0.5, 1.0)); //randomize alpha
			A_OverlayFlags(OverlayID(), PSPF_FLIP, false);
		}
		LUGE S 2 BRIGHT {
			A_OverlayAlpha(OverlayID(), frandom(0.5, 1.0)); //randomize alpha
			A_OverlayFlags(OverlayID(), PSPF_FLIP, true);
		}
		LUGE S 2 BRIGHT {
			A_OverlayAlpha(OverlayID(), frandom(0.5, 1.0)); //randomize alpha
			A_OverlayFlags(OverlayID(), PSPF_FLIP, false);
		}
		LUGE S 2 BRIGHT {
			A_OverlayAlpha(OverlayID(), frandom(0.5, 1.0)); //randomize alpha
			A_OverlayFlags(OverlayID(), PSPF_FLIP, true);
		}
		LUGE S 2 BRIGHT {
			A_OverlayAlpha(OverlayID(), frandom(0.5, 1.0)); //randomize alpha
			A_OverlayFlags(OverlayID(), PSPF_FLIP, false);
		}
		LUGE S 2 BRIGHT {
			A_OverlayAlpha(OverlayID(), 1.0); //randomize alpha
			A_OverlayFlags(OverlayID(), PSPF_FLIP, true);
		}
		Stop;
	Flash:
		LUGE F 3 BRIGHT A_Light2;
		Goto LightDone;
	}
}