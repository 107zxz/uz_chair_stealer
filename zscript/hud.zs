class EmptyHUD : BaseStatusBar {
	HUDFont uiFont;
	
	override void Init() {
		Super.Init();
		uiFont = HUDFont.Create(smallfont);
	}

	override void Draw (int state, double TicFrac) {
		Super.Draw(state, TicFrac);
		
		Ammo am1, am2;
		int am1amt, am2amt;
		[am1, am2, am1amt, am2amt] = GetCurrentAmmo();
		
		int moneyamt, moneymax;
		[moneyamt, moneymax] = GetAmount("Money");
		
		DrawString(uiFont, "[" .. am1amt .. "]", (160,130), DI_SCREEN_CENTER|DI_TEXT_ALIGN_CENTER, Font.CR_Purple);
		DrawString(uiFont, "[" .. CPlayer.health .. "]", (160,140), DI_SCREEN_CENTER|DI_TEXT_ALIGN_CENTER, Font.CR_Red);
		
		DrawString(uiFont, "[$" .. moneyamt .. "]", (10,10), 0, Font.CR_Green);
	}
}