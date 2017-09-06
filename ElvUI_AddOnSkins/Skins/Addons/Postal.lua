local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule("Skins")

local function LoadSkin()
	if(not E.private.addOnSkins.Postal) then return end

	InboxPrevPageButton:Point("CENTER", InboxFrame, "BOTTOMLEFT", 56, 112)
	InboxNextPageButton:Point("CENTER", InboxFrame, "BOTTOMLEFT", 306, 112)

	MailItem1:Point("TOPLEFT", 40, -68)

	for i = 1, INBOXITEMS_TO_DISPLAY do
		local item = _G["MailItem"..i.."ExpireTime"]
		if item then
			item:Point("TOPRIGHT", "MailItem"..i, "TOPRIGHT", -5, -10)
			if item.returnicon then
				item.returnicon:Point("TOPRIGHT", item, "TOPRIGHT", 20, 0)
			end
		end
		if _G["PostalInboxCB"..i] then
			S:HandleCheckBox(_G["PostalInboxCB"..i])
		end
	end

	if PostalSelectOpenButton then
		S:HandleButton(PostalSelectOpenButton, true)
		PostalSelectOpenButton:Point("RIGHT", InboxFrame, "TOP", -30, -48)
	end

	if Postal_OpenAllMenuButton then
		S:HandleNextPrevButton(Postal_OpenAllMenuButton, true)
		Postal_OpenAllMenuButton:Point("LEFT", PostalOpenAllButton, "RIGHT", 20, 0)
	end

	if PostalOpenAllButton then
		S:HandleButton(PostalOpenAllButton, true)
		PostalOpenAllButton:Point("CENTER", InboxFrame, "TOP", -34, -400)
	end

	if PostalSelectReturnButton then
		S:HandleButton(PostalSelectReturnButton, true)
		PostalSelectReturnButton:Point("LEFT", InboxFrame, "TOP", 6, -48)
	end

	if Postal_ModuleMenuButton then
		S:HandleNextPrevButton(Postal_ModuleMenuButton, true)
		Postal_ModuleMenuButton:Point("TOPRIGHT", MailFrame, -30, -4)
	end

	if Postal_BlackBookButton then
		S:HandleNextPrevButton(Postal_BlackBookButton, true)
		Postal_BlackBookButton:Point("LEFT", SendMailNameEditBox, "RIGHT", 5, 2)
	end

	hooksecurefunc(Postal, "CreateAboutFrame", function()
		if PostalAboutFrame then
			PostalAboutFrame:StripTextures()
			PostalAboutFrame:SetTemplate("Transparent")
			if PostalAboutScroll then
				S:HandleScrollBar(PostalAboutScrollScrollBar)
			end
			local closeButton = select(2, PostalAboutFrame:GetChildren())
			if closeButton then
				S:HandleCloseButton(closeButton)
			end
		end
	end)
end

S:AddCallbackForAddon("Postal", "Postal", LoadSkin)