local E, L, V, P, G = unpack(ElvUI)
local AS = E:GetModule("AddOnSkins")
local S = E:GetModule("Skins")

local _G = _G

local SquareButton_SetIcon = SquareButton_SetIcon

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
	Spy_MainWindow.CloseButton:Size(32)
	Spy_MainWindow.CloseButton:Point("TOPRIGHT", 2, -6)

	S:HandleNextPrevButton(Spy_MainWindow.RightButton)
	SquareButton_SetIcon(Spy_MainWindow.RightButton, "RIGHT")
	Spy_MainWindow.RightButton:Size(16)
	Spy_MainWindow.RightButton:Point("TOPRIGHT", -27, -14)

	S:HandleNextPrevButton(Spy_MainWindow.LeftButton)
	SquareButton_SetIcon(Spy_MainWindow.LeftButton, "LEFT")
	Spy_MainWindow.LeftButton:Size(16)
	Spy_MainWindow.LeftButton:Point("RIGHT", Spy_MainWindow.RightButton, "LEFT", -3, 0)

	S:HandleButton(Spy_MainWindow.ClearButton)
	Spy_MainWindow.ClearButton:Size(16)
	Spy_MainWindow.ClearButton:Point("RIGHT", Spy_MainWindow.LeftButton, "LEFT", -3, 0)
	Spy_MainWindow.ClearButton.texture = Spy_MainWindow.ClearButton:CreateTexture(nil, "OVERLAY")
	Spy_MainWindow.ClearButton.texture:SetTexture("Interface\\Buttons\\UI-GroupLoot-Pass-Up")
	Spy_MainWindow.ClearButton.texture:SetInside()
	AS:Desaturate(Spy_MainWindow.ClearButton)

	Spy_MainWindow.DragBottomLeft:SetNormalTexture(nil)
	Spy_MainWindow.DragBottomRight:SetNormalTexture(nil)

	hooksecurefunc(Spy, "ShowMapTooltip", function()
		if(Spy.MapTooltip) then
			Spy.MapTooltip:SetTemplate("Transparent")
		end
	end)
end

S:AddCallbackForAddon("Spy", "Spy", LoadSkin)