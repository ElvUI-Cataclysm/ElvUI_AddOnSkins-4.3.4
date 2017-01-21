local E, L, V, P, G = unpack(ElvUI);
local addon = E:GetModule("AddOnSkins");

if(not addon:CheckAddOn("Titan")) then return; end

function addon:Titan()
	local S = E:GetModule("Skins");

	E:Delay(1, function()
		Titan_Bar__Display_Bar:StripTextures()
		Titan_Bar__Display_Bar:SetTemplate("Transparent", true)

		Titan_Bar__Display_Bar2:StripTextures()
		Titan_Bar__Display_Bar2:SetTemplate("Transparent", true)

		Titan_Bar__Display_AuxBar:StripTextures()
		Titan_Bar__Display_AuxBar:SetTemplate("Transparent", true)

		Titan_Bar__Display_AuxBar2:StripTextures()
		Titan_Bar__Display_AuxBar2:SetTemplate("Transparent", true)

		if(TitanPanelGoldButtonIcon) then
			TitanPanelGoldButtonIcon:SetTexCoord(unpack(E.TexCoords));
		end

		if(TitanPanelDefenseButtonIcon) then
			TitanPanelDefenseButtonIcon:SetTexCoord(unpack(E.TexCoords));
		end

		if(TitanPanelMNButtonIcon) then
			TitanPanelMNButtonIcon:SetTexCoord(unpack(E.TexCoords));
		end

		if(TitanPanelCOButtonIcon) then
			TitanPanelCOButtonIcon:SetTexCoord(unpack(E.TexCoords));
		end

		if(TitanPanelALButtonIcon) then
			TitanPanelALButtonIcon:SetTexCoord(unpack(E.TexCoords));
		end

		if(TitanPanelHPButtonIcon) then
			TitanPanelHPButtonIcon:SetTexCoord(unpack(E.TexCoords));
		end

		if(TitanPanelSKButtonIcon) then
			TitanPanelSKButtonIcon:SetTexCoord(unpack(E.TexCoords));
		end

		if(TitanPanelFAButtonIcon) then
			TitanPanelFAButtonIcon:SetTexCoord(unpack(E.TexCoords));
		end

		if(TitanPanelAYButtonIcon) then
			TitanPanelAYButtonIcon:SetTexCoord(unpack(E.TexCoords));
		end

		if(TitanPanelBSButtonIcon) then
			TitanPanelBSButtonIcon:SetTexCoord(unpack(E.TexCoords));
		end

		if(TitanPanelENButtonIcon) then
			TitanPanelENButtonIcon:SetTexCoord(unpack(E.TexCoords));
		end

		if(TitanPanelEGButtonIcon) then
			TitanPanelEGButtonIcon:SetTexCoord(unpack(E.TexCoords));
		end

		if(TitanPanelJCButtonIcon) then
			TitanPanelJCButtonIcon:SetTexCoord(unpack(E.TexCoords));
		end

		if(TitanPanelLWButtonIcon) then
			TitanPanelLWButtonIcon:SetTexCoord(unpack(E.TexCoords));
		end

		if(TitanPanelTLButtonIcon) then
			TitanPanelTLButtonIcon:SetTexCoord(unpack(E.TexCoords));
		end

		if(TitanPanelFHButtonIcon) then
			TitanPanelFHButtonIcon:SetTexCoord(unpack(E.TexCoords));
		end
		

		if(TitanPanelSPButtonIcon) then
			TitanPanelSPButtonIcon:SetTexCoord(unpack(E.TexCoords));
		end

		for i = 0, 9 do
			if(_G["TitanPanelA"..i.."ButtonIcon"]) then
				_G["TitanPanelA"..i.."ButtonIcon"]:SetTexCoord(unpack(E.TexCoords));
			end
		end

		if(TitanPanelBroker_PortalsButtonIcon) then
			TitanPanelBroker_PortalsButtonIcon:SetTexCoord(unpack(E.TexCoords));
		end
	end)
end

addon:RegisterSkin("Titan", addon.Titan);