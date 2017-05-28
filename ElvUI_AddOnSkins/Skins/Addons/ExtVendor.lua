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
end

S:AddCallbackForAddon("ExtVendor", "ExtVendor", LoadSkin)