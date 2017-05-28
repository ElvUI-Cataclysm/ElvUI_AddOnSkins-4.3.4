local E, L, V, P, G = unpack(ElvUI);
local S = E:GetModule("Skins");

local find = string.find;

local function LoadSkin()
	if(not E.private.addOnSkins.TradeskillInfo) then return; end

	TradeskillInfoFrame:SetTemplate("Transparent")

	S:HandleCloseButton(TradeskillInfoFrameCloseButton)

	S:HandleButton(TradeskillInfoResetButton)
	S:HandleButton(TradeskillInfoOpposingButton)
	S:HandleButton(TradeskillInfoNameButton)
	S:HandleButton(TradeskillInfoReagentButton)
	S:HandleButton(TradeskillInfoSearchButton)

	S:HandleDropDownBox(TradeskillInfoSortDropDown)
	S:HandleDropDownBox(TradeskillInfoTradeskillsDropDown)
	S:HandleDropDownBox(TradeskillInfoAvailabilityDropDown)

	TradeskillInfoListScrollFrame:StripTextures()
	S:HandleScrollBar(TradeskillInfoListScrollFrameScrollBar)
	TradeskillInfoDetailScrollFrame:StripTextures()
	S:HandleScrollBar(TradeskillInfoDetailScrollFrameScrollBar)

	S:HandleEditBox(TradeskillInfoInputBox)

	TradeskillInfoDetailScrollChildFrame:StripTextures()
	TradeskillInfoSkillIcon:StyleButton(nil, true)
	TradeskillInfoSkillIcon:SetTemplate("Default")

	S:SecureHook(TradeskillInfoSkillIcon, "SetNormalTexture", function(self)
		self:GetNormalTexture():SetTexCoord(unpack(E.TexCoords))
		self:GetNormalTexture():SetInside()

		S:Unhook(TradeskillInfoSkillIcon, "SetNormalTexture")
	end)

	for i = 1, 8 do
		local reagent = _G["TradeskillInfoReagent" .. i]
		local icon = _G["TradeskillInfoReagent" .. i .. "IconTexture"]
		local count = _G["TradeskillInfoReagent" .. i .. "Count"]
		local nameFrame = _G["TradeskillInfoReagent" .. i .. "NameFrame"]

		icon:SetTexCoord(unpack(E.TexCoords))
		icon:SetDrawLayer("OVERLAY")

		icon.backdrop = CreateFrame("Frame", nil, reagent)
		icon.backdrop:SetFrameLevel(reagent:GetFrameLevel() - 1)
		icon.backdrop:SetTemplate("Default")
		icon.backdrop:SetOutside(icon)

		icon:SetParent(icon.backdrop)
		count:SetParent(icon.backdrop)
		count:SetDrawLayer("OVERLAY")

		nameFrame:Kill()
	end

	hooksecurefunc(TradeskillInfoUI, "DoFrameUpdate", function(self)
		for i = 0, self.vars.numSkillButtons do
			local c = _G["TradeskillInfoSkill"..i]

			if i == 0 then
				c = TradeskillInfoCollapseAllButton
			end

			if not c.isHooked then
				c:SetNormalTexture("Interface\\Buttons\\UI-PlusMinus-Buttons");
				c.SetNormalTexture = E.noop;
				c:GetNormalTexture():Size(11);
				c:SetPushedTexture("")
				c.SetPushedTexture = E.noop
				c:SetHighlightTexture("")
				c.SetHighlightTexture = E.noop
				c:SetDisabledTexture("")
				c.SetDisabledTexture = E.noop

				hooksecurefunc(c, "SetNormalTexture", function(self, texture)
					if(find(texture, "MinusButton")) then
						self:GetNormalTexture():SetTexCoord(0.5625, 1, 0, 0.4375);
					elseif(find(texture, "PlusButton")) then
						self:GetNormalTexture():SetTexCoord(0, 0.4375, 0, 0.4375);
					else
						self:GetNormalTexture():SetTexCoord(0, 0, 0, 0);
 					end
				end)

				c.isHooked = true
			end
		end
	end)
end

S:AddCallbackForAddon("TradeskillInfoUI", "TradeskillInfoUI", LoadSkin);