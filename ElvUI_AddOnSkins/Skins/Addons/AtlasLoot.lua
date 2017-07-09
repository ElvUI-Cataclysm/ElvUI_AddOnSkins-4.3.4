local E, L, V, P, G = unpack(ElvUI)
local AS = E:GetModule("AddOnSkins")
local S = E:GetModule("Skins")

local function LoadSkin()
	if(not E.private.addOnSkins.AtlasLoot) then return end

	local addon = LibStub("AceAddon-3.0"):GetAddon("AtlasLoot")
	if not addon then return end

	local function AL_OnShow(self)
		if self.IsPointsDone then return end

		AtlasLootPanel:Width(AtlasLootDefaultFrame:GetWidth())
		AtlasLootPanel:SetPoint("TOP", AtlasLootDefaultFrame, "BOTTOM", 0, -1)
		AtlasLootPanel.SetPoint = E.noop

		AtlasLootQuickLooksButton:Point("BOTTOM", 53, 33)

		AtlasLootPanelSearch_Box:Height(16)
		AtlasLootPanelSearch_Box:ClearAllPoints()
		AtlasLootPanelSearch_Box:Point("TOP", AtlasLoot_PanelButton_7, "BOTTOM", 80, -10)

		AtlasLootPanelSearch_SearchButton:Point("LEFT", AtlasLootPanelSearch_Box, "RIGHT", 5, 0)
		AtlasLootPanelSearch_SelectModuel:Point("LEFT", AtlasLootPanelSearch_SearchButton, "RIGHT", 5, 0)
		AtlasLootPanelSearch_ClearButton:Point("LEFT", AtlasLootPanelSearch_SelectModuel, "RIGHT", 5, 0)
		AtlasLootPanelSearch_LastResultButton:Point("LEFT", AtlasLootPanelSearch_ClearButton, "RIGHT", 5, 0)
		AtlasLoot10Man25ManSwitch:Point("BOTTOM", AtlasLootItemsFrame, "BOTTOM", -130, 4)

		for i = 2, 12 do
			local frame = _G["AtlasLoot_PanelButton_"..i]
			if frame and i ~= 7 then
				frame:SetPoint("LEFT", _G["AtlasLoot_PanelButton_"..(i - 1)], "RIGHT", 2, 0)
				frame.SetPoint = E.noop
			end
		end

		AtlasLootDefaultFrame_CloseButton:ClearAllPoints()
		AtlasLootDefaultFrame_CloseButton:Point("TOPRIGHT", AtlasLootDefaultFrame, "TOPRIGHT", -5, -2)

		AtlasLootDefaultFrame:SetFrameLevel(0)
		AtlasLootItemsFrame:SetFrameLevel(1)

		for i = 1, 30 do
			if _G["AtlasLootDefaultFrame_ScrollLine"..i] then
				_G["AtlasLootDefaultFrame_ScrollLine"..i]:SetFrameLevel(1)
				_G["AtlasLootDefaultFrame_ScrollLine"..i]:StyleButton()
			end
		end

		AtlasLootDefaultFrame_ModuleSelect:SetFrameLevel(1)
		AtlasLootDefaultFrame_InstanceSelect:SetFrameLevel(1)
		AtlasLoot_AtlasInfoFrame_ToggleALButton:SetFrameLevel(1)
		AtlasLootDefaultFrame_CompareFrame:SetFrameLevel(1)

		self.IsPointsDone = true
	end
	
	AtlasLootDefaultFrame:HookScript("OnShow", AL_OnShow)
	AtlasLootDefaultFrame:StripTextures()
	AtlasLootDefaultFrame:SetTemplate("Transparent")

	AtlasLootPanel:StripTextures()
	AtlasLootPanel:SetTemplate("Transparent")

	AtlasLootCompareFrame:StripTextures()
	AtlasLootCompareFrame:SetTemplate("Transparent")

	AtlasLootItemsFrame:StripTextures()
	AtlasLootItemsFrame:SetTemplate("Default")

	AtlasLootCompareFrame_ScrollFrameMainFilterScrollChildFrame:StripTextures()
	AtlasLootCompareFrame_ScrollFrameItemFrame:StripTextures()
	AtlasLootCompareFrame_ScrollFrameMainFilter:StripTextures()

	S:HandleButton(AtlasLoot_AtlasInfoFrame_ToggleALButton)
	S:HandleButton(AtlasLootPanelSearch_SearchButton)
	S:HandleButton(AtlasLootDefaultFrame_CompareFrame)
	S:HandleButton(AtlasLootPanelSearch_ClearButton)
	S:HandleButton(AtlasLootPanelSearch_LastResultButton)
	S:HandleButton(AtlasLoot10Man25ManSwitch)
	S:HandleButton(AtlasLootItemsFrame_BACK)
	S:HandleButton(AtlasLootCompareFrameSearch_ClearButton)
	S:HandleButton(AtlasLootCompareFrameSearch_SearchButton)
	S:HandleButton(AtlasLootCompareFrame_WishlistButton)
	S:HandleButton(AtlasLootCompareFrame_CloseButton2)
	S:HandleButton(AtlasLootServerQueryButton)

	for i = 1, 12 do
		local panelButtons = _G["AtlasLoot_PanelButton_"..i]

		S:HandleButton(panelButtons)
	end

	S:HandleCloseButton(AtlasLootDefaultFrame_CloseButton)
	S:HandleCloseButton(AtlasLootCompareFrame_CloseButton)
	S:HandleCloseButton(AtlasLootCompareFrame_CloseButton_Wishlist)

	S:HandleNextPrevButton(AtlasLootQuickLooksButton)
	S:HandleNextPrevButton(AtlasLootPanelSearch_SelectModuel)
	S:HandleNextPrevButton(AtlasLootCompareFrameSearch_SelectModuel)

	AtlasLootItemsFrame_NEXT:Size(25)
	S:HandleNextPrevButton(AtlasLootItemsFrame_NEXT)

	AtlasLootItemsFrame_PREV:Size(25)
	S:HandleNextPrevButton(AtlasLootItemsFrame_PREV)

	AS:Desaturate(AtlasLootDefaultFrame_LockButton)

	S:HandleDropDownBox(AtlasLootDefaultFrame_ModuleSelect)
	AtlasLootDefaultFrame_ModuleSelect:Width(240)
	AtlasLootDefaultFrame_ModuleSelect:Point("TOPLEFT", 50, -50)

	S:HandleDropDownBox(AtlasLootDefaultFrame_InstanceSelect)
	AtlasLootDefaultFrame_InstanceSelect:Width(240)

	S:HandleDropDownBox(AtlasLootCompareFrameSearch_StatsListDropDown)
	AtlasLootCompareFrameSearch_StatsListDropDown:Width(240)

	S:HandleDropDownBox(AtlasLootCompareFrame_WishlistDropDown)
	AtlasLootCompareFrame_WishlistDropDown:Width(240)

	S:HandleEditBox(AtlasLootPanelSearch_Box)
	S:HandleEditBox(AtlasLootCompareFrameSearch_Box)

	S:HandleCheckBox(AtlasLootFilterCheck)
	S:HandleCheckBox(AtlasLootItemsFrame_Heroic)
	S:HandleCheckBox(AtlasLootCompareFrameSearch_FilterCheck)
	S:HandleCheckBox(AtlasLootItemsFrame_RaidFinder)

	AtlasLootPanel.Titel:SetTextColor(23/255, 132/255, 209/255)
	AtlasLootPanel.Titel:Point("BOTTOM", AtlasLootPanel.TitelBg, "BOTTOM", 0, 40)

	S:HandleScrollBar(AtlasLootCompareFrame_ScrollFrameItemFrameScrollBar)
	S:HandleScrollBar(AtlasLootCompareFrame_WishlistScrollFrameScrollBar)

	AtlasLootCompareFrame:HookScript("OnUpdate", function(self)
		for i = 1, 9 do 
			if _G["AtlasLootCompareFrameSortButton_"..i] then
				_G["AtlasLootCompareFrameSortButton_"..i]:Width(44)
				_G["AtlasLootCompareFrameSortButton_"..i]:Point("LEFT", i == 1 and AtlasLootCompareFrameSortButton_Rarity or _G["AtlasLootCompareFrameSortButton_"..(i - 1)], "RIGHT", 2, 0)
			end
		end

		AtlasLootCompareFrameSortButton_Rarity:Point("LEFT", AtlasLootCompareFrameSortButton_Name, "RIGHT", 2, 0)
		AtlasLootCompareFrameSortButton_Rarity:Width(80)
		AtlasLootCompareFrameSortButton_Name:Width(80)
		AtlasLootCompareFrame_CloseButton2:Point("BOTTOMRIGHT", AtlasLootCompareFrame, "BOTTOMRIGHT", -7, 10)
		AtlasLootCompareFrame_WishlistButton:Point("RIGHT", AtlasLootCompareFrame_CloseButton2, "LEFT", -1, 0)
		AtlasLootCompareFrameSearch_SearchButton:Point("LEFT", AtlasLootCompareFrameSearch_Box, "RIGHT", 5, 0)
		AtlasLootCompareFrameSearch_SelectModuel:Point("LEFT", AtlasLootCompareFrameSearch_SearchButton, "RIGHT", 5, 0)

		local Buttons = {
			AtlasLootCompareFrameSortButton_Name,
			AtlasLootCompareFrameSortButton_Rarity,
			AtlasLootCompareFrameSortButton_1,
			AtlasLootCompareFrameSortButton_2,
			AtlasLootCompareFrameSortButton_3,
			AtlasLootCompareFrameSortButton_4,
			AtlasLootCompareFrameSortButton_5,
			AtlasLootCompareFrameSortButton_6,
			AtlasLootCompareFrameSortButton_7,
			AtlasLootCompareFrameSortButton_8,
			AtlasLootCompareFrameSortButton_9
		}

		for _, object in pairs(Buttons) do
			if object and not object.IsSkinned then
				object:StripTextures()
				object:SetTemplate()
				object.IsSkinned = true
			end
		end
	end)

	AtlasLootPanel:SetWidth(AtlasLootDefaultFrame:GetWidth())
	AtlasLootPanel.SetWidth = E.noop

	for i = 1, 15 do
		_G["AtlasLootCompareFrameMainFilterButton"..i]:StripTextures()
	end

	for i = 1, 30 do
		local Item = _G["AtlasLootItem_"..i]

		Item:StyleButton(nil, true)
		Item:CreateBackdrop("Default")
		Item.backdrop:SetOutside(Item.MenuIcon)

		Item.Icon:SetTexCoord(unpack(E.TexCoords))
		Item.Icon:SetInside(Item.backdrop)
		Item.Icon:Size(24)

		Item.MenuIcon:SetTexCoord(unpack(E.TexCoords))
		Item.MenuIcon:Size(24)
		Item.MenuIconBorder:SetTexture(nil)

		Item.QueryIcon:SetTexCoord(unpack(E.TexCoords))
		Item.QueryIcon:SetInside(Item.backdrop)

		Item.Unsafe:SetInside(Item.backdrop)

		Item.QA:StyleButton(nil, true)

		_G["AtlasLootItem_"..i.."_QAExtraIcon"]:SetTexCoord(unpack(E.TexCoords))
	end

	AtlasLootItemsFrame_EncounterJournal:SetTemplate()
	AtlasLootItemsFrame_EncounterJournal:Size(25)
	AtlasLootItemsFrame_EncounterJournal:StyleButton()

	AtlasLootDefaultFrame_EncounterJournal:SetTemplate()
	AtlasLootDefaultFrame_EncounterJournal:Size(20)
	AtlasLootDefaultFrame_EncounterJournal:StyleButton()

	AtlasLootCompareFrame_EncounterJournal:SetTemplate()
	AtlasLootCompareFrame_EncounterJournal:Size(20)
	AtlasLootCompareFrame_EncounterJournal:StyleButton()

	for i = 1, 8 do
		_G["AtlasLootCompareFrame_ScrollFrameItemFrame_Item"..i]:StripTextures()
	end

	AtlasLootTooltip:HookScript("OnShow", function(self)
		self:SetTemplate("Transparent")

		local iLink = select(2, self:GetItem())
		local quality = iLink and select(3, GetItemInfo(iLink))
		if(quality and quality >= 2) then
			self:SetBackdropBorderColor(GetItemQualityColor(quality))
		else
			self:SetBackdropBorderColor(unpack(E["media"].bordercolor))
		end
	end)
end

S:AddCallbackForAddon("AtlasLoot", "AtlasLoot", LoadSkin)