local E, L, V, P, G = unpack(ElvUI);
local addon = E:GetModule("AddOnSkins");

if(not addon:CheckAddOn("VanasKoS")) then return; end

function addon:VanasKoS()
	local S = E:GetModule("Skins");

	VanasKoS_WarnFrame:SetTemplate("Transparent", nil, true);
	VanasKoS_WarnFrame.SetBackdropBorderColor = E.noop;

	for i = 1, 2 do
		S:HandleTab(_G["VanasKoSFrameTab" .. i]);
	end

	S:HandleDropDownBox(VanasKoSFrameChooseListDropDown, 145);
	VanasKoSFrameChooseListDropDown:Point("TOPLEFT", 20, -40)

	S:HandleCheckBox(VanasKoSListFrameCheckBox);
	VanasKoSListFrameCheckBox:Point("TOPLEFT", 225, -41)

	S:HandleButton(VanasKoSListFrameAddButton);
	VanasKoSListFrameAddButton:SetPoint("BOTTOMRIGHT", VanasKoSListFrame, "BOTTOMRIGHT", -39, 82);
	S:HandleButton(VanasKoSListFrameRemoveButton);
	VanasKoSListFrameRemoveButton:SetPoint("RIGHT", VanasKoSListFrameAddButton, "LEFT", -2, 0);
	S:HandleButton(VanasKoSListFrameChangeButton);
	VanasKoSListFrameChangeButton:SetPoint("RIGHT", VanasKoSListFrameRemoveButton, "LEFT", -2, 0);
	S:HandleButton(VanasKoSListFrameConfigurationButton);
	VanasKoSListFrameConfigurationButton:SetPoint("BOTTOM", VanasKoSListFrameAddButton, "TOP", 0, 2);

	VanasKoSListTooltip:StripTextures();
	VanasKoSListTooltip:CreateBackdrop("Transparent");

	for i = 1, 9 do
		_G["VanasKoSListFrameColButton" .. i]:StripTextures();
		_G["VanasKoSListFrameColButton" .. i]:StyleButton();
	end

	for i = 1, 17 do
		local button = _G["VanasKoSListFrameListButton"..i];

		button:StyleButton()

		button.stripe = button:CreateTexture(nil, "BACKGROUND");
		button.stripe:SetTexture("Interface\\GuildFrame\\GuildFrame");
		button.stripe:SetTexCoord(0.362, 0.381, 0.958, 0.998);
		button.stripe:SetInside()
	end

	VanasKoSListFrameListButton1:Point("TOPLEFT", 21, -95)

	VanasKoSListFrameToggleRightButton:Size(27);
	S:HandleNextPrevButton(VanasKoSListFrameToggleRightButton);
	VanasKoSListFrameToggleRightButton:SetPoint("BOTTOMRIGHT", VanasKoSListFrame, "BOTTOMRIGHT", -39, 130);
	VanasKoSListFrameToggleLeftButton:Size(27);
	S:HandleNextPrevButton(VanasKoSListFrameToggleLeftButton);

	VanasKoSListFrameNoTogglePatch:StripTextures();

	VanasKoSListScrollFrame:StripTextures();
	S:HandleScrollBar(VanasKoSListScrollFrameScrollBar);

	VanasKoSListFrameSearchBox:SetSize(215, 20);
	S:HandleEditBox(VanasKoSListFrameSearchBox);
	VanasKoSListFrameSearchBox:SetPoint("BOTTOMLEFT", VanasKoSListFrame, "BOTTOMLEFT", 17, 107);

	VanasKoSFrame:StripTextures(true);
	VanasKoSFrame:CreateBackdrop("Transparent");
	VanasKoSFrame.backdrop:Point("TOPLEFT", 11, -12);
	VanasKoSFrame.backdrop:Point("BOTTOMRIGHT", -34, 75);

	S:HandleCloseButton(VanasKosFrameCloseButton);

	S:HandleTab(FriendsFrameTab5);
	FriendsFrameTab5:ClearAllPoints();
	FriendsFrameTab5:SetPoint("TOPLEFT", FriendsFrameTab4, "TOPRIGHT", -15, 0);

	S:HandleDropDownBox(VanasKoSPvPStatsCharacterDropDown, 90);
	VanasKoSPvPStatsCharacterDropDown:SetPoint("RIGHT", VanasKoSListFrameToggleLeftButton, "LEFT", 6, -4);
	S:HandleDropDownBox(VanasKoSPvPStatsTimeSpanDropDown, 90);
	VanasKoSPvPStatsTimeSpanDropDown:SetPoint("RIGHT", VanasKoSPvPStatsCharacterDropDown, "LEFT", 26, 0);
end

addon:RegisterSkin("VanasKoS", addon.VanasKoS);