local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule("Skins")

local function LoadSkin()
	if(not E.private.addOnSkins.ExtVendor) then return end

	MerchantFrame:Size(720, 525)

	S:HandleButton(MerchantFrameFilterButton)
	S:HandleEditBox(MerchantFrameSearchBox)

	S:HandleItemButton(MerchantFrameSellJunkButton)

	ExtVendor_SellJunkPopup:SetTemplate("Transparent")

	S:HandleButton(ExtVendor_SellJunkPopupYesButton)
	S:HandleButton(ExtVendor_SellJunkPopupNoButton)

	-- Options
	ExtVendorConfigContainer:StripTextures()

	ExtVendorConfig_GeneralContainer:StripTextures()
	ExtVendorConfig_GeneralContainer:SetTemplate("Transparent")

	ExtVendorConfig_FilterContainer:StripTextures()
	ExtVendorConfig_FilterContainer:SetTemplate("Transparent")

	ExtVendorConfig_QuickVendorContainer:StripTextures()
	ExtVendorConfig_QuickVendorContainer:SetTemplate("Transparent")

	S:HandleCheckBox(ExtVendorConfig_GeneralContainer_ShowLoadMsg, true)
	S:HandleCheckBox(ExtVendorConfig_FilterContainer_ShowSuboptimalArmor, true)
	S:HandleCheckBox(ExtVendorConfig_QuickVendorContainer_SuboptimalArmor, true)
	S:HandleCheckBox(ExtVendorConfig_QuickVendorContainer_AlreadyKnown, true)
	S:HandleCheckBox(ExtVendorConfig_QuickVendorContainer_UnusableEquip, true)
	S:HandleCheckBox(ExtVendorConfig_QuickVendorContainer_WhiteGear, true)

	S:HandleScrollBar(ExtVendorConfigContainerScrollScrollBar)
end

S:AddCallbackForAddon("ExtVendor", "ExtVendor", LoadSkin)