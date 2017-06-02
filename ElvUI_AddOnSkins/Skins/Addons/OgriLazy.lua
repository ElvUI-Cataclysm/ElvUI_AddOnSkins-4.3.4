local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule("Skins")

local function LoadSkin()
	if(not E.private.addOnSkins.OgriLazy) then return end

	Relic_View:SetTemplate("Transparent")
	Relic_View:SetScale(GetCVar("uiScale"))

	S:HandleCloseButton(Relic_ViewCloseButton)
	Relic_ViewCloseButton:Point("TOPLEFT", 3, -3)
	Relic_ViewCloseButton:Size(16)
	Relic_ViewCloseButton.backdrop:SetAllPoints()

	for i = 1, 4 do
		local Relic = _G["Relic_View_Set"..i]
		local RelicTex = _G["Relic_View_Set"..i.."Tex"]

		Relic:SetTemplate()
		Relic:StyleButton()
		Relic:SetBackdropColor(0, 0, 0, 0)
		Relic.backdropTexture:SetAlpha(0)

		RelicTex:SetTexCoord(unpack(E.TexCoords))
	end

	for i = 1, 10 do
		local Relic = _G["Relic_View_Replay"..i]
		local RelicTex = _G["Relic_View_Replay"..i.."Tex"]

		Relic:SetTemplate()
		Relic:StyleButton()
		Relic:SetBackdropColor(0, 0, 0, 0)
		Relic.backdropTexture:SetAlpha(0)

		RelicTex:SetTexCoord(unpack(E.TexCoords))
	end

	-- Interface Options
	S:HandleCheckBox(Relic_cfgHelpTooltip)
	S:HandleCheckBox(Relic_cfgUnbindInCombat)
	S:HandleCheckBox(Relic_cfgEnableHotkeys)
	S:HandleCheckBox(Relic_cfgEnableDebug)

	S:HandleButton(Relic_cfgKeyGreen)
	S:HandleButton(Relic_cfgKeyYellow)
	S:HandleButton(Relic_cfgKeyBlue)
	S:HandleButton(Relic_cfgKeyRed)
end

S:AddCallbackForAddon("Ogri'Lazy", "Ogri'Lazy", LoadSkin)