local E, L, V, P, G = unpack(ElvUI);
local addon = E:GetModule("AddOnSkins");

if(not addon:CheckAddOn("BindPad")) then return; end

function addon:BindPad()
	local S = E:GetModule("Skins");

	BindPadFrame:StripTextures(true);
	BindPadFrame:CreateBackdrop("Transparent");
	BindPadFrame.backdrop:Point("TOPLEFT", 10, -11);
	BindPadFrame.backdrop:Point("BOTTOMRIGHT", -31, 71);

	local function HandleMicroButton(button)
		local pushed = button:GetPushedTexture();
		local normal = button:GetNormalTexture();
		local disabled = button:GetDisabledTexture();

		button:GetHighlightTexture():Kill();

		local f = CreateFrame("Frame", nil, button);
		f:SetPoint("BOTTOMLEFT", button, "BOTTOMLEFT", 2, 0);
		f:SetPoint("TOPRIGHT", button, "TOPRIGHT", -2, -28);
		f:SetTemplate("Default");
		f:SetFrameLevel(button:GetFrameLevel() - 1);

		pushed:SetTexCoord(0.17, 0.87, 0.5, 0.908);
		pushed:SetInside(f);

		normal:SetTexCoord(0.17, 0.87, 0.5, 0.908);
		normal:SetInside(f);

		if(disabled) then
			disabled:SetTexCoord(0.17, 0.87, 0.5, 0.908);
			disabled:SetInside(f);
		end
	end

	for i = 1, 42 do
		local slot = _G["BindPadSlot" .. i];
		local slotIcon = _G["BindPadSlot" .. i .. "Icon"];
		local slotAddButton = _G["BindPadSlot" .. i .. "AddButton"];

		slot:SetNormalTexture(nil);
		slot:SetTemplate("Defaylt", true);
		slot:StyleButton(nil, nil, true);

		slotIcon:SetInside();
		slotIcon:SetTexCoord(unpack(E.TexCoords));
		slotIcon:SetDrawLayer("ARTWORK");

		_G["BindPadSlot" .. i .. "Border"]:SetTexture(1, 1, 0, 0.3);
		_G["BindPadSlot" .. i .. "Border"]:SetInside();

		slotAddButton:SetNormalTexture(nil);
		slotAddButton:SetPushedTexture(nil);
		slotAddButton:SetDisabledTexture(nil);
		slotAddButton:SetHighlightTexture(nil);

		slotAddButton.Text = slotAddButton:CreateFontString(nil, "OVERLAY");
		slotAddButton.Text:FontTemplate(nil, 22);
		slotAddButton.Text:Point("CENTER", 0, 0);
		slotAddButton.Text:SetText("+");
	end

	for i = 1, 4 do
		local headerTab = _G["BindPadFrameTab"..i]
		headerTab:StripTextures()
		headerTab.backdrop = CreateFrame("Frame", nil, headerTab)
		headerTab.backdrop:SetTemplate("Default", true)
		headerTab.backdrop:SetFrameLevel(headerTab:GetFrameLevel() - 1)
		headerTab.backdrop:Point("TOPLEFT", 3, -7)
		headerTab.backdrop:Point("BOTTOMRIGHT", -2, -1)

		headerTab:HookScript("OnEnter", S.SetModifiedBackdrop);
		headerTab:HookScript("OnLeave", S.SetOriginalBackdrop);
	end

	BindPadFrameTab1:Point("TOPLEFT", 80, -39)

	for i = 1, 5 do
		local tab = _G["BindPadProfileTab" .. i];
		local tabSubIcon = _G["BindPadProfileTab" .. i .. "SubIcon"];
		local bg = _G["BindPadProfileTab" .. i .. "Background"];

		tab:StripTextures();
		tab:SetTemplate("Defaylt", true);
		tab:StyleButton(nil, true);

		tab:GetNormalTexture():SetInside();
		tab:GetNormalTexture():SetTexCoord(unpack(E.TexCoords));
		tab:GetNormalTexture():SetDrawLayer("ARTWORK");

		tabSubIcon:SetTexCoord(unpack(E.TexCoords));
		bg:SetAlpha(0)
	end

	S:HandleCloseButton(BindPadFrameCloseButton);

	S:HandleCheckBox(BindPadFrameCharacterButton);
	S:HandleCheckBox(BindPadFrameShowHotkeysButton);

	S:HandleButton(BindPadFrameExitButton);

	HandleMicroButton(BindPadFrameOpenSpellBookButton);
	HandleMicroButton(BindPadFrameOpenMacroButton);
	HandleMicroButton(BindPadFrameOpenBagButton);

	BindPadBindFrame:StripTextures(true);
	BindPadBindFrame:SetTemplate("Transparent")
	BindPadBindFrame:Size(350, 150)

	S:HandleCloseButton(BindPadBindFrameCloseButton);

	S:HandleButton(BindPadBindFrameExitButton);
	S:HandleButton(BindPadBindFrameUnbindButton);

	BindPadMacroPopupFrame:StripTextures();
	BindPadMacroPopupFrame:CreateBackdrop("Transparent");
	BindPadMacroPopupFrame.backdrop:Point("TOPLEFT", 10, -9);
	BindPadMacroPopupFrame.backdrop:Point("BOTTOMRIGHT", -7, 9);

	BindPadMacroPopupNameLeft:SetTexture(nil);
	BindPadMacroPopupNameMiddle:SetTexture(nil);
	BindPadMacroPopupNameRight:SetTexture(nil);
	S:HandleEditBox(BindPadMacroPopupEditBox);

	BindPadMacroPopupScrollFrame:StripTextures();
	S:HandleScrollBar(BindPadMacroPopupScrollFrameScrollBar);

	for i = 1, 20 do
		local button = _G["BindPadMacroPopupButton" .. i];
		local buttonIcon = _G["BindPadMacroPopupButton" .. i .. "Icon"];

		button:StripTextures();
		button:StyleButton(nil, true);
		button:SetTemplate("Default", true);

		buttonIcon:SetInside();
		buttonIcon:SetTexCoord(unpack(E.TexCoords));
	end

	S:HandleButton(BindPadMacroPopupCancelButton);
	S:HandleButton(BindPadMacroPopupOkayButton);

	BindPadMacroFrame:StripTextures(true);
	BindPadMacroFrame:CreateBackdrop("Transparent");
	BindPadMacroFrame.backdrop:Point("TOPLEFT", 10, -11);
	BindPadMacroFrame.backdrop:Point("BOTTOMRIGHT", -31, 71);

	BindPadMacroFrameSlotButton:StripTextures();
	BindPadMacroFrameSlotButton:SetTemplate("Defaylt", true);

	BindPadMacroFrameSlotButtonIcon:SetInside();
	BindPadMacroFrameSlotButtonIcon:SetTexCoord(unpack(E.TexCoords));

	S:HandleScrollBar(BindPadMacroFrameScrollFrameScrollBar);

	BindPadMacroFrameTextBackground:SetTemplate("Defaylt");

	S:HandleButton(BindPadMacroFrameEditButton);
	S:HandleButton(BindPadMacroFrameTestButton);
	S:HandleButton(BindPadMacroFrameExitButton);
	S:HandleButton(BindPadMacroDeleteButton);

	S:HandleCloseButton(BindPadMacroFrameCloseButton);
end

addon:RegisterSkin("BindPad", addon.BindPad);