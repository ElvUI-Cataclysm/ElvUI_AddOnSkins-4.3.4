local E, L, V, P, G, _ = unpack(ElvUI);
local addon = E:GetModule("AddOnSkins");

if(not addon:CheckAddOn("Omen")) then return; end

function addon:Omen()
	OmenTitle:SetTemplate("Default", true);
	OmenBarList:SetTemplate("Default");
end

addon:RegisterSkin("Omen", addon.Omen);