local E, L, V, P, G = unpack(ElvUI)
local AS = E:GetModule("AddOnSkins")
local S = E:GetModule("Skins")

local function LoadSkin()
	if(not E.private.addOnSkins.MinimalArchaeology) then return end

	MinArchMain:StripTextures()
	MinArchMain:SetTemplate("Transparent")

	S:HandleCloseButton(MinArchMainButtonClose)
	MinArchMainButtonClose.backdrop:SetAllPoints()
	MinArchMainButtonClose:Size(16)
	MinArchMainButtonClose:Point("TOPRIGHT", -4, -3)

	AS:Desaturate(MinArchMainButtonOpenADI)
	MinArchMainButtonOpenADI:Point("TOPRIGHT", -67, -3)
	MinArchMainButtonOpenADI:GetNormalTexture():SetTexCoord(unpack(E.TexCoords))

	AS:Desaturate(MinArchMainButtonOpenHist)
	MinArchMainButtonOpenHist:Point("TOPRIGHT", -46, -3)
	MinArchMainButtonOpenHist:GetNormalTexture():SetTexCoord(unpack(E.TexCoords))

	AS:Desaturate(MinArchMainButtonOpenArch)
	MinArchMainButtonOpenArch:Point("TOPRIGHT", -25, -3)
	MinArchMainButtonOpenArch:GetNormalTexture():SetTexCoord(unpack(E.TexCoords))

	MinArchMainSkillBar:StripTextures()
	MinArchMainSkillBar:CreateBackdrop()
	MinArchMainSkillBar:SetStatusBarTexture(E["media"].normTex)
	MinArchMainSkillBar:SetStatusBarColor(0.13, 0.35, 0.80)
	MinArchMainSkillBar:Point("TOP", 2, -24)
	MinArchMainSkillBar:Width(253)

	for i = 1, 10 do
		local bar = _G["MinArchMainArtifactBar"..i]
		local button = _G["MinArchMainArtifactBar"..i.."ButtonSolve"]

		bar:StripTextures()
		bar:CreateBackdrop()
		bar:SetStatusBarTexture(E["media"].normTex)
		bar:SetStatusBarColor(1.0, 0.4, 0)

		S:HandleButton(button)
		button:Height(17)
		button:Point("TOPLEFT", bar, "TOPRIGHT", 5, 2)

		S:HandleCheckBox(_G["MinArchOptionPanelHideArtifact"..i])
		S:HandleCheckBox(_G["MinArchOptionPanelFragmentCap"..i])

		if _G["MinArchOptionPanelUseKeystones"..i] then 
			S:HandleCheckBox(_G["MinArchOptionPanelUseKeystones"..i]) 
		end
	end

	MinArchDigsites:StripTextures()
	MinArchDigsites:SetTemplate("Transparent")

	S:HandleCloseButton(MinArchDigsitesButtonClose)
	MinArchDigsitesButtonClose.backdrop:SetAllPoints()
	MinArchDigsitesButtonClose:Size(16)
	MinArchDigsitesButtonClose:Point("TOPRIGHT", -4, -3)

	MinArchDigsitesKalimdorButton:GetNormalTexture():SetTexCoord(unpack(E.TexCoords))
	MinArchDigsitesKalimdorButton:GetPushedTexture():SetTexCoord(unpack(E.TexCoords))
	MinArchDigsitesKalimdorButton:GetHighlightTexture():SetTexCoord(unpack(E.TexCoords))

	MinArchDigsitesEasternButton:GetNormalTexture():SetTexCoord(unpack(E.TexCoords))
	MinArchDigsitesEasternButton:GetPushedTexture():SetTexCoord(unpack(E.TexCoords))
	MinArchDigsitesEasternButton:GetHighlightTexture():SetTexCoord(unpack(E.TexCoords))

	MinArchDigsitesOutlandsButton:GetNormalTexture():SetTexCoord(unpack(E.TexCoords))
	MinArchDigsitesOutlandsButton:GetPushedTexture():SetTexCoord(unpack(E.TexCoords))
	MinArchDigsitesOutlandsButton:GetHighlightTexture():SetTexCoord(unpack(E.TexCoords))

	MinArchDigsitesNorthrendButton:GetNormalTexture():SetTexCoord(unpack(E.TexCoords))
	MinArchDigsitesNorthrendButton:GetPushedTexture():SetTexCoord(unpack(E.TexCoords))
	MinArchDigsitesNorthrendButton:GetHighlightTexture():SetTexCoord(unpack(E.TexCoords))

	MinArchHist:StripTextures()
	MinArchHist:SetTemplate("Transparent")

	S:HandleCloseButton(MinArchHistButtonClose)
	MinArchHistButtonClose.backdrop:SetAllPoints()
	MinArchHistButtonClose:Size(16)
	MinArchHistButtonClose:Point("TOPRIGHT", -4, -3)

	MinArchTooltipIcon.icon:SetTexCoord(unpack(E.TexCoords))

	hooksecurefunc(MinArch, "CreateHistoryList", function()
		MinArchScrollFrame:StripTextures()
		S:HandleSliderFrame(MinArchScrollBar)
	end)

	hooksecurefunc(MinArch, "CreateDigSitesList", function()
		MinArchDSScrollFrame:StripTextures()
		S:HandleSliderFrame(MinArchScrollDSBar)
	end)

	-- Interface Options
	MinArchOptionPanelHideArtifact:StripTextures()
	MinArchOptionPanelHideArtifact:SetTemplate("Transparent")

	MinArchOptionPanelFragmentCap:StripTextures()
	MinArchOptionPanelFragmentCap:SetTemplate("Transparent")

	MinArchOptionPanelUseKeystones:StripTextures()
	MinArchOptionPanelUseKeystones:SetTemplate("Transparent")

	MinArchOptionPanelMiscOptions:StripTextures()
	MinArchOptionPanelMiscOptions:SetTemplate("Transparent")

	MinArchOptionPanelFrameScale:StripTextures()
	MinArchOptionPanelFrameScale:SetTemplate("Transparent")

	local checkbox = {
		MinArchOptionPanelMiscOptionsHideMinimap,
		MinArchOptionPanelMiscOptionsDisableSound,
		MinArchOptionPanelMiscOptionsStartHidden,
		MinArchOptionPanelMiscOptionsHideAfter,
		MinArchOptionPanelMiscOptionsWaitForSolve
	}

	for _, boxes in pairs(checkbox) do
		S:HandleCheckBox(boxes)
	end

	S:HandleSliderFrame(MinArchOptionPanelFrameScaleSlider)
end

S:AddCallbackForAddon("MinimalArchaeology", "MinimalArchaeology", LoadSkin)