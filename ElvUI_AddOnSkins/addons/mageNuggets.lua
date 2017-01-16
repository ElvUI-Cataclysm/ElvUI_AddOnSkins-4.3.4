local E, L, V, P, G = unpack(ElvUI);
local addon = E:GetModule("AddOnSkins");

if(not addon:CheckAddOn("MageNuggets")) then return; end

function addon:MageNuggets()
	local S = E:GetModule("Skins");

	MageNugSP_Frame:SetTemplate("Transparent", nil, true);
	MageNugSP_FrameText:FontTemplate(nil, 9);
	MageNugSP_FrameButtonShowOptions:Size(6);
	S:HandleButton(MageNugSP_FrameButtonShowOptions);

	MNTorment_Frame:SetTemplate("Default");
	MNTorment_FrameTexture:SetDrawLayer("ARTWORK");
	MNTorment_FrameTexture:SetTexCoord(unpack(E.TexCoords));
	MNTorment_FrameTexture:SetInside();

	MNicyveins_Frame:SetTemplate("Default");
	MNicyveins_FrameTexture:SetDrawLayer("ARTWORK");
	MNicyveins_FrameTexture:SetTexCoord(unpack(E.TexCoords));
	MNicyveins_FrameTexture:SetInside();
	MNicyveins_FrameText:FontTemplate();

	MNcombust_Frame:SetTemplate("Default");
	MNcombust_FrameTexture:SetDrawLayer("ARTWORK");
	MNcombust_FrameTexture:SetTexCoord(unpack(E.TexCoords));
	MNcombust_FrameTexture:SetInside();
	MNcombust_FrameText:FontTemplate();

	MNcritMass_Frame:SetTemplate("Default");
	MNcritMass_FrameTexture:SetDrawLayer("ARTWORK");
	MNcritMass_FrameTexture:SetTexCoord(unpack(E.TexCoords));
	MNcritMass_FrameTexture:SetInside();
	MNcritMass_FrameText:FontTemplate();

	MNarcanepower_Frame:SetTemplate("Default");
	MNarcanepower_FrameTexture:SetDrawLayer("ARTWORK");
	MNarcanepower_FrameTexture:SetTexCoord(unpack(E.TexCoords));
	MNarcanepower_FrameTexture:SetInside();
	MNarcanepower_FrameText:FontTemplate();

	MNlust_Frame:SetTemplate("Default");
	MNlust_FrameTexture:SetDrawLayer("ARTWORK");
	MNlust_FrameTexture:SetTexCoord(unpack(E.TexCoords));
	MNlust_FrameTexture:SetInside();
	MNlust_FrameText:FontTemplate();

	MNmoonFire_Frame:SetTemplate("Default");
	MNmoonFire_FrameTexture:SetDrawLayer("ARTWORK");
	MNmoonFire_FrameTexture:SetTexCoord(unpack(E.TexCoords));
	MNmoonFire_FrameTexture:SetInside();
	MNmoonFire_FrameText:FontTemplate();

	MNinsectSwarm_Frame:SetTemplate("Default");
	MNinsectSwarm_FrameTexture:SetDrawLayer("ARTWORK");
	MNinsectSwarm_FrameTexture:SetTexCoord(unpack(E.TexCoords));
	MNinsectSwarm_FrameTexture:SetInside();
	MNinsectSwarm_FrameText:FontTemplate();

	MNPyromaniac_Frame:SetTemplate("Default");
	MNPyromaniac_FrameTexture:SetDrawLayer("ARTWORK");
	MNPyromaniac_FrameTexture:SetTexCoord(unpack(E.TexCoords));
	MNPyromaniac_FrameTexture:SetInside();

	MNstarSurge_Frame:SetTemplate("Default");
	MNstarSurge_FrameTexture:SetDrawLayer("ARTWORK");
	MNstarSurge_FrameTexture:SetTexCoord(unpack(E.TexCoords));
	MNstarSurge_FrameTexture:SetInside();
	MNstarSurge_FrameText:FontTemplate();

	MNimpGem_Frame:SetTemplate("Default");
	MNimpGem_FrameTexture:SetDrawLayer("ARTWORK");
	MNimpGem_FrameTexture:SetTexCoord(unpack(E.TexCoords));
	MNimpGem_FrameTexture:SetInside();

	MageNugLB_Frame:SetTemplate("Default");
	MageNugLB_FrameTexture:SetDrawLayer("ARTWORK");
	MageNugLB_FrameTexture:SetTexCoord(unpack(E.TexCoords));
	MageNugLB_FrameTexture:SetInside();
	MageNugLB_Frame_Text:FontTemplate(nil, 20, "OUTLINE");

	for i = 1, 4 do
		local frame = _G["MageNugLB"..i.."_Frame"]
		local bar = _G["MageNugLB"..i.."_Frame_Bar"]

		frame:ClearAllPoints()
		frame:SetBackdrop(nil)
		_G["MageNugLB"..i.."_Frame_Text"]:SetDrawLayer("OVERLAY", 8)
		_G["MageNugLB"..i.."_Frame_Text"]:FontTemplate();
		_G["MageNugLB"..i.."_Frame_Text2"]:SetDrawLayer("OVERLAY", 8)
		_G["MageNugLB"..i.."_Frame_Text2"]:FontTemplate();

		bar:SetStatusBarTexture(E["media"].normTex);
		bar:CreateBackdrop()
	end

	MageNugLB1_Frame:SetPoint("BOTTOMLEFT", MageNugLB_Frame, "BOTTOMRIGHT", 6, -1)
	MageNugLB2_Frame:SetPoint("BOTTOM", MageNugLB1_Frame, "TOP", 0, 4)
	MageNugLB3_Frame:SetPoint("BOTTOM", MageNugLB2_Frame, "TOP", 0, 4)
	MageNugLB4_Frame:SetPoint("BOTTOM", MageNugLB3_Frame, "TOP", 0, 4)

	MageNugClearcast_Frame:SetTemplate("Default");
	MageNugClearcast_FrameTexture:SetDrawLayer("ARTWORK");
	MageNugClearcast_FrameTexture:SetTexCoord(unpack(E.TexCoords));
	MageNugClearcast_FrameTexture:SetInside();
	MageNugClearcast_Frame_Bar:SetStatusBarTexture(E["media"].normTex);
	E:RegisterStatusBar(MageNugClearcast_Frame_Bar);
	MageNugClearcast_Frame_Bar:CreateBackdrop("Default");
	MageNugClearcast_Frame_Bar:Width(34 - E.Spacing*2);
	MageNugClearcast_Frame_Bar:Point("TOP", MageNugClearcast_Frame, "BOTTOM", 0, -E.Spacing*3);
	MageNugClearcast_FrameText2:FontTemplate(nil, 10, "OUTLINE");
	MageNugClearcast_FrameText2:ClearAllPoints()
	MageNugClearcast_FrameText2:SetPoint("CENTER", MageNugClearcast_Frame_Bar, "CENTER", 0, -11)

	MageNugIgnite_Frame:SetTemplate("Default");
	MageNugIgnite_FrameTexture:SetDrawLayer("ARTWORK");
	MageNugIgnite_FrameTexture:SetTexCoord(unpack(E.TexCoords));
	MageNugIgnite_FrameTexture:SetInside();
	MageNugIgnite_Frame_Bar:SetStatusBarTexture(E["media"].normTex);
	E:RegisterStatusBar(MageNugIgnite_Frame_Bar);
	MageNugIgnite_Frame_Bar:CreateBackdrop("Default");
	MageNugIgnite_Frame_Bar:Width(34 - E.Spacing*2);
	MageNugIgnite_Frame_Bar:Point("TOP", MageNugIgnite_Frame, "BOTTOM", 0, -E.Spacing*3);
	MageNugIgnite_FrameText:FontTemplate(nil, 20, "OUTLINE");
	MageNugIgnite_FrameText2:FontTemplate(nil, 10, "OUTLINE");
	MageNugIgnite_FrameText2:ClearAllPoints()
	MageNugIgnite_FrameText2:SetPoint("CENTER", MageNugIgnite_Frame_Bar, "CENTER", 0, -11)

	MageNugManaGem_Frame:SetTemplate("Default");
	MageNugManaGem_FrameTexture:SetDrawLayer("ARTWORK");
	MageNugManaGem_FrameTexture:SetTexCoord(unpack(E.TexCoords));
	MageNugManaGem_FrameTexture:SetInside();
	MageNugManaGem_Frame_Bar:SetStatusBarTexture(E["media"].normTex);
	E:RegisterStatusBar(MageNugManaGem_Frame_Bar);
	MageNugManaGem_Frame_Bar:CreateBackdrop("Default");
	MageNugManaGem_Frame_Bar:Width(34 - E.Spacing*2);
	MageNugManaGem_Frame_Bar:Point("TOP", MageNugManaGem_Frame, "BOTTOM", 0, -E.Spacing*3);
	MageNugManaGem_Frame_Text:FontTemplate(nil, 20, "OUTLINE");
	MageNugManaGem_Frame_Text2:FontTemplate(nil, 12, "OUTLINE");
	MageNugManaGem_Frame_Text2:ClearAllPoints()
	MageNugManaGem_Frame_Text2:SetPoint("CENTER", MageNugManaGem_Frame_Bar, "CENTER", 0, -11)

	MageNugAB_Frame:SetTemplate("Default");
	MageNugAB_FrameTexture:SetDrawLayer("ARTWORK");
	MageNugAB_FrameTexture:SetTexCoord(unpack(E.TexCoords));
	MageNugAB_FrameTexture:SetInside();
	MageNugAB_Frame_ABBar:SetStatusBarTexture(E["media"].normTex);
	E:RegisterStatusBar(MageNugAB_Frame_ABBar);
	MageNugAB_Frame_ABBar:CreateBackdrop("Default");
	MageNugAB_Frame_ABBar:Width(34 - E.Spacing*2);
	MageNugAB_Frame_ABBar:Point("TOP", MageNugAB_Frame, "BOTTOM", 0, -E.Spacing*3);
	MNabCast_Frame:SetTemplate("Transparent");
	MNabCast_Frame:Point("BOTTOM", MageNugAB_Frame, "TOP", 0, E.Spacing);
	MNabCast_FrameText:FontTemplate(nil, 10, "OUTLINE");
	MageNugAB_FrameText:FontTemplate(nil, 20, "OUTLINE");
	MageNugAB_FrameText2:FontTemplate(nil, 10, "OUTLINE");
	MageNugAB_FrameText2:ClearAllPoints()
	MageNugAB_FrameText2:SetPoint("CENTER", MageNugAB_Frame_ABBar, "CENTER", 0, -11)

	MageNugCauterizeFrame:SetTemplate("Transparent");
	MageNugCauterizeFrameTexture:SetTexCoord(unpack(E.TexCoords));

	MNSpellSteal_Frame:SetTemplate("Transparent");
	MNSpellSteal_Frame:Width(175)
	MNSpellSteal_FrameTitleText:FontTemplate();
	MNSpellSteal_FrameBuffText:FontTemplate();

	MNSpellStealFocus_Frame:SetTemplate("Transparent");
	MNSpellStealFocus_Frame:Width(175)
	MNSpellStealFocus_FrameTitleText:FontTemplate();
	MNSpellStealFocus_FrameBuffText:FontTemplate();

	local procFrames = {"MageNugProcFrame", "MageNugImpactProcFrame", "MageNugBFProcFrame", "MageNugMBProcFrame", "MageNugFoFProcFrame"};
	for _, frame in pairs(procFrames) do
		local texture = _G[frame .. "Texture"];
		local bar = _G[frame .. "_ProcBar"];

		_G[frame]:SetBackdrop(nil);
		_G[frame]:CreateBackdrop("Default");
		_G[frame].backdrop:SetOutside(texture);
		texture:SetTexCoord(unpack(E.TexCoords));
		_G[frame .. "Text"]:FontTemplate(nil, 12, "OUTLINE");
		_G[frame .. "Text2"]:FontTemplate(nil, 10, "OUTLINE");
		_G[frame .. "Text2"]:SetPoint("BOTTOMRIGHT", bar);
		_G[frame .. "Text2"]:SetParent(bar);
		bar:Point("LEFT", _G[frame].backdrop, "RIGHT", E.Spacing*3, 0)
		bar:SetStatusBarTexture(E["media"].normTex);
		E:RegisterStatusBar(bar);
		bar:CreateBackdrop("Default");
		bar:Size(120, 10)
	end
	
	for i = 1, 6 do
		local frame = _G["MageNugCD"..i.."_Frame"]
		local bar = _G["MageNugCD"..i.."_Frame_Bar"]
		local icon = _G["MageNugCD"..i.."_Frame_Texture"]
		local text = _G["MageNugCD"..i.."_Frame_Text"]
		local text2 = _G["MageNugCD"..i.."_Frame_Text2"]

		frame:CreateBackdrop("Default");
		frame.backdrop:SetOutside(icon);
		frame:ClearAllPoints()
		icon:SetTexCoord(unpack(E.TexCoords));
		bar:Point("LEFT", frame.backdrop, "RIGHT", E.Spacing*3, 0)
		bar:SetStatusBarTexture(E["media"].normTex);
		E:RegisterStatusBar(bar);
		bar:CreateBackdrop("Default");
		bar.backdrop:SetOutside()
		text:FontTemplate(nil, 10, "OUTLINE");
		text2:FontTemplate(nil, 10, "OUTLINE");
	end

	MageNugCD1_Frame:SetPoint("BOTTOMLEFT", MageNugCD_Frame, "BOTTOMRIGHT", 6, -1)
	MageNugCD2_Frame:SetPoint("BOTTOM", MageNugCD1_Frame, "TOP", 0, 4)
	MageNugCD3_Frame:SetPoint("BOTTOM", MageNugCD2_Frame, "TOP", 0, 4)
	MageNugCD4_Frame:SetPoint("BOTTOM", MageNugCD3_Frame, "TOP", 0, 4)

	MageNugPolyFrame:SetTemplate("Transparent");
	MageNugPolyFrame:CreateBackdrop("Default");
	MageNugPolyFrame.backdrop:SetOutside(MageNugPolyFrameTexture);
	MageNugPolyFrameTexture:SetTexCoord(unpack(E.TexCoords));
	MageNugPolyFrameText:FontTemplate();
	MageNugPolyFrameTimerText:FontTemplate();
	MageNugPolyFrame_Bar:SetStatusBarTexture(E["media"].normTex);

	MageNugMI_Frame:CreateBackdrop("Default");
	MageNugMI_Frame.backdrop:SetOutside(MageNugMI_FrameTexture1);
	MageNugMI_FrameTexture1:SetTexCoord(unpack(E.TexCoords));
	MageNugMI_Frame_MIText:FontTemplate(nil, 12, "OUTLINE");
	MageNugMI_Frame_MIText1:FontTemplate(nil, 10, "OUTLINE");
	MageNugMI_Frame_MiBar:Point("LEFT", MageNugMI_Frame.backdrop, "RIGHT", E.Spacing*3, 0)
	MageNugMI_Frame_MiBar:SetStatusBarTexture(E["media"].normTex);
	E:RegisterStatusBar(MageNugMI_Frame_MiBar);
	MageNugMI_Frame_MiBar:CreateBackdrop("Default");

	MageNugWE_Frame:CreateBackdrop("Default");
	MageNugWE_Frame.backdrop:SetOutside(MageNugWE_FrameTexture1);
	MageNugWE_FrameTexture1:SetTexCoord(unpack(E.TexCoords));
	MageNugWE_Frame_MIText:FontTemplate();
	MageNugWE_Frame_WEText1:FontTemplate();
	MageNugWE_Frame_WeBar:Point("LEFT", MageNugWE_Frame.backdrop, "RIGHT", E.Spacing*3, 0)
	MageNugWE_Frame_WeBar:SetStatusBarTexture(E["media"].normTex);
	E:RegisterStatusBar(MageNugWE_Frame_WeBar);
	MageNugWE_Frame_WeBar:CreateBackdrop("Default");

	MageNugCauterize_Frame:CreateBackdrop("Default");
	MageNugCauterize_Frame.backdrop:SetOutside(MageNugCauterize_FrameTexture1);
	MageNugCauterize_FrameTexture1:SetTexCoord(unpack(E.TexCoords));
	MageNugCauterize_Frame_Text:FontTemplate(nil, 12, "OUTLINE");
	MageNugCauterize_Frame_Text1:FontTemplate(nil, 10, "OUTLINE");
	MageNugCauterize_Frame_Bar:Point("LEFT", MageNugCauterize_Frame.backdrop, "RIGHT", E.Spacing*3, 0)
	MageNugCauterize_Frame_Bar:SetStatusBarTexture(E["media"].normTex);
	E:RegisterStatusBar(MageNugCauterize_Frame_Bar);
	MageNugCauterize_Frame_Bar:CreateBackdrop("Default");

	MageNugHordeFrame:SetTemplate("Transparent");
	MageNugHordeFrameText:FontTemplate();
	MageNugHordeFrameText2:FontTemplate();
	MageNugHordeFrame:SetFrameLevel(35);

	local hordeButtons = {"PortDal", "PortShat", "PortOrg", "PortUC", "PortTB", "PortSMC", "PortStonard", "PortTol", "TeleDal", "TeleShat", "TeleOrg", "TeleUC", "TeleTB", "TeleSMC", "TeleStonard", "TeleTol", "Hearth"};
	for _, button in pairs(hordeButtons) do
		local icon = _G["MageNugHordeFrame" .. button .. "TelDalTexture"];

		_G["MageNugHordeFrame" .. button]:SetTemplate("Default");
		_G["MageNugHordeFrame" .. button]:StyleButton();
		icon:SetDrawLayer("ARTWORK");
		icon:SetTexCoord(unpack(E.TexCoords));
		icon:SetInside();
	end

	S:HandleButton(MageNugHordeFrameClose);
	S:HandleButton(MageNugHordeFrameShowOptions);

	MageNugAlliFrame:SetTemplate("Transparent");
	MageNugAlliFrameText:FontTemplate();
	MageNugAlliFrameText2:FontTemplate();

	local alliButtons = {"PortDal", "PortShat", "PortIF", "PortSW", "PortDarn", "PortExo", "PortTheramore", "PortTol", "TeleDal", "TeleShat", "TeleIF", "TeleSW", "TeleDarn", "TeleExo", "TeleTheramore", "TeleTol", "Hearth"};
	for _, button in pairs(alliButtons) do
		local icon = _G["MageNugAlliFrame" .. button .. "TelDalTexture"];

		_G["MageNugAlliFrame" .. button]:SetTemplate("Default");
		_G["MageNugAlliFrame" .. button]:StyleButton();
		icon:SetDrawLayer("ARTWORK");
		icon:SetTexCoord(unpack(E.TexCoords));
		icon:SetInside();
	end

	S:HandleButton(MageNugAlliFrameClose);
	S:HandleButton(MageNugAlliFrameShowOptions);

	--Options
	S:HandleButton(MageNugStatMonOptionFrameBlackBackdropButton)
	S:HandleButton(MageNugMoonkinOptionFrame_Button)
	S:HandleButton(MageNugOption2FrameButton1)
	S:HandleButton(MageNugOption2FrameButton2)

	local nugEditBox = {
		"SlowFallMsgEditBox",
		"SlowFallMsgEditBox2",
		"SlowFallMsgEditBox3",
		"FocMagNotifyEditBox",
		"FocMagNotifyEditBox2",
		"FocMagNotifyEditBox3",
		"FocMagThankEditBox",
		"FocMagThankEditBox2",
		"InnervThankEditBox",
		"InnervThankEditBox2",
		"PowerInfusionEditBox",
		"DarkIntentEditBox",
		"MageNugSoundOptionFrame_MISoundEditBox",
		"MageNugSoundOptionFrame_ProcSoundEditBox",
		"MageNugSoundOptionFrame_PolySoundEditBox",
		"MageNugSoundOptionFrame_HotStreakSoundEditBox",
		"MageNugSoundOptionFrame_ImpactSoundEditBox",
		"MageNugSoundOptionFrame_FoFSoundEditBox",
		"MageNugSoundOptionFrame_BrainFreezeSoundEditBox",
		"MageNugSoundOptionFrame_CauterizeSoundEditBox",
		"MageNugSoundOptionFrame_TimeWarpSoundEditBox",
		"MageNugPriestOptionFrame_EditBox3",
		"MageNugPriestOptionFrame_EditBox2",
		"MageNugPriestOptionFrame_EditBox1",
		"MageNugMoonkinOptionFrame_SoundEditBox",
		"MageNugMoonkinOptionFrame_InnervateEditBox"
	}

	for i = 1, getn(nugEditBox) do
		S:HandleEditBox(_G[nugEditBox[i]]);
		_G[nugEditBox[i]]:Size(200, 20)
	end

	local nugSliders = {
		"MageNugOptionsFrame_Slider1",
		"MageNugOptionsFrame_Slider2",
		"MageNugOptionsFrame_Slider3",
		"MageNugOptionsFrame_Slider4",
		"MageNugOptionsFrame_Slider5",
		"MageNugStatMonOptionFrame_SPSizeSlider",
		"MageNugStatMonOptionFrame_BorderSlider",
		"MageNugStatMonOptionFrame_TransparencySlider",
		"MageNugMoonkinOptionFrame_Slider",
		"MageNugMoonkinOptionFrame_Slider1",
		"MageNugCooldownFrame_Slider1"
	};

	for i = 1, getn(nugSliders) do
		S:HandleSliderFrame(_G[nugSliders[i]]);
	end

	local nugCheckBox = {
		"MageNugOptionsFrame_CheckButton2",
		"MageNugOptionsFrame_CheckButton3",
		"MageNugOptionsFrame_CheckButton6",
		"MageNugOptionsFrame_CheckButton7",
		"MageNugOptionsFrame_CheckButton8",
		"MageNugOptionsFrame_CheckButton9",
		"MageNugOptionsFrame_CheckButton11",
		"MageNugOptionsFrame_CheckButton13",
		"MageNugOptionsFrame_CheckButton14",
		"CauterizeCheckButton",
		"MageNugOptionsFrame_CheckButtonCC",
		"MageNugOptionsFrame_CheckButtonMG",
		"MageNugOptionsFrame_CheckButtonMGcombat",
		"MageNugOptionsFrame_IgniteCheckButton",
		"MageNugOptionsFrame_ABcastCheckButton",
		"MageNugStatMonOptionFrame_CheckButton0",
		"MageNugStatMonOptionFrame_CheckButton1",
		"MageNugStatMonOptionFrame_CheckButton2",
		"MageNugMsgOptionFrame_CheckButton",
		"MageNugMsgOptionFrame_CheckButton2",
		"MageNugMsgOptionFrame_CheckButton3",
		"MageNugMsgOptionFrame_CheckButton4",
		"MageNugMsgOptionFrame_CheckButton5",
		"MageNugMsgOptionFrame_CheckButton6",
		"MageNugSoundOptionFrame_MICheckButton",
		"MageNugSoundOptionFrame_ProcCheckButton",
		"MageNugSoundOptionFrame_PolyCheckButton",
		"MageNugSoundOptionFrame_HotStreakCheckButton",
		"MageNugSoundOptionFrame_ImpactCheckButton",
		"MageNugSoundOptionFrame_FoFCheckButton",
		"MageNugSoundOptionFrame_BrainFreezeCheckButton",
		"MageNugSoundOptionFrame_CauterizeCheckButton",
		"MageNugSoundOptionFrame_TimeWarpCheckButton",
		"MageNugPriestOptionFrame_CheckButton3",
		"MageNugPriestOptionFrame_CheckButton2",
		"MageNugPriestOptionFrame_CheckButton0",
		"MageNugMoonkinOptionFrame_CheckButton",
		"MageNugMoonkinOptionFrame_CheckButton0",
		"MageNugMoonkinOptionFrame_CheckButton1",
		"MageNugMoonkinOptionFrame_CheckButton2",
		"MageNugMoonkinOptionFrame_CheckButton3",
		"MageNugMoonkinOptionFrame_CheckButtonMin",
		"MageNugMoonkinOptionFrame_ProcCheckButton",
		"MageNugMoonkinOptionFrame_CastCheckButton",
		"MageNugMoonkinOptionFrame_CheckButtonAnchor",
		"MageNugOption2Frame_MinimapCheckButton",
		"MageNugOption2Frame_CameraCheckButton",
		"MageNugOption2Frame_ConsoleTextCheckButton",
		"MageNugOption2Frame_LockFramesCheckButton",
		"MageNugOption2Frame_CheckButtonTT",
		"MageNugOption2Frame_ClickThruCheckButton",
		"MageNugCooldownFrame_apButton",
		"MageNugCooldownFrame_bwButton",
		"MageNugCooldownFrame_cbButton",
		"MageNugCooldownFrame_csButton",
		"MageNugCooldownFrame_dfButton",
		"MageNugCooldownFrame_dbButton",
		"MageNugCooldownFrame_mwButton",
		"MageNugCooldownFrame_frzButton",
		"MageNugCooldownFrame_msButton",
		"MageNugCooldownFrame_ibrButton",
		"MageNugCooldownFrame_evoButton",
		"MageNugCooldownFrame_ivButton",
		"MageNugCooldownFrame_cdButton",
		"MageNugCooldownFrame_starfallButton",
		"MageNugCooldownFrame_treantButton",
		"MageNugCooldownFrame_miButton"
	};

	for i = 1, getn(nugCheckBox) do
		S:HandleCheckBox(_G[nugCheckBox[i]]);
	end
end

addon:RegisterSkin("MageNuggets", addon.MageNuggets);