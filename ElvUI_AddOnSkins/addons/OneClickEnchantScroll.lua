local E, L, V, P, G = unpack(ElvUI);
local addon = E:GetModule("AddOnSkins");

if(not addon:CheckAddOn("OneClickEnchantScroll")) then return; end

function addon:OneClickEnchantScroll(event)
	local S = E:GetModule("Skins");

	if addon == "OneClickEnchantScroll" or event == "TRADE_SKILL_SHOW" then
		S:HandleButton(TradeSkillCreateScrollButton, true)
		TradeSkillCreateScrollButton:ClearAllPoints()
		TradeSkillCreateScrollButton:Point("RIGHT", TradeSkillCreateButton, "LEFT", -2, 0)

		addon:UnregisterSkinEvent("OneClickEnchantScroll", "ADDON_LOADED")
		addon:UnregisterSkinEvent("OneClickEnchantScroll", "TRADE_SKILL_SHOW")
	end
end

addon:RegisterSkin("OneClickEnchantScroll", addon.OneClickEnchantScroll, "TRADE_SKILL_SHOW", "ADDON_LOADED")