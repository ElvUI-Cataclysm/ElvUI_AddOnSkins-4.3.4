local E, L, V, P, G = unpack(ElvUI);
local addon = E:GetModule("AddOnSkins");

if(not addon:CheckAddOn("AutoEquipQuestItem")) then return; end

function addon:AutoEquipQuestItem()
	local S = E:GetModule("Skins");

	for i = 1, QuestFrameRewardPanel:GetNumChildren() do
		local Region = select(i, QuestFrameRewardPanel:GetChildren())
		if(Region:IsObjectType('Button') and Region:GetName() == nil) then
			Region:StripTextures()
			S:HandleButton(Region)
		end
	end
end

addon:RegisterSkin("AutoEquipQuestItem", addon.AutoEquipQuestItem);