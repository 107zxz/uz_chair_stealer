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
		
		DrawString(uiFont, "[" .. am1amt .. "]", (160,130), DI_SCREEN_CENTER|DI_TEXT_ALIGN_CENTER, Font.CR_Purple);
	}
}