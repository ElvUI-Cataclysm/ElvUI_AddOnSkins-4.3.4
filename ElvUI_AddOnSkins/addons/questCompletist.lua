local E, L, V, P, G = unpack(ElvUI);
local addon = E:GetModule("AddOnSkins");

if(not addon:CheckAddOn("QuestCompletist")) then return; end

function addon:QuestCompletist()
	local S = E:GetModule("Skins");

	local tooltips = {
		"qcMapTooltip",
		"qcQuestInformationTooltip",
		"qcToastTooltip",
		"qcQuestReputationTooltip",
		"qcNewDataAlertTooltip",
		"qcMutuallyExclusiveAlertTooltip",
	}

	for _, object in pairs(tooltips) do
		if _G[object] then
			_G[object]:SetFrameStrata("DIALOG")
			_G[object]:SetBackdrop(nil)
			_G[object]:CreateBackdrop("Transparent")
		end
	end

	for i = 1, 16 do
		_G["qcMenuButton"..i]:StyleButton()
	end

	qcQuestCompletistUI:StripTextures()
	qcQuestCompletistUI:SetTemplate("Transparent")
	qcQuestCompletistUI:Size(350, 435)

	S:HandleEditBox(qcSearchBox)
	qcSearchBox:Size(160, 20)

	S:HandleButton(qcOptionsButton)
	S:HandleButton(qcCategoryDropdownButton)

	S:HandleCloseButton(qcXButton)
	qcXButton:Point("TOPLEFT", 323, 4)

	S:HandleSliderFrame(qcMenuSlider, 16)

	qcMenuSlider:Point("TOPLEFT", 303, -90)
	qcMenuSlider:Height(256)

	S:HandleCheckBox(qcIO_M_SHOW_ICONS)
	S:HandleCheckBox(qcIO_M_HIDE_COMPLETED)
	S:HandleCheckBox(qcIO_M_HIDE_LOWLEVEL)
	S:HandleCheckBox(qcIO_M_HIDE_PROFESSION)
	S:HandleCheckBox(qcIO_M_HIDE_SEASONAL)
	S:HandleCheckBox(qcIO_M_HIDE_INPROGRESS)
	S:HandleCheckBox(qcIO_L_HIDE_COMPLETED)
	S:HandleCheckBox(qcIO_L_HIDE_LOWLEVEL)
	S:HandleCheckBox(qcIO_L_HIDE_PROFESSION)
	S:HandleCheckBox(qcIO_ML_HIDE_FACTION)
	S:HandleCheckBox(qcIO_ML_HIDE_RACECLASS)
end

addon:RegisterSkin("QuestCompletist", addon.QuestCompletist);