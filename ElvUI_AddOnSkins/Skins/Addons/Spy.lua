local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule("Skins")

local function LoadSkin()
	if(not E.private.addOnSkins.Spy) then return end

	Spy_MainWindow:StripTextures()
	Spy_MainWindow:SetTemplate("Transparent")

	Spy_AlertWindow:StripTextures()
	Spy_AlertWindow:SetTemplate("Transparent")
	Spy_AlertWindow:Point("TOP", UIParent, "TOP", 0, -130)

	for i = 1, 10 do
		local bar = _G["Spy_MainWindow_Bar"..i]

		bar:StyleButton()
		bar.StatusBar:SetStatusBarTexture(E["media"].normTex)
		bar.LeftText:FontTemplate(nil, 12)
		bar.RightText:FontTemplate(nil, 12)
	end

	Spy.MainWindow.Title:FontTemplate(nil, 12)

	S:HandleCloseButton(Spy_MainWindow.CloseButton)
	Spy_MainWindow.CloseButton.text:Point("CENTER")
	Spy_MainWindow.CloseButton:Size(18)

	S:HandleCloseButton(Spy_MainWindow.ClearButton)
	Spy_MainWindow.ClearButton.text:SetText("c")
	Spy_MainWindow.ClearButton.text:Point("CENTER", 0, 2)
	Spy_MainWindow.ClearButton:Size(18)

	S:HandleCloseButton(Spy_MainWindow.LeftButton)
	Spy_MainWindow.LeftButton.text:SetText("<")
	Spy_MainWindow.LeftButton:Size(18)

	S:HandleCloseButton(Spy_MainWindow.RightButton)
	Spy_MainWindow.RightButton.text:SetText(">")
	Spy_MainWindow.RightButton:Size(18)

	Spy_MainWindow.DragBottomLeft:SetNormalTexture(nil)
	Spy_MainWindow.DragBottomRight:SetNormalTexture(nil)

	hooksecurefunc(Spy, "ShowMapTooltip", function()
		if(Spy.MapTooltip) then
			Spy.MapTooltip:SetTemplate("Transparent")
		end
	end)
end

S:AddCallbackForAddon("Spy", "Spy", LoadSkin)